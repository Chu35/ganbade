<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Retrieve memberId and knowledgeId from the request parameter
String memberId = request.getParameter("memberId");
String knowledgeId = request.getParameter("knowledgeId");

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
            int memberRowsAffected = memberStatement.executeUpdate();

            if (memberRowsAffected > 0) {
                out.println("Member deleted successfully.");
            } else {
                out.println("Failed to delete member. Member not found or an error occurred.");
            }
        }

        // Delete knowledge
        String knowledgeSql = "DELETE FROM knowledge WHERE id=?";
        try (PreparedStatement knowledgeStatement = conn.prepareStatement(knowledgeSql)) {
            knowledgeStatement.setString(1, knowledgeId);
            int knowledgeRowsAffected = knowledgeStatement.executeUpdate();

            if (knowledgeRowsAffected > 0) {
                out.println("Knowledge deleted successfully.");
            } else {
                out.println("Failed to delete knowledge. Knowledge not found or an error occurred.");
            }
        }
        
        // Commit the transaction (if applicable)
        conn.commit();
    } catch (SQLException e) {
        out.println("SQL Exception: " + e.getMessage());
        e.printStackTrace();
    }
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}
%>
