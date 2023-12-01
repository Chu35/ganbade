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

                    // Check if already in the cart
                    String checkSql = "SELECT * FROM cart WHERE member_name = ? AND store_id = ?";
                    PreparedStatement checkPs = con.prepareStatement(checkSql);
                    checkPs.setString(1, memberName);
                    checkPs.setString(2, storeId);
                    ResultSet checkRs = checkPs.executeQuery();

                    if (checkRs.next()) {
                        // If already in the cart, update the quantity
                        int currentQuantity = checkRs.getInt("quantity");
                        int newQuantity = currentQuantity + 1;

                        String updateSql = "UPDATE cart SET quantity = ? WHERE member_name = ? AND store_id = ?";
                        PreparedStatement updatePs = con.prepareStatement(updateSql);
                        updatePs.setInt(1, newQuantity);
                        updatePs.setString(2, memberName);
                        updatePs.setString(3, storeId);
                        updatePs.executeUpdate();

                        updatePs.close();
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
                        // If not in the cart, insert a new record with the current timestamp
                        String insertSql = "INSERT INTO cart (member_name, store_id, quantity, created_at) VALUES (?, ?, 1, CURRENT_TIMESTAMP)";
                        PreparedStatement insertPs = con.prepareStatement(insertSql);
                        insertPs.setString(1, memberName);
                        insertPs.setString(2, storeId);

                        int rowsInserted = insertPs.executeUpdate();

                        insertPs.close();

                        if (rowsInserted > 0) {
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
</body>
</html>
