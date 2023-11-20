<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>後臺管理</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <%
            String username = request.getParameter("username");
            String pwd = request.getParameter("pwd");

            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                String dbUser = "chu";
                String dbPassword = "0725";

                try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
                     PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM admin WHERE username = ? AND pwd = ?")) {

                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, pwd);

                    try (ResultSet rs = preparedStatement.executeQuery()) {
                        if (rs.next()) {
                            %>
                            <script>
                                alert("登入成功\n<%= username %> 歡迎光臨!!");
                                window.location.href = "cms.jsp";
                            </script>
                            <%
                        } else {
                             %>
                            <script>
                                alert("登入失敗\n請確保用戶名和密碼正確。");
                                window.location.href = "admin.html";
                            </script>
                            <%
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                %>
                <script>
                alert("發生錯誤！\n<%= e.toString() %>");
                window.location.href = "admin.html";
                </script>
                <%
            }
            %>
        </div>
</body>
</html>
