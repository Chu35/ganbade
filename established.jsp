<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <title>checkout</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
String memberName = (String) session.getAttribute("memberName");

// Get form data
String id = request.getParameter("id"); // Add this line to get the member ID
String fullname = request.getParameter("fullName"); // Correct the parameter name to match the form
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String email = request.getParameter("email");

// JDBC connection
String jdbcUrl = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
String dbUser = "chu";
String dbPassword = "0725";

// Initialize variable for success or failure
boolean isSuccess = false;

try {
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

    // Update data in the member table
    String updateQuery = "UPDATE member SET fullname = ?, phone = ?, address = ?, email = ? WHERE memberName = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
        preparedStatement.setString(1, fullname);
        preparedStatement.setString(2, phone);
        preparedStatement.setString(3, address);
        preparedStatement.setString(4, email);
        preparedStatement.setString(5, memberName); // Use memberName for WHERE clause

        // Check if the update was successful
        isSuccess = preparedStatement.executeUpdate() > 0;
    }

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<%
// Show SweetAlert message based on success or failure
if (isSuccess) {
%>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Data has been updated successfully.',
            showConfirmButton: false,
            timer: 2000 // Close after 2 seconds
        }).then(() => {
            // Redirect to a success page if needed
            window.location.href = 'success.jsp';
        });
    </script>
<%
} else {
%>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: 'Failed to update data. Please try again.',
            showConfirmButton: false,
            timer: 2000 // Close after 2 seconds
        }).then(() => {
            // Redirect to an error page or back to the form if needed
            window.location.href = 'checkout.jsp';
        });
    </script>
<%
}
%>

</body>
</html>
