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
                <a class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModal">許願茶池</a>
                <div class="nav-item dropdown">
                    <a href="knowl.jsp" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調茶局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                        <a href="#" class="dropdown-item active">故事專訪</a>
                        <a href="brew.jsp" class="dropdown-item ">泡法介紹</a>
                    </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                <a href="store.jsp" class="nav-item nav-link">滴滴商城</a>
                <div class="nav-item dropdown">
                    <div id="user-icon" class="nav-link dropdown-toggle"  data-bs-toggle="dropdown"><small
                        class="fa fa-user text-primary"></small></div>
                <div class="dropdown-menu border-light m-0">
                    <% if (memberName != null) { %>
                        <span class="dropdown-item disabled-text"><%= memberName %>, 你好</span>								
                        <% } else { %>
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
<body>

<div class="container-xxl py-4">
    <div class="container" style="max-width: 1000px;">
        <div class="text-center mx-auto" style="max-width: 600px;">
            <h1 class="display-3 mb-5"> </h1>
            <h1 class="display-5 mb-4">故事專訪 : 天薌茶行 </h1>
        </div>
        <div class="col-lg-12" style="line-height: 2;">
            <img class="img-fluid mb-50" src="img/n5.jpg" alt="">
            <blockquote class="p-2 mb-50"></blockquote>
            <h3>一、初期在經營茶行有遇到哪些困難?</h3>
            <p> 「茶葉沒了，錢也沒了」，過去在茶葉買賣的過程中經常會遇到瓶頸，即使自產的茶葉品質很好，但盤商開出來的價錢卻總是不盡理想，導致最後茶葉賣出去，錢也沒了。</p>
            <div class="text-center mx-auto " style="max-width: 500px;">
                <audio controls>
                    <source src="https://raw.githubusercontent.com/Chu35/ganbade/main/img/阿姨_行銷.mp3" type="audio/mp3">
                    Your browser does not support the audio element.
                </audio>
            </div>
            <blockquote class="p-2 mb-50"></blockquote>
            <img class="img-fluid mb-50" src="img/n2.jpg" alt="">
            <blockquote class="p-2 mb-50"></blockquote>
            <h3>二、茶行近年有碰到什麼衝擊或瓶頸?</h3>
            <p>「行銷」是傳統茶產業最大的困難，茶行通常在偏遠地區，所以遊客與外來客來訪的意願其實並不高，加上我們年紀稍長也不擅網路經營，只能靠實體店面來營運。</p>
            <div class="text-center mx-auto " style="max-width: 500px;">
                <audio controls>
                    <source src="https://raw.githubusercontent.com/Chu35/ganbade/main/img/阿姨_行銷.mp3" type="audio/mp3">
                    Your browser does not support the audio element.
                </audio>
            </div>
            <blockquote class="p-2 mb-50"></blockquote>
            <img class="img-fluid mb-50" src="img/n1.jpg" alt="">
            <blockquote class="p-2 mb-50"></blockquote>
            <h3>三、年輕人對傳統茶產業來說重要嗎?</h3>
            <p>年輕族群，人手一杯飲料與咖啡已是常態，較少人會選擇喝茶，更不用說養成泡茶習慣，如果年輕一輩的人不走進來，我們的銷路選擇也會較少，很難向外拓展出去。</p>
            <div class="text-center mx-auto " style="max-width: 500px;">
                <audio controls>
                    <source src="https://raw.githubusercontent.com/Chu35/ganbade/main/img/阿姨_行銷.mp3" type="audio/mp3">
                    Your browser does not support the audio element.
                </audio>
            </div>
            <blockquote class="p-2 mb-50"></blockquote>
            <img class="img-fluid mb-50" src="img/n3.jpg" alt="">
            <blockquote class="p-2 mb-50"></blockquote>
            <h3>四、年輕一輩沒有人願意接手家業怎麼辦?</h3>
            <p>只能接受事實，但不怕沒有練習機會，只怕孩子選擇放手，長輩還是很希望年輕人能回來接手，只是我們不能逼迫年輕人做選擇，因為茶產業沒有熱忱也無法走得長遠。</p>
            <div class="text-center mx-auto " style="max-width: 500px;">
                <audio controls>
                    <source src="https://raw.githubusercontent.com/Chu35/ganbade/main/img/阿姨_行銷.mp3" type="audio/mp3">
                    Your browser does not support the audio element.
                </audio>
            </div>
            <blockquote class="p-2 mb-50"></blockquote>
            <img class="img-fluid mb-50" src="img/n4.jpg" alt="">
        </div>
    </div>
</div>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
  <i class="bi bi-arrow-up"></i>
</a>

	<script>
		$(document).ready(function () {
			$('#modalContainer').load('modal.html');
		});
		$(document).ready(function () {
			$('#myModal').modal('show');
		});
	</script>


<!-- JavaScript Libraries -->

<script>
    $(document).ready(function () {
        $('#modalContainer').load('modal.html');
    });
    $(document).ready(function () {
        $('#myModal').modal('show');
    });
</script>

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