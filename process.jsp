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
        <link href="css/proc.css" rel="stylesheet">
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
                <a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
                <div class="nav-item dropdown">
                    <a href="#knowl" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調查局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶葉介紹</a>
                        <a href="crafts.jsp" class="dropdown-item">烘焙發酵介紹</a>
                        <a href="process.jsp" class="dropdown-item active">製茶步驟介紹</a>
                    </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                <div class="nav-item dropdown">
                    <div class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><small
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
<div class="process">
  <div class="progress_inner">
    <div class="inner_step">
      <label for="step-1">採菁</label>
    </div>
    <div class="inner_step">
      <label for="step-2">萎凋</label>
    </div>
    <div class="inner_step">
      <label for="step-3">浪菁</label>
    </div>
    <div class="inner_step">
      <label for="step-4">殺菁</label>
    </div>
    <div class="inner_step">
      <label for="step-5">揉捻</label>
    </div>
    <div class="inner_step">
      <label for="step-6">發酵</label>
    </div>
    <div class="inner_step">  
      <label for="step-7">乾燥</label>
    </div>
    <div class="inner_step">
      <label for="step-8">烘培</label>
    </div>
    <input checked="checked" id="step-1" name="step" type="radio">
    <input id="step-2" name="step" type="radio">
    <input id="step-3" name="step" type="radio">
    <input id="step-4" name="step" type="radio">
    <input id="step-5" name="step" type="radio">
    <input id="step-6" name="step" type="radio">
    <input id="step-7" name="step" type="radio">
    <input id="step-8" name="step" type="radio">
    <div class="innerbar"></div>
    <div class="progress_inner__bar--set"></div>
    <div class="progress_inner__tabs">
      <div class="tab">
        <h1>採菁</h1>
        <p>
          採菁是摘斷葉間幼梗的中部。採摘標準視老嫩程度而定，一般為一心兩葉至三葉，茶菁的完整度關係到茶葉製造的品質。
        </p>
      </div>
      <div class="tab">
        <h1>萎凋</h1>
        <p>
          萎凋過程可使茶葉重量、體積、硬度降低，促進化學反應產生特殊香氣及滋味。
        </p>
      </div>
      <div class="tab">
        <h1>浪菁</h1>
        <p>
          初期:藉由翻動，使茶菁水分重新分配，減低茶梗水分。<br>
          後期:藉由攪拌使茶葉細胞摩擦破損，增加多元酚氧化酶及兒茶素作用，進而控制茶葉發酵的程度。
        </p>
      </div>
      <div class="tab">
        <h1>殺菁</h1>
        <p>
          藉由熱破壞茶葉中酵素活性，促使茶葉水分消散、葉片軟化，利於後續揉捻成形，並去除茶葉不良的菁味及穩定茶菁色澤及香氣。
        </p>
      </div>
      <div class="tab">
        <h1>揉捻</h1>
        <p>
          藉由熱破壞茶葉中酵素活性，促使茶葉水分消散、葉片軟化，利於後續揉捻成形，並去除茶葉不良的菁味、穩定茶菁色澤與香氣。
        </p>
      </div>
      <div class="tab">
        <h1>發酵</h1>
        <p>
          因揉捻後的茶葉發酵程度不足，所以需將茶葉堆疊進行補足發酵，使多元酚氧化酶與兒茶素類充分反應。
        </p>
      </div>
      <div class="tab">
        <h1>乾燥</h1>
        <p>
          熱風去除茶葉中的水分，延長保存期限，並可停止發酵作用及其他生化反應。
        </p>
      </div>
      <div class="tab">
        <h1>烘培</h1>
        <p>
          烘焙具有去除水分效果，有效延長茶葉貯藏壽命，並改善茶帶有之菁臭味，增加茶葉特殊香氣。
        </p>
      </div>
    </div>
    <!-- gift -->
    <div class="status">
      <div class="base"></div>
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
