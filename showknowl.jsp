<<<<<<< HEAD
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
                <a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
                <div class="nav-item dropdown">
                    <a href="#knowl" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調查局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item active">茶種介紹</a>
                        <a href="knowl2.jsp" class="dropdown-item">烘焙發酵介紹</a>
                        <a href="knowl3.jsp" class="dropdown-item">製茶步驟介紹</a>
                    </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.html" class="nav-item nav-link">關於我們</a>
                <div class="nav-item nav-link">
                    <div class="box">
                        <form action="showknowl.jsp" autocomplete="off">
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
<div class="page_box page_search_tea">
    <div id="knowl" class="search_tea">
        <div class="inner">
            <div class="display-3 mb-5 animated slideInDown" align="center"> </div>
            <div class="search_tea_nav_bar">
                <div class="nav_item clearfix">
                    <label class="search_title">烘焙：</label>
                    <ul class="search_option clearfix" id="roastingFilter">
                        <li class="item selected" data-category="全部">全部</li>
                        <li class="item" data-category="無焙火">無焙火</li>
                        <li class="item" data-category="輕焙火">輕焙火</li>
                        <li class="item" data-category="中焙火">中焙火</li>
                        <li class="item" data-category="重焙火">重焙火</li>
                    </ul>
                </div>
                <div class="nav_item clearfix">
                    <label class="search_title">發酵：</label>
                    <ul class="search_option clearfix" id="fermentationFilter">
                        <li class="item selected" data-taste="全部">全部</li>
                        <li class="item" data-taste="不發酵">不發酵</li>
                        <li class="item" data-taste="部分發酵">部分發酵</li>
                        <li class="item" data-taste="重發酵">重發酵</li>
                    </ul>
                </div>
            </div>
                <div class="search_tea_content_box">
                    <div class="search_tea_body">
                        <ul class="tea_list clearfix" id="teaList">
                            <!-- Tea items will be displayed here based on user selection and database data -->
                            <%
                                String searchKeyword = request.getParameter("search");
                                Connection conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                                    String user = "chu";
                                    String password = "0725";
                                    conn = DriverManager.getConnection(url, user, password);
                                    String sqlQuery = "SELECT * FROM Knowledge WHERE name LIKE ?";
                                    PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
                                    preparedStatement.setString(1, "%" + searchKeyword + "%");
                                    rs = preparedStatement.executeQuery();

                                    while (rs.next()) {
                                        String id = rs.getString("id");
                                        String name = rs.getString("name");
                                        String type = rs.getString("type");
                                        String ferment = rs.getString("ferment");
                                        String bake = rs.getString("bake");
                                        String shape = rs.getString("shape");
                                        String season = rs.getString("season");
                                        String classification = rs.getString("classification");
                                        String introduce = rs.getString("introduce");
                                        String imagePath = rs.getString("image_path");
                                
                                        // Create unique modal ID
                                        String modalId = "exampleModal" + id;
                                %>
                            <!-- Generate HTML content for each tea -->
                         <li class="item" data-category="<%= bake %>" data-taste="<%= ferment %>">
                            <div class="img">
                                <!-- Use the image_path to load the image -->                                
                                <img data-bs-toggle="modal" data-bs-target="#<%= modalId %>" src="<%= imagePath %>" alt="<%= name %>">
                            </div>
                            <div class="title"><%= name %></div>
                            <div class="line"></div>
                            <div class="info clearfix">
                                <div class="info_title">產地</div>
                                <div class="info_desc"><%= rs.getString("place") %></div>
                            </div>
                            <div class="info clearfix">
                                <div class="info_title">品種</div>
                                <div class="info_desc"><%= type %></div>
                            </div>
                            <div class="info clearfix">
                                <div class="info_title">分類</div>
                                <div class="info_desc"><%= rs.getString("classification") %></div>
                            </div>
                            <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-labelledby="<%= modalId %>" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <form action="collect.jsp">
                                                <i id="collectButton<%= id %>" class="fa fa-regular fa-bookmark fa-xl" style="cursor: pointer;"></i>
                                                <script>
                                                    var collectButton<%= id %> = document.getElementById("collectButton<%= id %>");
                                                    collectButton<%= id %>.addEventListener("click", function() {
                                                        window.location.href = "collect.jsp?knowledge_id=<%= id %>";
                                                    });
                                                </script>
                                            </form>    
                                            <i type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></i>
                                        </div>        
                                        <div class="modal-body">
                                            <div class=".col-md-6">
                                                <img class="imagemodal" data-bs-toggle="modal" data-bs-target="#exampleModal1" src="<%= imagePath %>" alt="<%= name %>">
                                            </div>
                                            <div class=".col-md-6">
                                                <div class="text">
                                                    <p><%= rs.getString("introduce") %></p>
                                                    <hr>
                                                    <div class="info_box">
                                                        <div class="info clearfix">
                                                            <div class="info_title">產地</div>
                                                            <div class="info_desc"><%= rs.getString("place") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">產季</div>
                                                            <div class="info_desc"><%= rs.getString("season") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">品種</div>
                                                            <div class="info_desc"><%= rs.getString("type") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">茶乾</div>
                                                            <div class="info_desc"><%= rs.getString("shape") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">分類</div>
                                                            <div class="info_desc"><%= rs.getString("classification") %></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                </div>
                            </div>
                            
                        </li>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close database resources
                                    try {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
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
=======
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
                <a href="index.jsp#life" class="nav-item nav-link">茶的一生</a>
                <div class="nav-item dropdown">
                    <a href="#knowl" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
                        aria-expanded="true">知識調查局</a>
                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                        <a href="knowl.jsp" class="dropdown-item active">茶種介紹</a>
                        <a href="knowl2.jsp" class="dropdown-item">烘焙發酵介紹</a>
                        <a href="knowl3.jsp" class="dropdown-item">製茶步驟介紹</a>
                    </div>
                </div>
                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                <a href="contact.html" class="nav-item nav-link">關於我們</a>
                <div class="nav-item nav-link">
                    <div class="box">
                        <form action="showknowl.jsp" autocomplete="off">
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
<div class="page_box page_search_tea">
    <div id="knowl" class="search_tea">
        <div class="inner">
            <div class="display-3 mb-5 animated slideInDown" align="center"> </div>
            <div class="search_tea_nav_bar">
                <div class="nav_item clearfix">
                    <label class="search_title">烘焙：</label>
                    <ul class="search_option clearfix" id="roastingFilter">
                        <li class="item selected" data-category="全部">全部</li>
                        <li class="item" data-category="無焙火">無焙火</li>
                        <li class="item" data-category="輕焙火">輕焙火</li>
                        <li class="item" data-category="中焙火">中焙火</li>
                        <li class="item" data-category="重焙火">重焙火</li>
                    </ul>
                </div>
                <div class="nav_item clearfix">
                    <label class="search_title">發酵：</label>
                    <ul class="search_option clearfix" id="fermentationFilter">
                        <li class="item selected" data-taste="全部">全部</li>
                        <li class="item" data-taste="不發酵">不發酵</li>
                        <li class="item" data-taste="部分發酵">部分發酵</li>
                        <li class="item" data-taste="重發酵">重發酵</li>
                    </ul>
                </div>
            </div>
                <div class="search_tea_content_box">
                    <div class="search_tea_body">
                        <ul class="tea_list clearfix" id="teaList">
                            <!-- Tea items will be displayed here based on user selection and database data -->
                            <%
                                String searchKeyword = request.getParameter("search");
                                Connection conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                try {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String url = "jdbc:sqlserver://127.0.0.1:1433;database=ganbade";
                                    String user = "chu";
                                    String password = "0725";
                                    conn = DriverManager.getConnection(url, user, password);
                                    String sqlQuery = "SELECT * FROM Knowledge WHERE name LIKE ?";
                                    PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
                                    preparedStatement.setString(1, "%" + searchKeyword + "%");
                                    rs = preparedStatement.executeQuery();

                                    while (rs.next()) {
                                        String id = rs.getString("id");
                                        String name = rs.getString("name");
                                        String type = rs.getString("type");
                                        String ferment = rs.getString("ferment");
                                        String bake = rs.getString("bake");
                                        String shape = rs.getString("shape");
                                        String season = rs.getString("season");
                                        String classification = rs.getString("classification");
                                        String introduce = rs.getString("introduce");
                                        String imagePath = rs.getString("image_path");
                                
                                        // Create unique modal ID
                                        String modalId = "exampleModal" + id;
                                %>
                            <!-- Generate HTML content for each tea -->
                         <li class="item" data-category="<%= bake %>" data-taste="<%= ferment %>">
                            <div class="img">
                                <!-- Use the image_path to load the image -->                                
                                <img data-bs-toggle="modal" data-bs-target="#<%= modalId %>" src="<%= imagePath %>" alt="<%= name %>">
                            </div>
                            <div class="title"><%= name %></div>
                            <div class="line"></div>
                            <div class="info clearfix">
                                <div class="info_title">產地</div>
                                <div class="info_desc"><%= rs.getString("place") %></div>
                            </div>
                            <div class="info clearfix">
                                <div class="info_title">品種</div>
                                <div class="info_desc"><%= type %></div>
                            </div>
                            <div class="info clearfix">
                                <div class="info_title">分類</div>
                                <div class="info_desc"><%= rs.getString("classification") %></div>
                            </div>
                            <div class="modal fade" id="<%= modalId %>" tabindex="-1" aria-labelledby="<%= modalId %>" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <form action="collect.jsp">
                                                <i id="collectButton<%= id %>" class="fa fa-regular fa-bookmark fa-xl" style="cursor: pointer;"></i>
                                                <script>
                                                    var collectButton<%= id %> = document.getElementById("collectButton<%= id %>");
                                                    collectButton<%= id %>.addEventListener("click", function() {
                                                        window.location.href = "collect.jsp?knowledge_id=<%= id %>";
                                                    });
                                                </script>
                                            </form>    
                                            <i type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></i>
                                        </div>        
                                        <div class="modal-body">
                                            <div class=".col-md-6">
                                                <img class="imagemodal" data-bs-toggle="modal" data-bs-target="#exampleModal1" src="<%= imagePath %>" alt="<%= name %>">
                                            </div>
                                            <div class=".col-md-6">
                                                <div class="text">
                                                    <p><%= rs.getString("introduce") %></p>
                                                    <hr>
                                                    <div class="info_box">
                                                        <div class="info clearfix">
                                                            <div class="info_title">產地</div>
                                                            <div class="info_desc"><%= rs.getString("place") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">產季</div>
                                                            <div class="info_desc"><%= rs.getString("season") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">品種</div>
                                                            <div class="info_desc"><%= rs.getString("type") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">茶乾</div>
                                                            <div class="info_desc"><%= rs.getString("shape") %></div>
                                                        </div>
                                                        <div class="info clearfix">
                                                            <div class="info_title">分類</div>
                                                            <div class="info_desc"><%= rs.getString("classification") %></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                </div>
                            </div>
                            
                        </li>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close database resources
                                    try {
                                        if (rs != null) rs.close();
                                        if (stmt != null) stmt.close();
                                        if (conn != null) conn.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
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
>>>>>>> 5cae75f2df994299b08a5f73187bf90ef1fbe426
