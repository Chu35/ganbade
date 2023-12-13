<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% String memberName = (String) session.getAttribute("memberName"); %>
<html>
<head>
    <meta charset="utf-8">
    <title>甘吧茶ㄉㄟˊ</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
        <img src="img/logo.png" alt="Website Logo" width="70px"/>
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
					<a href="index.jsp#home" class="nav-item nav-link">首頁</a>
					<div class="nav-item dropdown">
						<a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="true">知識調茶局</a>
						<div class="dropdown-menu border-light m-0" data-bs-popper="none">
							<a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
							<a href="story.jsp" class="dropdown-item">故事專訪</a>
						</div>
					</div>
					<a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
					<a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                    <a href="store.jsp" class="nav-item nav-link">滴滴商城</a>
					<div class="nav-item dropdown">
						<div id="user-icon" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><small
							class="fa fa-user text-primary"></small></div>
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
			</div>
		</nav>
	</div>
    <!-- Navbar End -->

    <div class="container-xxl py-4"></div>
	<div class="container-xxl py-4">
    <div class="center">
        <div class="text-center mx-auto" style="max-width: 700px;">
            <h1 class="display-5 mb-4"> </h1>
            <h3 class="display-5 mb-4">團隊研發中</h3>
			<img src="img/construction.png" alt="" style="max-width: 600px;height: 400px;">
        </div>
	</div>
	</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/counterup/counterup.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>