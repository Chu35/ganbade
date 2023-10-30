<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% String memberName = (String) session.getAttribute("memberName"); %>
<html>
    <head>
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
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
                <a href="index.jsp" class="nav-item nav-link">茶的一生</a>
                <div class="nav-item dropdown">
                    <a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調茶局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                        <a href="process.jsp" class="dropdown-item">製茶步驟介紹</a>
                        <a href="fix.jsp" class="dropdown-item">烘培發酵介紹</a>
                </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                <a href="#" class="nav-item nav-link">
                    <small class="fa fa-shopping-cart text-primary"></small>
                </a>
                <div class="nav-item dropdown">
                    <div id="user-icon" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <small class="fa fa-user text-primary"></small>
                    </div>
                    <div class="dropdown-menu border-light m-0">
                        <% if (memberName != null) { %>
                            <a class="dropdown-item"><%= memberName %>, 你好</a>
                        <% } else { %>
                            <a class="dropdown-item" href="login.html">登入/註冊</a>
                        <% } %>
                        <a href="index.jsp" class="dropdown-item">心理測驗</a>
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

 <!-- Map Start -->
<div class="container-xxl py-4">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s">
            <h1 class="display-3 mb-5"> </h1>
            <h1 class="display-5 mb-4">E-commerce Shop</h1>
        </div>
        <div class="product">
            <div class="ProductList-breadcrumb hidden-xs hidden-sm">
                <a class="Label" href="">全部商品</a>&ensp;/
                <a class="Label" href="">所有商品</a>&ensp;/
                <a class="Label" href="">熱賣商品</a>
            </div>
            <div class="ProductList-content">
                <div class="left-c-box hidden-xs hidden-sm">
                    <ul class="ProductList-categoryMenu">
                        <li class="List-item ProductList-nestedList js-productlist-nestedlist sl-dropdown  ng-isolate-scope is-collapsed"
                            is-collapsed="true" is-mobile-collapsed="true"> <a class="Label tertiary-hover-color"
                                link-highlight=" " href="">所有商品</a>
                            <ul id="product-list-nested-list-5ef172da7f424f0027fb70a4"
                                class="ProductList-nestedList-dropdown js-productlist-nestedlist-dropdown second-layer">
                                <li class="List-item second-layer-content" is-collapsed="true"
                                    is-mobile-collapsed="true"> <a class="Label primary-color-hover" link-highlight=""
                                        href=""> 本季新品 </a> </li>
                                <li class="List-item js-productlist-nestedlist second-layer-content" is-collapsed="true"
                                    is-mobile-collapsed="true"> <a class="Label primary-color-hover" link-highlight=""
                                        href=""> 熱賣商品
                                        <i class="fa fa-angle-right" href=""></i> </a>
                                    <ul class="ProductList-nestedList-dropdown NestedList-Wrapper js-productlist-nestedlist-dropdown"
                                        id="product-list-nested-list-63eef4fa1b7e440023f110b1">
                                        <li class="List-item"> <a class="Label primary-color-hover" link-highlight=""
                                                href=""> 熱賣日常必備 </a> </li>
                                    </ul>
                                </li>
                                <li class="List-item second-layer-content" is-collapsed="true"
                                    is-mobile-collapsed="true"> <a class="Label primary-color-hover" link-highlight=""
                                        href=""> 人生必喝清單📋 </a> </li>
                            </ul>
                        </li>
                        <li class="List-item ProductList-nestedList js-productlist-nestedlist sl-dropdown  ng-isolate-scope is-collapsed"
                            is-collapsed="true" is-mobile-collapsed="true"> <a class="Label tertiary-hover-color"
                                link-highlight="" href="">聯名系列</a>
                            <ul id="product-list-nested-list-65016c04fed20d0022574fb0"
                                class="ProductList-nestedList-dropdown js-productlist-nestedlist-dropdown second-layer">
                                <li class="List-item second-layer-content" is-collapsed="true"
                                    is-mobile-collapsed="true"> <a class="Label primary-color-hover" link-highlight=""
                                        href="">ganbade X 祥泰茶莊</a> </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="right-c-box">
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                    <div class="info">
                        <img src="https://via.placeholder.com/200" alt="Product Image">
                        <h2>Product Title</h2>
                        <p>Product Description</p>
                        <p>$10.00</p>
                        <button>Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<style>
    .product {
        display: flex;
        flex-wrap: wrap;
    }

    .product .info {
        width: 23%;
        padding: 10px;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .product img {
        max-width: 100%;
        margin: 0 auto;
    }

    .product .info h2 {
        margin: 5px;
    }

    .product .info p {
        margin: 7px;
    }

    .product .info button {
        max-width: 100%;
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #f1c40f;
        color: #fff;
        border: none;
        cursor: pointer;
    }

    .left-c-box {
        width: 20%;
        padding: 25px 23px 0;
    }

    .right-c-box {
        width: 78%;
        margin-left: auto;
        display: flex;
        flex-wrap: wrap;
    }

    .ProductList-breadcrumb.hidden-xs {
        position: relative;
    }
    .ProductList-content {

    display: flex;
}
</style>
<!-- Map End -->

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

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
</html>