<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>收藏</title>
</head>
<body>
<%
// 检查是否已登录会员
String memberName = (String) session.getAttribute("memberName");

if (memberName != null && !memberName.isEmpty()) {
    String knowledgeId = request.getParameter("knowledge_id");

    if (knowledgeId != null && !knowledgeId.isEmpty()) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // 建立数据库连接
            String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
            String username = "chu";
            String password = "0725";
            connection = DriverManager.getConnection(url, username, password);

            // Check if the knowledge has already been collected
            String checkQuery = "SELECT COUNT(*) FROM member_collections WHERE member_name = ? AND knowledge_id = ?";
            preparedStatement = connection.prepareStatement(checkQuery);
            preparedStatement.setString(1, memberName);
            preparedStatement.setString(2, knowledgeId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next() && resultSet.getInt(1) == 0) {
                // Knowledge has not been collected, insert a new record
                String insertQuery = "INSERT INTO member_collections (member_name, knowledge_id) VALUES (?, ?)";
                preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, memberName);
                preparedStatement.setString(2, knowledgeId);
                int rowsInserted = preparedStatement.executeUpdate();

                if (rowsInserted > 0) {
%>
    <script>
        alert("收藏成功😍!!");
    </script>
<%
                }
            } else {
%>
    <script>
        alert("已被收藏😊");
    </script>
<%
            }
        } catch (SQLException e) {
            e.printStackTrace();
%>
    <script>
        alert("收藏失敗，請稍後重試😭");
    </script>
<%
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    } else {
%>
<%
    }
} else {
%>
    <script>
        var confirmed = confirm("請先登錄會員帳號以使用收藏功能");
        if (confirmed) {
            window.location.href = "login.html"; // Redirect to the login page
        } else {
            window.location.href = "knowl.jsp";
        }
    </script>
<%
}
%>
<script>
    window.location.href = "knowl.jsp";
</script>
</body>
</html>
