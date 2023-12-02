<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% 
String memberName = (String) session.getAttribute("memberName");
Integer totalQuantity = (Integer) session.getAttribute("totalQuantity_" + memberName);
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Checkout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .product-image {
            width: 50px;
        }

        .cart-items {
            border-bottom: 1px solid #dee2e6;
            margin-bottom: 10px;
            padding-bottom: 10px;
        }

        .delete-item {
            color: red;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <i onclick="history.back()" style="cursor: pointer;">← Go Back</i>
    <h2 class="text-center">Checkout</h2>
    
    <div class="row mt-4">
        <div class="col-md-6">
            <h4>Order</h4>
            <div class="mt-4">
                <table class="table">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connection conn = null;
                        PreparedStatement preparedStatement = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                            String user = "chu";
                            String password = "0725";
                            conn = DriverManager.getConnection(url, user, password);
                
                            String query = "SELECT store.id, store.name, store.imgpath, store.price, quantity "
                                    + "FROM cart "
                                    + "INNER JOIN store ON cart.store_id = store.id "
                                    + "WHERE member_name = ?";
                
                            preparedStatement = conn.prepareStatement(query);
                            preparedStatement.setString(1, memberName);
                            rs = preparedStatement.executeQuery();
                
                            while (rs.next()) {
                    %>
                    <tr class="cart-items text-center">    
                        <td>
                            <img src="<%= rs.getString("imgpath") %>" style="width:50px" alt="<%= rs.getString("name") %>">
                        </td>
                        <td style="text-align: center;vertical-align: middle"><%= rs.getString("name") %></td>
                        <td style="text-align: center;vertical-align: middle"><%= Math.round(rs.getDouble("price")) %></td>
                        <td style="text-align: center;vertical-align: middle"><%= rs.getString("quantity") %></td>
                    </tr>
                        
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close database resources
                            try { if (rs != null) rs.close(); } catch (Exception e) { /* Ignore */ }
                            try { if (preparedStatement != null) preparedStatement.close(); } catch (Exception e) { /* Ignore */ }
                            try { if (conn != null) conn.close(); } catch (Exception e) { /* Ignore */ }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-6">
            <h4>Shipping Information</h4>
            <form>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" placeholder="Enter your full name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Enter your address" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
