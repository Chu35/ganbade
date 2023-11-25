<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
    String user = "chu";
    String password = "0725";

    String id = request.getParameter("id");
    String newImgpath = request.getParameter("newImgpath");
    String newName = request.getParameter("newName");
    String newList = request.getParameter("newList");
    String newPrice = request.getParameter("newPrice");

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        try (Connection conn = DriverManager.getConnection(dbURL, user, password)) {
            String updateQuery = "UPDATE store SET imgpath=?, name=?, list=?, Price=? WHERE id=?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                pstmt.setString(1,newImgpath);
                pstmt.setString(2, newName);
                pstmt.setString(3, newList);
                pstmt.setString(4, newPrice);
                pstmt.setString(5, id);

                int rowsUpdated = pstmt.executeUpdate();

                // Check if rows were updated
                if (rowsUpdated > 0) {
%>
                    <script>
                        alert("Update successful!");
                        window.location.href = "cms.jsp";
                    </script>
<%
                } else {
%>
                    <script>
                        alert("No rows updated. Check your parameters."); 
                        window.location.href = "cms.jsp"; 
                    </script>
<%
                }
            }
        }
    } catch (SQLException se) {
        se.printStackTrace();
%>
    <script>
        alert("SQL Exception: <%= se.getMessage() %>"); 
        window.location.href = "cms.jsp"; 
    </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
    <script>
        alert("Error updating rows: <%= e.getMessage() %>"); 
        window.location.href = "cms.jsp";
    </script>
<%
    }
%>
