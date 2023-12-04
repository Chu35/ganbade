<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<% 
   String memberName = (String) session.getAttribute("memberName"); 
%>
<html lang="zh-Hant-TW">
<head>
    <title>刪除資料</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

                // Delete by fun_id
                String deleteSql = "DELETE FROM member_collect WHERE fun_id = ?";
                deleteStmt = conn.prepareStatement(deleteSql);
                
                String idToDelete = request.getParameter("fun_id");
                deleteStmt.setString(1, idToDelete);
                
                deleteStmt.executeUpdate();

                // Delete by knowledge_id
                String deleteSql2 = "DELETE FROM member_collect WHERE knowledge_id = ?";
                PreparedStatement deleteStmt2 = conn.prepareStatement(deleteSql2);
                
                String knowledgeIdToDelete = request.getParameter("knowledge_id");
                deleteStmt2.setString(1, knowledgeIdToDelete);
                
                deleteStmt2.executeUpdate();

    %>
    <script>
        Swal.fire({
            icon: 'success',
            title: '成功',
            text: '資料已刪除',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then(() => {
            if ("<%= idToDelete %>" !== "") {
            window.location.href = "member.jsp#nav-mission";
        } else if ("<%= knowledgeIdToDelete %>" !== "") {
            window.location.href = "member.jsp#nav-story";
        }
        });
    </script>

    <%
            } catch (Exception e) {
                e.printStackTrace();
    %>
    <script>
        Swal.fire({
            icon: 'error',
            title: '失敗',
            text: '請在試一次',
            timer: 1000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then(() => {
                    window.location.href = "member.jsp";
                });
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
