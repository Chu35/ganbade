<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Include SweetAlert library from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%
    String memberName = (String) session.getAttribute("memberName");
    int rowsAffected = 0; // Initialize rowsAffected outside the try-catch block

    // Retrieve form data
    String fullName = request.getParameter("fullName");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
        String user = "chu";
        String password = "0725";
        conn = DriverManager.getConnection(url, user, password);

        // Update the member information
        String updateMemberSql = "UPDATE member " +
                                 "SET fullname=?, phone=?, address=?, email=? " +
                                 "WHERE name IN (SELECT member.name " +
                                                "FROM member " +
                                                "INNER JOIN cart ON member.name = cart.member_name " +
                                                "WHERE cart.member_name = ?)";

        try (PreparedStatement updateMemberPs = conn.prepareStatement(updateMemberSql)) {
            updateMemberPs.setString(1, fullName);
            updateMemberPs.setString(2, phone);
            updateMemberPs.setString(3, address);
            updateMemberPs.setString(4, email);
            updateMemberPs.setString(5, memberName);
            rowsAffected = updateMemberPs.executeUpdate(); // Update rowsAffected here
        }

        // Your existing code to update member information
        String updateQuery = "UPDATE member SET fullname=?, phone=?, address=?, email=? WHERE member_name=?";
        preparedStatement = conn.prepareStatement(updateQuery);
        preparedStatement.setString(1, fullName);
        preparedStatement.setString(2, phone);
        preparedStatement.setString(3, address);
        preparedStatement.setString(4, email);
        preparedStatement.setString(5, memberName);
        rowsAffected = preparedStatement.executeUpdate(); // Update rowsAffected here

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        try { if (preparedStatement != null) preparedStatement.close(); } catch (Exception e) { /* Ignore */ }
        try { if (conn != null) conn.close(); } catch (Exception e) { /* Ignore */ }
    }
%>
    <!-- Inside your JSP script tag, after the update operation -->
    <%
        if (rowsAffected > 0) {
    %>
            <!-- Success alert -->
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Update Successful',
                    text: 'Member information has been updated successfully!',
                    showConfirmButton: false,
                    timer: 2000
                }).then(function () {
                    window.location.href = "store.jsp";
                });
            </script>
    <%
        } else {
    %>
            <!-- Error alert -->
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Update Failed',
                    text: 'Failed to update member information. Please try again.',
                    showConfirmButton: false,
                    timer: 2000
                }).then(function () {
                    window.location.href = "checkout.jsp";
                });
            </script>
    <%
        }
    %>
</body>
</html>
