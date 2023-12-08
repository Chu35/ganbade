<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
    String memberName = (String) session.getAttribute("memberName"); 
%>
<html>
<head>
    <!-- Include any necessary head elements here -->
</head>
<body>
<%
    String memberId = request.getParameter("memberId");
    String knowledgeId = request.getParameter("knowledgeId");
    String funId = request.getParameter("funId");
    String storeId = request.getParameter("storeId");
    String sugardaddyId = request.getParameter("sugardaddyId");

    // JDBC URL, username, and password of SQL Server
    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
    String user = "chu";
    String password = "0725";

    try {
        // Load the JDBC driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
            // Delete member
            String memberSql = "DELETE FROM member WHERE id=?";
            try (PreparedStatement memberStatement = conn.prepareStatement(memberSql)) {
                memberStatement.setString(1, memberId);
                memberStatement.executeUpdate();
            }

            // Delete knowledge
            String knowledgeSql = "DELETE FROM knowledge WHERE id=?";
            try (PreparedStatement knowledgeStatement = conn.prepareStatement(knowledgeSql)) {
                knowledgeStatement.setString(1, knowledgeId);
                knowledgeStatement.executeUpdate();
            }

            // Delete fun
            String funSql = "DELETE FROM fun WHERE id=?";
            try (PreparedStatement funStatement = conn.prepareStatement(funSql)) {
                funStatement.setString(1, funId);
                funStatement.executeUpdate();
            }

            // Delete store
            String storeSql = "DELETE FROM store WHERE id=?";
            try (PreparedStatement storeStatement = conn.prepareStatement(storeSql)) {
                storeStatement.setString(1, storeId);
                storeStatement.executeUpdate();
            }

            // Delete sugardaddy
            String sugardaddySql = "DELETE FROM sugardaddy WHERE id=?";
            try (PreparedStatement sugardaddyStatement = conn.prepareStatement(sugardaddySql)) {
                sugardaddyStatement.setString(1, sugardaddyId);
                sugardaddyStatement.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<script>
    window.location.href = "cms.jsp";
</script>

</body>
</html>
