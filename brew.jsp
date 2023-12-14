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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-abcdefg..." crossorigin="anonymous" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.18.0/font/bootstrap-icons.css" rel="stylesheet">

    
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
                        <a href="story.jsp" class="dropdown-item ">故事專訪</a>
                        <a href="brew.jsp" class="dropdown-item active">泡法介紹</a>

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
    <style>
      .audio-player {
          background: white;
          border: 1px solid lighten(#acacac, 20%);
          width: 50vw;
          text-align: center;
          display: flex;
          flex-flow: row;
          margin: 4rem 0 4rem 0;
      }

      .audio-player .album-image {
          min-height: 100px;
          width: 110px;
          background-size: cover;
      }

      .audio-player .player-controls {
          align-items: center;
          justify-content: center;
          margin-top: 2.5rem;
          flex: 3;
      }

      .audio-player .player-controls progress {
          width: 90%;
      }

      .audio-player .player-controls progress[value] {
          -webkit-appearance: none;
          appearance: none;
          background-color: white;
          color: blue;
          height: 5px;
      }

      .audio-player .player-controls progress[value]::-webkit-progress-bar {
          background-color: white;
          border-radius: 2px;
          border: 1px solid lighten(#acacac, 20%);
          color: blue;
      }

      .audio-player .player-controls progress::-webkit-progress-value {
          background-color: blue;
      }

      .audio-player .player-controls p {
          font-size: 1.6rem;
      }

      .audio-player #play-btn {
          background-image: url('https://cdn.fastly.picmonkey.com/content4/previews/arrows_2/arrows_2_44_550.png');
          background-size: cover;
          width: 75px;
          height: 75px;
          margin: 2rem 0 2rem 2rem;
      }

      .audio-player #play-btn.pause {
          background-image: url('https://img.icons8.com/ios/452/circled-pause.png');
      }
  </style>

<div class="container-xxl py-4">
    <div class="container" style="max-width: 900px;">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="display-3 mb-5"> </h1>
            <h1 class="display-5 mb-4">茶具介紹</h1>
        </div>
        <div class="col-lg-12" style="line-height: 2;">
            <img class="img-fluid mb-50" src="img/brew1.png" alt="">
                <h2 class="mb-50" style="line-height: 2;">➀ 煮水壺：煮滾熱水使用</h2>
                <h2 class="mb-50" style="line-height: 2;">➁ 品茶杯：飲茶使用。</h2>
                <h2 class="mb-50" style="line-height: 2;">➂ 茶船：放置茶壺的底座，讓漏出來的水流入茶盤中。</h2>
                <h2 class="mb-50" style="line-height: 2;">➃ 茶壺：在茶壺中放置茶葉，沖入熱水。</h2>
                <h2 class="mb-50" style="line-height: 2;">➄ 茶海：茶壺泡好的茶，可以先放置在茶海中。</h2>
                <h2 class="mb-50" style="line-height: 2;">➅ 茶洗：清潔杯具、承接溫壺的水、放泡過的茶葉。</h2>
        </div>
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="display-3 mb-5"> </h1>
            <h1 class="display-5 mb-4">泡茶步驟</h1>
        </div>
        <div style="text-align: center;">
            <video width="1000" controls style="display: block; margin: 0 auto; max-width: 100%;">
                <source src="img/泡茶.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        
        
        
          
    </div>
</div>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
  <i class="bi bi-arrow-up"></i>
</a>


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