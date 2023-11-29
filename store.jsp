<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% 
String memberName = (String) session.getAttribute("memberName");
Integer itemCount = (Integer) session.getAttribute("itemCount"); 
%>

    <head>
<html>
        <meta charset="utf-8">
        <title>甘吧茶ㄉㄟˊ</title>
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta content="" name="keywords">
        <meta content="" name="description">
    
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
    
        <!-- Google Web Fonts 字型 -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
            rel="stylesheet">
    
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
            integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
    
    
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
<body>
    
    <!-- Spinner Start -->
	<div id="spinner" class="show position-fixed ">
		<div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
	</div>
    <!-- Spinner End -->

<!-- Navbar Start -->
<div class="container-fluid fixed-top px-0 wow fadeIn top-0" data-wow-delay="0.1s">
    <div class="row gx-0 align-items-center d-none d-lg-flex"> </div>
    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-4 wow fadeIn" data-wow-delay="0.1s">
        <a class="navbar-brand logo" href="index.jsp">
            <img src="img/logo.png" alt="Website Logo" width="70px" />
        </a>
        <a href="index.jsp" class="navbar-brand ms-4 ms-lg-0">
            <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="index.jsp" class="nav-item nav-link">首頁</a>
                <div class="nav-item dropdown">
                    <a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調茶局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                        <a href="crafts.jsp" class="dropdown-item">烘培發酵介紹</a>
                </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                <a href="#" class="nav-item nav-link">
                    <small class="fa fa-shopping-cart text-primary" data-toggle="modal" data-target="#cart">
                        <span class="total-count"><%= itemCount != null ? itemCount : 0 %></span>
                    </small>                                                           
                </a>
                <div class="nav-item dropdown">
                    <div id="user-icon" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <small class="fa fa-user text-primary"></small>
                    </div>
                    <div class="dropdown-menu border-light m-0">
                        <% if (memberName != null) { %>
                            <span class="dropdown-item disabled-text"><%= memberName %>, 你好</span>								<% } else { %>
                            <a class="dropdown-item" href="login.html">登入/註冊</a>
                        <% } %>
                        <a href="member.jsp" class="dropdown-item">會員中心</a>
                        <% if (memberName != null) { %>
                            <a class="dropdown-item" href="logout.jsp">登出</a>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>

 <!-- store -->
<div class="container-xxl py-4">
    <div class="container">
        <div class="text-center mx-auto">
            <h1 class="display-3 mb-5"> </h1>
            <h1 class="display-5 mb-4">E-commerce Shop</h1>
        </div>
        <div class="product">
            <div class="leftlist">
                <div class="ProductList-breadcrumb hidden-xs hidden-sm">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href=" ">全部</a></li>
                            <li class="breadcrumb-item active" aria-current="page"></li>
                        </ol>
                    </nav>
                </div>
                <div class="left-c-box hidden-xs">
                    <ul class="ProductList-categoryMenu">
                        <li class="category" data-list="本季新品">本季新品</li>
                        <li class="category" data-list="熱賣商品">熱賣商品</li>
                        <li class="category" data-list="聯名系列">聯名系列</li>
                        <li class="category" data-list="人生必喝清單📋">人生必喝清單📋</li>
                        <li class="category" data-list="聯名系列" onclick="toggleSubcategory('collaborations')">聯名系列&ensp;<i
                                class="fa fa-angle-right"></i></li>
                        <div class="subcategory" id="collaborations" style="display: none;">
                            <ul>
                                <li class="category" data-list="ganbade X 祥泰茶莊">ganbade X 祥泰茶莊</li>
                            </ul>
                        </div>
                    </ul>
                </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <script>
                $(document).ready(function () {
                    $(".category").on("click", function () {
                        var categoryText = $(this).data("list");
                        $(".breadcrumb-item.active").text(categoryText);
                        $(".ProductList-breadcrumb").show();
                    });
                });
            </script>
                <div class="right-c-box">
                    <div class="container mb-5">
                        <div class="row" style="justify-content:flex-start;">
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
                            String query = "SELECT * FROM store";
                            rs = stmt.executeQuery(query);
                
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String name = rs.getString("name");
                                String imgpath = rs.getString("imgpath");
                                String list = rs.getString("list");
                                double price = rs.getDouble("price");  
                        %>
                        <div class="shopping" data-list="<%= list %>">
                            <img class="card-img-top" src="<%= imgpath %>" alt="<%= name %>">
                            <div class="card-block">
                                <h4 class="card-title"><%= name %></h4>
                                <p class="card-text">NT$ <%= Math.round(price) %></p>
                                <a href="cart.jsp?store_name=<%= rs.getString("name") %>" data-name="<%= name %>" data-price="<%= price %>" class="add-to-cart btn btn-primary">Add to cart</a>
                            </div>
                        </div>
                        <style>
                        .hidden {
                            display: none;
                        }
                        </style>
                        <% 
                    }
                } catch (Exception e) {
                 e.printStackTrace();
                } finally {
                      // Close database resources
                      try { rs.close(); } catch (Exception e) { /* Ignore */ }
                      try { stmt.close(); } catch (Exception e) { /* Ignore */ }
                      try { conn.close(); } catch (Exception e) { /* Ignore */ }
                    }
                    %>
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            var categoryItems = document.querySelectorAll('.ProductList-categoryMenu .category');
                    
                            categoryItems.forEach(function (item) {
                                item.addEventListener('click', function () {
                                    var selectedCategory = item.getAttribute('data-list');
                                    filterProducts(selectedCategory);
                                });
                            });
                        });
                        function toggleSubcategory(subcategoryId) {
                            var subcategory = document.getElementById(subcategoryId);
                            subcategory.style.display = subcategory.style.display === 'none' ? 'block' : 'none';
                        }
                        function filterProducts(category) {
                            var productItems = document.querySelectorAll('.right-c-box .shopping');
                    
                            productItems.forEach(function (product) {
                                var productCategory = product.getAttribute('data-list');
                    
                                if (productCategory === category || category === "全部") {
                                    product.classList.remove('hidden');
                                } else {
                                    product.classList.add('hidden');
                                }
                            });
                        }
                    </script>
                </div>
            </div>
                
                <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
                                <span class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true"
                                    style="font-size: 1.5em; cursor: pointer;">&times;</span>
                            </div>
                            <div class="modal-body">
                                <table class="show-cart table">
                                    <% 
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
                                            <img src="<%= imgpath %>" style="width:50px" alt="<%= name %>">
                                        </td>
                                        <td><%= name %></td>
                                        <td><%= Math.round(price) %></td>
                                        <td>
                                            <div class="input-group">
                                                <button class="minus-item input-group-addon btn btn-primary" data-name="<%= name %>">-</button>
                                                <input type="number" class="item-count form-control" data-name="<%= name %>" value="1">
                                                <button class="plus-item btn btn-primary input-group-addon" data-name="<%= name %>">+</button>
                                            </div>
                                        </td>
                                        <td>
                                            <a id="deleteLink" class="delete-item" href="deletecart.jsp?store_name=<%= rs.getString("name") %>"  style="border: none; background: none;">🗑️</a>
                                        </td>
                                    </tr>
                                    
                                    <style>
                                    .table td {
                                        text-align: center;
                                        vertical-align: middle!important;
                                    }
                                    </style>
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
                                </table>
                                <div>Total price: $<span class="total-cart"></span></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">結帳</button>
                            </div>                 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- store -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
    <i class="bi bi-arrow-up"></i>
</a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/counterup/counterup.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>