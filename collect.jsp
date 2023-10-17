<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <title>收藏</title>
</head>
<body>
    <%
    String memberName = (String) session.getAttribute("memberName");

    if (memberName != null && !memberName.isEmpty()) {
        String knowledgeId = request.getParameter("knowledge_id");

        if (knowledgeId != null && !knowledgeId.isEmpty()) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                Connection con = DriverManager.getConnection(url, "chu", "0725");

                // 查询是否已收藏
                String checkSql = "SELECT * FROM member_collect WHERE member_name = ? AND knowledge_id = ?";
                PreparedStatement checkPs = con.prepareStatement(checkSql);
                checkPs.setString(1, memberName);
                checkPs.setString(2, knowledgeId);
                ResultSet checkRs = checkPs.executeQuery();

                if (checkRs.next()) {
    %>
    <script>
        alert("已收藏了!");
    </script>
    <%
                } else {
                    // 未收藏，执行插入操作
                    String insertSql = "INSERT INTO member_collect (member_name, knowledge_id) VALUES (?, ?)";
                    PreparedStatement insertPs = con.prepareStatement(insertSql);
                    insertPs.setString(1, memberName);
                    insertPs.setString(2, knowledgeId);

                    int rowsInserted = insertPs.executeUpdate();

                    insertPs.close();

                    if (rowsInserted > 0) {
    %>
    <script>
        alert("收藏成功😍!!");
    </script>

    <%
                    } else {
    %>
    <script>
        alert("收藏失敗，請稍後重試😭");
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
        alert("收藏失敗，請稍後重試😭");
    </script>
    <%
            }
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