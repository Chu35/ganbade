<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Include SweetAlert CSS and JS files -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@11"></link>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Your Page Title</title>
    <script>
        function showAlert(message, alertType) {
            Swal.fire({
                icon: alertType === 'success' ? 'success' : 'error',
                title: alertType === 'success' ? '成功' : '錯誤',
                text: message,
                timer: 1000,
                timerProgressBar: true,
                showConfirmButton: false
            }).then(() => {
                window.location.href = 'cms.jsp';
            });
        }
    </script> 
</head>
<body>
<%
    // Retrieve memberId and knowledgeId from the request parameter
    String memberId = request.getParameter("memberId");

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
                    // Display success message using SweetAlert
                    out.println("<script>showAlert('Member deleted successfully', 'success');</script>");
                } else {
                    // Display failure message using SweetAlert
                    out.println("<script>showAlert('Failed to delete member. Member not found or an error occurred.', 'error');</script>");
                }
            }

            conn.commit();
        } catch (SQLException e) {
            // Display SQL exception message using SweetAlert
            out.println("<script>showAlert('SQL Exception: " + e.getMessage() + "', 'error');</script>");
            e.printStackTrace();
        }
    } catch (Exception e) {
        // Display general exception message using SweetAlert
        out.println("<script>showAlert('An error occurred: " + e.getMessage() + "', 'error');</script>");
        e.printStackTrace();
    }
%>
</body>
</html>
