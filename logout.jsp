<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <% 
        // 獲取用戶名或其他識別信息
        String username = (String)session.getAttribute("username");
        
        // 設置登出時間
        Timestamp logoutTime = new Timestamp(System.currentTimeMillis());

        // 更新 MS SQL 中的登出時間
        String jdbcUrl = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
        String dbUsername = "chu";
        String dbPassword = "0725";
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            String updateQuery = "UPDATE member SET logouttime = ? WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setTimestamp(1, logoutTime);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 清除 Session
        session.invalidate();
    %>
    <script>
        window.location.href = "login.html"; // 跳轉到登入頁面
    </script>
</body>
</html>
