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
					<a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
					<div class="nav-item dropdown">
						<a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="true">知識調茶局</a>
						<div class="dropdown-menu border-light m-0" data-bs-popper="none">
							<a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
							<a href="crafts.jsp" class="dropdown-item">烘培發酵介紹</a>
							<a href="process.jsp" class="dropdown-item">製茶步驟介紹</a>
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
			</div>
		</nav>
	</div>
    <!-- Navbar End -->


    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1  class="display-3 mb-4 animated"> </h1>
                <h1 class="display-5 mb-4" style="font-family:DFKai-sb;">茶葉探險隊</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item">
                        <img class="img-fluid rounded" src="img/Pm.png" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">蘇妍童</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                    <div class="team-item">
                        <img class="img-fluid rounded" src="img/Vd.png" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">梁子晴</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item">
                        <img class="img-fluid rounded" src="img/Sa.png" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">鐘筑蘋</h4>
                        </div>
                    </div>
                </div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="team-item">
                        <img class="img-fluid rounded" src="img/Mm.png" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">馬聖烜</h4>
                        </div>
                    </div>
                </div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item">
                        <img class="img-fluid rounded" src="img/Pr.png" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">潘恩皓</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h2 class="display-5 mb-4">合作夥伴</h2>
        </div>
        <div id="partner" class="container" data-wow-delay="0.9s">
            <div class="partner-carousel owl-carousel" align="center">   
                <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                    String user = "chu";
                    String password = "0725";
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM sugardaddy ORDER BY id";
                    rs = stmt.executeQuery(query);
    
                    while (rs.next()) {
                        String id = rs.getString("id");
                        String name = rs.getString("name");
                        String imagePath = rs.getString("imagepath");
                        String href = rs.getString("href");
                %>
                <div  class="item1">
                    <a href="<%= href %>" target="_blank">
                        <img src="<%= imagePath %>" alt="<%= name %>">
                    </a>
                </div>
                <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try { rs.close(); } catch (Exception e) {  }
                    try { stmt.close(); } catch (Exception e) {  }
                    try { conn.close(); } catch (Exception e) {  }
                }
                %>
            </div>
            <div class="carousel-navigation">
                <div class="carousel-nav-prev"><i class="fas fa-chevron-left"></i></div>
                <div class="carousel-nav-next"><i class="fas fa-chevron-right"></i></div>
            </div>
        </div>
    </div>
    

<!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md mb-3 mb-md-0" align="center">
                    Copyright &copy;  2023 <a href="#">cheerstea</a>. All rights reserved
              </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


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
    <script src="js/carousel.js"></script>
</body>

</html>