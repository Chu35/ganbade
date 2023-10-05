<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu</title>
</head>
<body>
    <div class="container">
        <div id="menu" class="row">
            <% 
                try {
                    // Establish a database connection
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                    String username = "chu";
                    String password = "0725";
                    Connection conn = DriverManager.getConnection(dbURL, username, password);

                    // Execute SQL query to retrieve product data
                    Statement stmt = conn.createStatement();
                    String query = "SELECT * FROM knowledge";
                    ResultSet rs = stmt.executeQuery(query);

                    // Generate HTML dynamically based on the data
                    while (rs.next()) {
                        String id = rs.getString("id");
                        String name = rs.getString("name");

                        out.println("<div class='col-3'>");
                        out.println("    <div class='card'>");
                        out.println("        <div class='card-body'>");
                        out.println("            <h5 class='card-title'>" + name + "</h5>");
                        out.println("            <a href='#' class='btn btn-primary order-btn'>加入購物車</a>");
                        out.println("        </div>");
                        out.println("    </div>");
                        out.println("</div>");
                    }

                    // Close resources
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            %>
        </div>
    </div>
</body>
</html>
