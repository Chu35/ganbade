<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% 
String memberName = (String) session.getAttribute("memberName");
String storeName = (String) session.getAttribute("storeName");
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
    <h2>Checkout</h2>
    
    <div class="row mt-4">
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

        <div class="col-md-6">
            <h4>Order Summary</h4>
            <div class="mt-4">
                <table class="table">
                    <thead>
                        <tr class="text-center">
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                            String user = "chu";
                            String password = "0725";
                            conn = DriverManager.getConnection(url, user, password);
                            stmt = conn.createStatement();
                            String query = "SELECT store.id, store.name, store.imgpath, store.price FROM member_collect " +
                                           "INNER JOIN store ON member_collect.store_name = store.name " +
                                           "WHERE member_name = ?";
                            PreparedStatement preparedStatement = conn.prepareStatement(query);
                            preparedStatement.setString(1, memberName);
                            rs = preparedStatement.executeQuery();
                            
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String imgpath = rs.getString("imgpath");
                                double price = rs.getDouble("price");
                        %>
                        <tr class="cart-items">    
                            <td>
                                <img src="<%= rs.getString("imgpath") %>" class="product-image" alt="<%= rs.getString("name") %>">
                            </td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= Math.round(rs.getDouble("price")) %></td>
                            <td>
                                <div class="input-group">
                                    <button class="btn btn-primary">-</button>
                                    <input type="number" class="form-control" value="1">
                                    <button class="btn btn-primary">+</button>
                                </div>
                            </td>
                            <td>
                                <a class="delete-item" href="deletecart.jsp?store_name=<%= rs.getString("name") %>">🗑️</a>
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close database resources
                            try { if (rs != null) rs.close(); } catch (Exception e) { /* Ignore */ }
                            try { if (stmt != null) stmt.close(); } catch (Exception e) { /* Ignore */ }
                            try { if (conn != null) conn.close(); } catch (Exception e) { /* Ignore */ }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
