<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
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
                <a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
                <div class="nav-item dropdown">
                    <a href="#knowl" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調查局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                        <a href="knowl2.jsp" class="dropdown-item">烘焙發酵介紹</a>
                        <a href="knowl3.jsp" class="dropdown-item">製茶步驟介紹</a>
                    </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link active">茶遊此地</a>
                <a href="contact.html" class="nav-item nav-link">關於我們</a>
                <div class="nav-item nav-link">
                    <div class="box">
                        <form action="showfun.jsp" autocomplete="off">
                            <input name="search" type="keyword" placeholder="Search...">		
                            <i class="fas fa-search" type="submit" value="Rechercher"></i>
                        </form>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <div class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><small
                            class="fa fa-user text-primary"></small></div>
                    <div class="dropdown-menu border-light m-0">
                        <a href="login.html" class="dropdown-item">登入/註冊</a>
                        <a href="index.jsp" class="dropdown-item">心理測驗</a>
                        <a href="member.jsp" class="dropdown-item">客製滴滴</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>


    <!-- Map Start -->
	<div class="container-xxl py-4">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h1 class="display-3 mb-5">  </h1>
				<h1 class="display-5 mb-2">Have a nice day！</h1>
			</div>
		</div>
	</div>
    <!-- Map End -->


<div class="container-xxl py-1">
    <div class="container">
        <div class="row g-4 align-items-end mb-4">
            <%
            String searchKeyword = request.getParameter("search");
            Connection conn = null;
            PreparedStatement preparedStatement = null;
            ResultSet rs = null;
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                String user = "chu";
                String password = "0725";
                conn = DriverManager.getConnection(url, user, password);
                String sqlQuery = "SELECT * FROM fun WHERE name LIKE ? OR type LIKE ?";
                preparedStatement = conn.prepareStatement(sqlQuery);
                preparedStatement.setString(1, "%" + searchKeyword + "%");
                preparedStatement.setString(2, "%" + searchKeyword + "%");
                rs = preparedStatement.executeQuery();
        
                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String imagePath = rs.getString("imagePath");
                    String imagePathicon = rs.getString("imagePathicon"); // 修改了变量名
                    String instagram = rs.getString("instagram");
                    String facebook = rs.getString("facebook");
                    String classification = rs.getString("classification");
                    String place = rs.getString("place");
                    String time = rs.getString("time");
                    String guidedtour = rs.getString("guidedtour");
                    String reserve = rs.getString("reserve");
                    String phone = rs.getString("phone");     
                    String type = rs.getString("type");
        %>
            <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid rounded" src="<%= imagePath %>" alt="<%= name %>">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3 mb-1"><%= type %></p>
                <div class="display-5 mb-1">
                    <img src="<%= imagePathicon %>" alt="<%= name %>" class="btn btn-l btn-lg-square rounded-circle" style="display:inline;"><h1 style="display:inline;">&nbsp;<%= name %></h1>
                </div>
                <p><%= classification %></p>
                <p class="mb-4">
                    <a class="bi bi-instagram" href="<%= instagram %>"> Instagram&emsp;</a>
                    <a class="bi bi-facebook" href="<%= facebook %>"> Facebook</a><br>
                    📍地址：<%= place %><br>
                    ⏰開放時間：<%= time %><br>
                    <% if (guidedtour != null) { %>
                        🎙️導覽時段：<%= guidedtour %><br>
                    <% } %>
                    <% if (reserve != null) { %>
                        ✍🏻導覽預約：<a href="<%= reserve %>"><%= reserve %></a><br>
                    <% } %>                 
                    &nbsp;☎&nbsp;電話：<a href="tel:<%= phone %>"><%= phone %></a>
                </p>
            </div>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close database resources
                try {
                    if (rs != null) rs.close();
                    if (preparedStatement != null) preparedStatement.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
        </div>
    </div>
</div>

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
    <i class="bi bi-arrow-up"></i>
</a>


<!-- JavaScript Libraries -->
<script typet="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
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
