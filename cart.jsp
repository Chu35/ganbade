<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <title>購物車</title>
</head>
<body>
    <%
        String memberName = (String) session.getAttribute("memberName");

        if (memberName != null && !memberName.isEmpty()) {
            String storeName = request.getParameter("store_name");

            if (storeName != null && !storeName.isEmpty()) {
                // Store the storeName in the session
                session.setAttribute("storeName", storeName);

                Connection con = null;

                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                    con = DriverManager.getConnection(url, "chu", "0725");

                    // Perform insertion without checking if the item is already in the cart
                    String insertSql = "INSERT INTO member_collect (member_name, store_name) VALUES (?, ?)";
                    try (PreparedStatement insertPs = con.prepareStatement(insertSql)) {
                        insertPs.setString(1, memberName);
                        insertPs.setString(2, storeName);
                        int rowsInserted = insertPs.executeUpdate();

                        if (rowsInserted > 0) {
    %>
                            <script>
                                window.location.href = "store.jsp";
                            </script>
    <%
                        } else {
    %>
                            <script>
                                alert("加入失敗，請稍後重試😭");
                                window.location.href = "store.jsp";
                            </script>
    <%
                        }
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
    %>
                    <script>
                        alert("加入失敗，請稍後重試😭");
                        window.location.href = "store.jsp";
                    </script>
    <%
                } finally {
                    try {
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
    %>
            <script>
                var confirmed = confirm("請先登錄會員帳號以使用收藏功能");
                if (confirmed) {
                    window.location.href = "login.html"; // Redirect to the login page
                } else {
                    window.location.href = "store.jsp";
                }
            </script>
    <%
        }

        // Count items by member_name
        int itemCount = 0;

        if (memberName != null) {
            Connection conn = null;
            PreparedStatement countStmt = null;
            ResultSet countResult = null;

            try {
                String dbUrl = "jdbc:sqlserver://127.0.0.1:1433;databaseName=109_ganbade";
                String dbUser = "chu";
                String dbPassword = "0725";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                String countSql = "SELECT COUNT(store_name) AS item_count FROM member_collect WHERE member_name = ?";
                countStmt = conn.prepareStatement(countSql);
                countStmt.setString(1, memberName);
                countResult = countStmt.executeQuery();

                if (countResult.next()) {
                    itemCount = countResult.getInt("item_count");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (countResult != null) countResult.close();
                    if (countStmt != null) countStmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Store the itemCount in the session
        session.setAttribute("itemCount", itemCount);
    %>

</body>
</html>
