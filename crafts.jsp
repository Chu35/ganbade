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
                <div class="nav-item dropdown">
                    <a href="knowl.jsp" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調茶局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                        <a href="crafts.jsp" class="dropdown-item active">烘焙發酵介紹</a>
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
<div class="container-xxl py-4">
    <div class="container">
                <div class="col-lg-12 text-center p-5">
                  <h1></h1>
                  <img class="img-fluid mb-50" src="img/c1.png" alt="">
                </div>
                <div class="col-lg-12  text-center">工藝</div>
                <blockquote class="p-2 mb-50"></blockquote>
                <div class="col-lg-12" style="line-height: 3;">
                  <p>茶的古字是「荼」，荼毒的「荼」，多了那一橫<br>
                    表示茶本身是帶有刺激身體的成分<br>
                    必須要透過製茶工序，降低刺激身體的成分，才能夠飲用<br>
                    隨著製茶技術不斷地演進、提升<br>
                    讓「不同的工藝，造就茶湯不同的風味」<br>
                    製茶工藝有很多種，常常聽到，也最常誤會的<br>
                    就是「發酵和烘焙」</p>
                    <blockquote class="p-2 mb-50"></blockquote>
                  <p class="mb-50" style="line-height: 3;">
                    <b>發酵</b><br>
                    從茶樹採收下來的葉子，還沒做成茶葉的半成品狀態，稱作茶菁，茶菁帶有酵素，離開了茶樹，還是會繼續進行發酵作用。如果希望茶葉喝起來，保有類似「植物、葉子」鮮嫩自然原始的口感，在採茶之後，要盡快利用高溫把酵素破壞，製成不發酵的綠茶。反之，充分利用茶菁的酵素，讓酵素竭盡所能轉化葉片其他成分，就會製成帶有果蜜香的全發酵紅茶。<br>
                    目前台灣大部分的茶，都是製成介於綠茶和紅茶之間的半發酵「青茶」。採茶之後，經過萎凋、浪菁，才利用高溫破壞酵素。萎凋和浪菁會造成茶菁發酵，更是台灣製茶工藝的精髓所在，因為製茶師傅必須依據茶菁生長過程的不同狀態，搭配做茶當天的濕度、氣溫、風向......等等，才能決定萎凋、浪菁的程度，這兩個步驟做得好，就可以大大降低茶菁刺激身體的成分，並轉化出花香或果香。這樣的製法，讓青茶兼具綠茶的鮮嫩風味及紅茶的花果香。</p>
                  <blockquote class="p-2 mb-50"></blockquote>
                  <p class="mb-50" style="line-height: 3;">
                    <b>烘焙</b><br>
                    是製茶的重要工序，所有的茶最後都需要烘焙降低水分，以利茶葉保存。但是「烘焙」的偉大之處在於，讓製茶師傅能夠依據茶葉不同的狀態，以及自身對於茶風味的想像，透過不同烘焙溫度、時間的控制調整，能將同一種茶葉，創作出無數風味。<br>
                    在一些老茶行常將茶葉分成半生熟、三分火、七分火、全熟，基本上就是輕烘焙、深烘焙的區別，「輕焙茶」略保有葉片原始的口感及蜜香，「深焙茶」帶有焦香和蜜香。不過烘焙引出的蜜香，基調比較類似麥芽糖的路線，不同於發酵的水果蜜香。</p>
                    <blockquote class="p-2 mb-50"></blockquote>
                    <p class="mb-50" style="line-height: 3;" >
                      <b>塑形</b><br>
                       形狀不同的茶，風味表現有沒有什麼差異呢？<br>
                       為什麼英式紅茶、包種茶、東方美人都是條索狀或是散狀呢？<br>
                       為什麼高山茶都是球形呢？<br>
                       塑形的製茶工藝可分為兩種：「揉捻」、「團揉」<br>
                       簡單來說，揉捻成條索狀的茶，香氣表現突出；團揉成球形的茶，韻味表現突出。</p>
                <div class="text-center">
                    <img class="img-fluid mb-50" src="img/c2.png" alt="">
                </div>
                </div>
              </div>
            </div>
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