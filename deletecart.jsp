<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<% 
   String memberName = (String) session.getAttribute("memberName"); 
%>
<html lang="zh-Hant-TW">
<head>
    <title>刪除資料</title>
</head>
<body>
    <%
        if (memberName != null) {
            Connection conn = null;
            PreparedStatement deleteStmt = null;

            try {
                String dbUrl = "jdbc:sqlserver://127.0.0.1:1433;databaseName=109_ganbade";
                String dbUser = "chu";
                String dbPassword = "0725";
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                // Delete by store_name
                String deleteSql = "DELETE FROM member_collect WHERE store_name = ?";
                deleteStmt = conn.prepareStatement(deleteSql);
                
                String idToDelete = request.getParameter("store_name");
                deleteStmt.setString(1, idToDelete);
                
                int rowsAffected = deleteStmt.executeUpdate();
    
                if (rowsAffected > 0) {
                    %>
                        <script>
                            window.location.href = "store.jsp";
                        </script>
                    <%
                    } else {
                    %>
                        <script>
                            alert("刪除失敗，請檢查資料!");
                            window.location.href = "store.jsp";
                        </script>
                    <%
                    }
                    
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <script>
                    // Handle the error if needed
                    alert("刪除時發生錯誤，請稍後再試或聯絡系統管理員!");
                    window.location.href = "store.jsp";
                </script>
    <%
            } finally {
                // Close resources in a finally block
                try {
                    if (deleteStmt != null) {
                        deleteStmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
