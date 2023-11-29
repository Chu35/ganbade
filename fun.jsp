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
                <a href="#" class="nav-item nav-link active">茶遊此地</a>
                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                <a href="store.jsp" class="nav-item nav-link">滴滴商城</a>
                <div class="nav-item nav-link">
                    <div class="box">
                        <form action="showfun.jsp" autocomplete="off">
                            <input name="search" type="keyword" placeholder="Search...">		
                            <i class="fas fa-search" type="submit" value="Rechercher"></i>
                            <div id="searchResults"></div>
                        </form>
                    </div>
                </div>
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




 <!-- Map Start -->
 <div class="container-xxl py-4">
    <div class="container">
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="display-3 mb-5">  </h1>
            <h1 class="display-5 mb-4">  </h1>
        </div>
        <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.2s" style="max-width: 700px;">
          <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-interval="false">
            <div class="carousel-inner">
                <div id="mc1" class="carousel-item active">
                    <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3">貓空</p>
                    <img src="img/貓空.png"  class="d-block w-100" alt="貓空">                    
                    <div class="pin" onclick="jumpIcon(this)" data-target="f1"><img src="img/pin1.png" title="貓空 找茶屋 found your tea"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f2"><img src="img/pin1.png" title="邀月茶坊"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f4"><img src="img/pin1.png" title="煎茶院"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f9"><img src="img/pin.png" title="台北市鐵觀音包種茶研發推廣中心"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f10"><img src="img/pin.png" title="貓空茶神 MaoKong Tea Master"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f11"><img src="img/pin.png" title="晨曦茶坊"></div>
                </div>
                <div class="carousel-item">
                    <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3">坪林</p>
                    <img src="img/坪林.png" class="d-block w-100" alt="坪林">
                    <div class="pin" onclick="jumpIcon(this)" data-target="f5"><img src="img/pin.png" title="心茶合一 TeaFlow"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f8"><img src="img/pin.png" title="坪林茶業博物館"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f12"><img src="img/pin.png" title="祥泰茶莊"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f13"><img src="img/pin.png" title="東成茶葉"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f14"><img src="img/pin.png" title="天薌茶行"></div>
                </div>
                <div class="carousel-item">
                    <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3">大稻埕</p>
                    <img src="img/大稻埕.png" class="d-block w-100" alt="大稻埕">
                    <div class="pin" onclick="jumpIcon(this)" data-target="f3"><img src="img/pin.png" title="新芳春茶行"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f6"><img src="img/pin.png" title="南街得意"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f15"><img src="img/pin.png" title="沃森茶酒館 WOSOM / Teahouse & Bar"></div>
                </div>
                <div class="carousel-item">
                    <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3">西門町</p>
                    <img src="img/西門.png" class="d-block w-100" alt="西門町">
                    <div class="pin" onclick="jumpIcon(this)" data-target="f7"><img src="img/pin.png" title="HANKO 60 如醉如夢"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f16"><img src="img/pin.png" title="八拾捌茶輪番所"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f17"><img src="img/pin.png" title="摸摸茶舖 TouchTea"></div>
                    <div class="pin" onclick="jumpIcon(this)" data-target="f18"><img src="img/pin.png" title="臺灣之寶茗茶"></div>
                </div>
                
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
            </div>
        </div>
    </div>
</div>
<!-- Map End -->


  
</div>
<!-- Projects -->
<div class="container-xxl py-5">
    <div class="container">
        <% 
        // Establish database connection
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
            String user = "chu";
            String password = "0725";
            conn = DriverManager.getConnection(url, user, password);
            // Query tea data from database
            stmt = conn.createStatement();
            String query = "SELECT * FROM fun ORDER BY type"; // 按 type 列排序
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String imagePath = rs.getString("imagePath");
                String imagePathicon = rs.getString("imagePathicon");
                String instagram = rs.getString("instagram");
                String facebook = rs.getString("facebook");
                String web = rs.getString("web");
                String classification = rs.getString("classification");
                String place = rs.getString("place");
                String time = rs.getString("time");
                String guidedtour = rs.getString("guidedtour");
                String reserve = rs.getString("reserve");
                String phone = rs.getString("phone");     
                String type = rs.getString("type");  
        %>

        <div id="<%= id %>" class="row g-4 align-items-end mb-4">
            <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                <img class="img-fluid rounded" src="<%= imagePath %>" alt="<%= name %>" style=" width: 550px;height: 350px;">
            </div>
            <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.2s">
                <a href="collect.jsp?fun_id=<%= rs.getString("id") %>" style="cursor: pointer;">
                    <i class="bi bi-bookmark" style="cursor: pointer;"></i>
                </a><br>
                <p class="d-inline-block border rounded text-primary fw-semi-bold py-1 px-3 mb-1"><%= type %></p>
                <div class="display-5 mb-1">
                    <img src="<%= imagePathicon %>" alt="<%= name %>" class="btn btn-l btn-lg-square rounded-circle" style="display:inline;">
                    <h1 style="display:inline;font-family:monospace;">&ensp;<%= name %></h1>
                </div>
                <p class="mb-1"><%= classification %></p>
                <p class="mb-1">
                    <% if (web != null) { %>
                        <a class="bi bi-globe" href="<%= web %>"> Website&emsp;</a>
                    <% } %>
                    <% if (instagram != null) { %>
                    <a class="bi bi-instagram" href="<%= instagram %>"> Instagram&emsp;</a>
                    <% } %>
                    <% if (facebook != null) { %>
                    <a class="bi bi-facebook" href="<%= facebook %>"> Facebook</a><br>
                    <% } %>
                    📍地址：<%= place %><br>
                    ⏰開放時間：<%= time %><br>
                    <% if (guidedtour != null) { %>
                        🎙️導覽時段：<%= guidedtour %><br>
                    <% } %>
                    <% if (reserve != null) { %>
                        ✍🏻預約：<a href="<%= reserve %>"><%= reserve %></a><br>
                    <% } %>                 
                    ☎️電話：<a href="tel:<%= phone %>"><%= phone %></a>
                </p>
            </div>
        </div>
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
                function searchFun() {
                    var searchInput = document.getElementById("searchInput").value;
                    var searchResultsDiv = document.getElementById("searchResults");
            
                    if (searchInput.length > 0) {
                        // Use AJAX to fetch data from the server
                        var xhr = new XMLHttpRequest();
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                // Update the search results div with the fetched data
                                searchResultsDiv.innerHTML = xhr.responseText;
                            }
                        };
                        
                        // Send a GET request to the server with the search term
                        xhr.open("GET", "searchfun.jsp?search=" + searchInput, true);
                        xhr.send();
                    } else {
                        // Clear the search results if the search input is empty
                        searchResultsDiv.innerHTML = "";
                    }
                }
            </script>
            
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
<script src="lib/counterup/counterup.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>