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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
            data-bs-target="#navbarCollapse" id="navbar-toggler">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto p-4 p-lg-0">
					<a href="index.jsp#home" class="nav-item nav-link">首頁</a>
					<a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
					<div class="nav-item dropdown">
						<a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="true">知識調查局</a>
						<div class="dropdown-menu border-light m-0" data-bs-popper="none">
							<a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
							<a href="knowl2.jsp" class="dropdown-item">烘培發酵介紹</a>
							<a href="knowl3.jsp" class="dropdown-item">製茶步驟介紹</a>
						</div>
					</div>
					<a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
					<a href="contact.jsp" class="nav-item nav-link">關於我們</a>
					<div class="nav-item dropdown">
						<div id="user-icon" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><small
							class="fa fa-user text-primary"></small></div>
					<div class="dropdown-menu border-light m-0">
                        <% if (memberName != null) { %>
                            <a class="dropdown-item"><%= memberName %>, 你好</a>
                        <% } else { %>
                            <a class="dropdown-item" href="login.html">登入/註冊</a>
                        <% } %>
                        <a href="index.jsp" class="dropdown-item">心理測驗</a>
                        <a href="member.jsp" class="dropdown-item">客製滴滴</a>
                        <% if (memberName != null) { %>
                            <a class="dropdown-item" href="logout.jsp">登出</a>
                        <% }%>
                    </div>
				</div>
			</div>
		</div>
	</nav>
</div>
    <!-- Navbar End -->

	<!-- Projects Start -->
    <div class="container-xxl py-4">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">

            </div>
        </div>
    </div>
    <!-- Projects End -->


	<!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4 align-items-end mb-4" >
                <div class=" wow fadeInUp" data-wow-delay="0.1s" align="center"> 
                    <h1 class="display-5 mb-3" >會員中心</h1>
					
					<div class="big-circle">
						<img id="pic" class="no-repeat" src="img/t1.png" alt="">
						<i class="bi bi-brush clothes btn btn-primary" type="button"
						   data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample"></i>
						<div class="collapse collapse-horizontal" id="collapseWidthExample">
							<div class="card">
								<div class="card-body">
									<img id="replacement-pic" class="no-repeat" src="img/t2.png" alt="">
								</div>
							</div>
						</div>
					</div>
					
					<script>
						// 定義圖片路徑數組
						var imagePaths = ['img/4in1.png', 'img/4in2.png', 'img/4in3.png'];
						var currentImageIndex = 0; // 當前圖片索引
					
						// 綁定點擊事件
						document.querySelector('.fa-pencil-square-o').addEventListener('click', function () {
							// 切換圖片
							currentImageIndex = (currentImageIndex + 1) % imagePaths.length; // 循環切換圖片
							var newImagePath = imagePaths[currentImageIndex];
							document.getElementById('pic').src = newImagePath;
						});
					</script>
					
					<div class="display-5 mb-3"> </div>
					<div class="mb-5" align="center">
						<% if (memberName != null) { %>
						<form id="membermodify" action="modify.jsp" method="post" autocomplete="off">
							帳號：<input class="m1" type="text" name="user" placeholder="<%= memberName %>" />
							<input class="btn btn-primary" type="submit" name="modifyUser" value="修改" /><br><br>
							密碼：<input class="m1" type="password" name="pwd" value="" />
							<input class="btn btn-primary" type="submit" name="modifyPwd" value="修改" /><br><br>
						</form>
						<% }%>
					</div>
					<h1 class="mb-4"><i class="fa fa-heart" aria-hidden="true"></i>&nbsp;收藏</h1>
					<div class="row">
						<div class="col-sm-3 mb-3 mb-sm-0">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Special title treatment</h5>
									<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>
						<div class="col-sm-3 mb-3 mb-sm-0">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Special title treatment</h5>
									<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
									<a href="#" class="btn btn-primary">Go somewhere</a>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
		</div>
    </div>
	
    <!-- About End -->


	
	
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
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>