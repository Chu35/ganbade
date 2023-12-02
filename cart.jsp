<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <title>收藏</title>
    <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%
        String memberName = (String) session.getAttribute("memberName");

        if (memberName != null && !memberName.isEmpty()) {
            String storeId = request.getParameter("store_id");

            if (storeId != null && !storeId.isEmpty()) {
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                    Connection con = DriverManager.getConnection(url, "chu", "0725");

                    // 檢查是否已經在購物車中
                    String checkSql = "SELECT * FROM cart WHERE member_name = ? AND store_id = ?";
                    PreparedStatement checkPs = con.prepareStatement(checkSql);
                    checkPs.setString(1, memberName);
                    checkPs.setString(2, storeId);
                    ResultSet checkRs = checkPs.executeQuery();

                    if (checkRs.next()) {
                        int currentQuantity = checkRs.getInt("quantity");
                        int newQuantity = currentQuantity;

                        String action = request.getParameter("action");

                        if ("increase".equals(action)) {
                            newQuantity += 1;
                        } else if ("decrease".equals(action)) {
                            newQuantity = Math.max(currentQuantity - 1, 0);
                        }

                        if ("delete".equals(action) || newQuantity == 0) {
                            // Delete the item
                            String deleteSql = "DELETE FROM cart WHERE member_name = ? AND store_id = ?";
                            try (PreparedStatement deletePs = con.prepareStatement(deleteSql)) {
                                deletePs.setString(1, memberName);
                                deletePs.setString(2, storeId);
                                int rowsDeleted = deletePs.executeUpdate();
                        
                                if (rowsDeleted > 0) {
                                    // After deleting, update quantity and total quantity in the session
                                    session.setAttribute("quantity_" + memberName, 0);
                                    int totalQuantity = getTotalQuantityFromDatabase(con, memberName);
                                    session.setAttribute("totalQuantity_" + memberName, totalQuantity);
                        %>
                                    <script>
                                        Swal.fire({
                                            icon: 'success',
                                            text: '成功删除!',
                                            timer: 1000,
                                            timerProgressBar: true,
                                            showConfirmButton: false
                                        }).then(function () {
                                                <% if ("delete".equals(action)) { %>
                                                window.location.href = "checkout.jsp";
                                                <% } else if (newQuantity == 0) { %>
                                                window.location.href = "store.jsp";
                                                <% } %>
                                            });
                                    </script>
    <%
                                } else {
    %>
                                    <script>
                                        Swal.fire({
                                            icon: 'error',
                                            text: '删除失败，请稍后重试!'
                                        });
                                    </script>
    <%
                                }
                                return; // No need to continue processing after deletion
                            }
                        }

                        // Update item in the cart
                        String updateSql = "UPDATE cart SET quantity = ? WHERE member_name = ? AND store_id = ?";
                        try (PreparedStatement updatePs = con.prepareStatement(updateSql)) {
                            updatePs.setInt(1, newQuantity);
                            updatePs.setString(2, memberName);
                            updatePs.setString(3, storeId);
                            updatePs.executeUpdate();
                        }

                        // After updating, update quantity and total quantity in the session
                        session.setAttribute("quantity_" + memberName, newQuantity);
                        int totalQuantity = getTotalQuantityFromDatabase(con, memberName);
                        session.setAttribute("totalQuantity_" + memberName, totalQuantity);
    %>
    <script>
        Swal.fire({
            icon: 'success',
            text: '成功!',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then(function() {
            // Check the current page and redirect accordingly
            var currentPage = window.location.href;
    
            if (currentPage.includes("store.jsp")) {
                // If on store.jsp, redirect to store.jsp
                window.location.href = "store.jsp";
            } else if (currentPage.includes("checkout.jsp")) {
                // If on checkout.jsp, redirect to checkout.jsp
                window.location.href = "checkout.jsp";
            } else {
                // Default redirection, you may want to adjust this based on your use case
                window.location.href = "store.jsp";
            }
        });
    </script>
    <%
                    } else {
                        // 如果不在購物車，插入一條新的記錄
                        String insertSql = "INSERT INTO cart (member_name, store_id, quantity, created_at) VALUES (?, ?, 1, CURRENT_TIMESTAMP)";
                        try (PreparedStatement insertPs = con.prepareStatement(insertSql)) {
                            insertPs.setString(1, memberName);
                            insertPs.setString(2, storeId);

                            int rowsInserted = insertPs.executeUpdate();

                            if (rowsInserted > 0) {
                                // After inserting, update quantity and total quantity in the session
                                session.setAttribute("quantity_" + memberName, 1);
                                int totalQuantity = getTotalQuantityFromDatabase(con, memberName);
                                session.setAttribute("totalQuantity_" + memberName, totalQuantity);
    %>
                                <script>
                                    Swal.fire({
                                        icon: 'success',
                                        text: '成功!',
                                        timer: 1000,
                                        timerProgressBar: true,
                                        showConfirmButton: false
                                    }).then(function() {
                                        window.location.href = "store.jsp";
                                    });
                                </script>
    <%
                            } else {
    %>
                                <script>
                                    Swal.fire({
                                        icon: 'error',
                                        text: '失败，请稍后重试!'
                                    });
                                </script>
    <%
                            }
                        }
                    }

                    checkRs.close();
                    checkPs.close();
                    con.close();

                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
    %>
                    <script>
                        Swal.fire({
                            icon: 'error',
                            text: '数据库错误，请稍后重试!'
                        });
                    </script>
    <%
                }
            }
        } 
    %>

    <!-- Function to get the total quantity for a member from the database -->
    <%!
        private int getTotalQuantityFromDatabase(Connection con, String memberName) throws SQLException {
            String totalQuantitySql = "SELECT SUM(quantity) AS totalQuantity FROM cart WHERE member_name = ?";
            try (PreparedStatement totalQuantityPs = con.prepareStatement(totalQuantitySql)) {
                totalQuantityPs.setString(1, memberName);
                ResultSet totalQuantityRs = totalQuantityPs.executeQuery();

                if (totalQuantityRs.next()) {
                    return totalQuantityRs.getInt("totalQuantity");
                }

                return 0; // Default to 0 if no records found
            }
        }
    %>

</body>
</html>