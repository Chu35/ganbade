<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Retrieve memberId from the request parameter
String memberId = request.getParameter("memberId");

// JDBC URL, username, and password of SQL Server
String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
String user = "chu";
String password = "0725";

try {
    // Load the JDBC driver
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    // Establish a connection
    try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
        // Create a SQL query
        String sql = "DELETE FROM member WHERE id=?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            // Set the parameter in the query
            preparedStatement.setString(1, memberId);

            // Execute the query
            int rowsAffected = preparedStatement.executeUpdate();

            // Handle the result as needed (e.g., check if the deletion was successful)
            if (rowsAffected > 0) {
                out.println("Member deleted successfully.");
            } else {
                out.println("Failed to delete member. Member not found or an error occurred.");
            }
        }
    }
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}
%>