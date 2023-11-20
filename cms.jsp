<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <script type="text/javascript">
        var host = "bootadmin.org";
        if ((host == window.location.host) && (window.location.protocol != "https:"))
            window.location.protocol = "https";
    </script>

    <link rel="stylesheet" href="https://bootadmin.org/style/vendor/library.min.css">
    <link rel="stylesheet" href="https://bootadmin.org/style/vendor/jqueryui-flat/jquery-ui.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
        integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://bootadmin.org/style/core/style.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style> 
.topbar{
 background-color: #d6c5a4;
}
</style>
<body id="landing" class="sidebar-open">
    <div class="page-container animsition">
        <div id="dashboardPage">
            <!-- Main Menu -->
            <div class="topbar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5 hidden-xs">
                            <div class="logo">
                                <a href="/">
                                    <span class="logo-emblem"><img src="img/ad.jpg"
                                            alt=" " /></span>
                                    <span class="logo-full">甘吧茶ㄉㄟˊ</span>
                                </a>
                            </div>
                            <a href="#" class="menu-toggle wave-effect">
                                <i class="feather icon-menu"></i>
                            </a>
                        </div>
                        <div class="col-md-7 text-right">
                            <ul>
                                <!-- Profile Menu -->
                                <li class="btn-group user-account">
                                    <a href="javascript:;" class="btn dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        <div class="user-content">
                                            <div class="user-name">Chu</div>
                                            <div class="user-plan">admin</div>
                                        </div>
                                        <div class="avatar">
                                            <img src="img/efw.jpg" alt="profile" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href=""
                                                class="animsition-link dropdown-item wave-effect"><i
                                                    class="feather icon-user"></i> Profile</a></li>
                                        <li><a href=""
                                                class="animsition-link dropdown-item wave-effect"><i
                                                    class="feather icon-settings"></i> Settings</a></li>
                                        <li><a href="" class="animsition-link dropdown-item wave-effect"><i
                                                    class="feather icon-log-in"></i> Logout</a></li>
                                    </ul>
                                </li>
                                <!-- settings Menu -->
                                <li>
                                    <a href="#" class="btn wave-effect offcanvas-toggle"><i
                                            class="feather icon-settings"></i></a>
                                </li>
                                <!-- Notification Menu-->
                                <li class="btn-group notification">
                                    <a href="javascript:;" class="btn dropdown-toggle wave-effect"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="feather icon-bell"><span class="notification-count">7</span></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <a href="#" class="wave-effect">
                                                <span class="avatar">
                                                    <img src="img/ad.jpg"
                                                        alt=" " />
                                                </span>
                                                <span class="name">Jas Gillionaire</span>
                                                <span class="message">Like your post: “Contact Form 7 Multi-Step”</span>
                                                <span class="time">45 min</span>
                                            </a>
                                        </li>
                                        <li><a href=""
                                                class="dropdown-item all-notifications wave-effect">See more messages <i
                                                    class="feather icon-arrow-down"></i></a></li>
                                    </ul>
                                </li>
                                <!-- mobile hamburger Menu-->
                                <li class="mobile-menu-toggle">
                                    <a href="#" class="menu-toggle wave-effect">
                                        <i class="feather icon-menu"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- settings -->
            <aside class="offcanvas-menu">
                <div class="offcanvas-button">
                    <a href="#" class="btn wave-effect offcanvas-toggle font-20"><span aria-hidden="true">&times;</span></a>
                </div>
                <h5 class="offcanvas-title">List Group</h4>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Cras justo odio</li>
                    </ul>
                    <h5 class="offcanvas-title">List Group</h4>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Cras justo odio
                                <span class="badge badge-primary badge-pill">14</span>
                            </li>
                        </ul>
                        <h5 class="offcanvas-title">List Group Content</h4>
                            <div class="list-group list-group-flush">
                                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">List group item heading</h5>
                                        <small>3 days ago</small>
                                    </div>
                                    <p class="mb-1">Donec id elit non mi porta gravida at eget metus.</small>
                                </a>
                            </div>
            </aside>
            <!-- sidebar -->
            <div class="sidebar">
                <div class="logo">
                    <a href="">
                        <span class="logo-emblem"><img src="img/ad.jpg" alt="" /></span>
                        <span class="logo-full">甘吧茶ㄉㄟˊ</span>
                    </a>
                </div>
                <ul id="sidebarCookie">
                    <li class="spacer"></li>
                    <li class="profile">
                        <span class="profile-image">
                            <img src="img/efw.jpg" alt="profile" />
                        </span>
                        <span class="profile-name">
                            Chu
                        </span>
                        <span class="profile-info">
                            admin
                        </span>
                    </li>
                    <!--
                    <li class="title">
                        <i class="feather icon-more-horizontal"></i>
                        <span class="menu-title">Main</span>
                    </li>-->
                    <li class="nav-item">
                        <a class="nav-link wave-effect collapsed wave-effect" data-parent="#sidebarCookie"
                            data-toggle="collapse" href="#navDashboard" aria-expanded="false"
                            aria-controls="page-dashboards">
                            <i class="feather icon-grid"></i>
                            <span class="menu-title">內容</span>
                            <i class="feather icon-chevron-down down-arrow"></i>
                        </a>
                        <div class="collapse" id="navDashboard">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="">
                                        <i class="feather icon-layout"></i>
                                        <span class="menu-title">新增文章</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link wave-effect nav-single">
                            <i class="feather icon-layout"></i>
                            <span class="menu-title">會員管理</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link wave-effect collapsed" data-parent="#sidebarCookie" data-toggle="collapse"
                            href="#navMailbox" aria-expanded="false" aria-controls="page-mailbox">
                            <i class="feather icon-mail"></i>
                            <span class="menu-title">郵件</span>
                            <i class="feather icon-chevron-down down-arrow"></i>
                        </a>
                        <div class="collapse" id="navMailbox">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="">
                                        <i class="feather icon-inbox"></i>
                                        <span class="menu-title">Inbox</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link wave-effect collapsed" data-parent="#sidebarCookie" data-toggle="collapse"
                            href="#navProfilebox" aria-expanded="false" aria-controls="page-profilebox">
                            <i class="feather icon-users"></i>
                            <span class="menu-title">Account</span>
                            <i class="feather icon-chevron-down down-arrow"></i>
                        </a>
                        <div class="collapse" id="navProfilebox">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="">
                                        <i class="feather icon-user"></i>
                                        <span class="menu-title">Profile</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <main>
                <!-- breadcrumb -->
                <div class="page-breadcrumb">
                    <div class="row">
                        <div class="col-6">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page"></li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-6">
                            <div class="text-right">
                                <small>網站瀏覽人數</small>
                                <h5 class="text-info" id="count"></h5>
                                <script>
                                if (typeof (Storage) !== "undefined") {
                                    if (localStorage.pagecount) {
                                        localStorage.pagecount = Number(localStorage.pagecount) + 1;
                                    } else {
                                        localStorage.pagecount = 1;
                                    }
                                    document.getElementById("count").innerHTML = localStorage.pagecount;
                                  } else {
                                    document.getElementById("count").innerHTML = "Sorry";
                                  }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <!-- non -->
                    <div class="row">
                        <div class="col-sm-12 col-lg-3">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="mr-4">
                                            Member
                                            <h4 class="mb-0">6</h4>
                                        </div>
                                        <div class="chart ml-auto">
                                            更新時間
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-3">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="mr-4">
                                            Knowledge
                                            <h4 class="mb-0">15</h4>
                                        </div>
                                        <div class="chart ml-auto">
                                            更新時間
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-3">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="mr-4">
                                            Fun
                                            <h4 class="mb-0">18</h4>
                                        </div>
                                        <div class="chart ml-auto">
                                            更新時間
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-lg-3">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="mr-4">
                                            Store
                                            <h4 class="mb-0">5</h4>
                                        </div>
                                        <div class="chart ml-auto">
                                            更新時間
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- member -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center"><h4 class="card-title">會員</h4>
                                        <div class="ml-auto">
                                            <div class="dl">
                                                <select class="custom-select" id="sortSelect">
                                                    <option value="0" selected="">..</option>
                                                    <option value="1">最近新增</option>
                                                    <option value="2">A-Z排序</option>
                                                </select>
                                                <script>
                                                    $(document).ready(function () {
                                                        function sortTable() {
                                                            var selectedValue = $("#sortSelect").val();
                                                            var rows = $('#memberTable tbody tr').get();
                                            
                                                            rows.sort(function (a, b) {
                                                                var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                                                var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                                            
                                                                if (selectedValue === "3") {
                                                                    keyA = $(a).find('label').attr('class');
                                                                    keyB = $(b).find('label').attr('class');
                                                                }
                                            
                                                                if (keyA < keyB) return -1;
                                                                if (keyA > keyB) return 1;
                                                                return 0;
                                                            });
                                            
                                                            $.each(rows, function (index, row) {
                                                                $('#memberTable').children('tbody').append(row);
                                                            });
                                                        }
                                            
                                                        $("#sortSelect").change(function () {
                                                            sortTable();
                                                        });
                                            
                                                        sortTable();
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table v-middle" id="memberTable">
                                        <thead>
                                            <tr class="text-uppercase text-center">
                                                <th class="border-top-0">Id</th>
                                                <th class="border-top-0">Name</th>
                                                <th class="border-top-0">Password</th>
                                                <th class="border-top-0">Gender</th>
                                                <th class="border-top-0"> </th>
                                                <th class="border-top-0"> </th>
                                                <th class="border-top-0"> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                                            String user = "chu";
                                            String password = "0725";
                                        
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                        
                                                String sqlQuery = "SELECT * FROM member";
                                                Statement statement = conn.createStatement();
                                                ResultSet result = statement.executeQuery(sqlQuery);
                                        
                                                while (result.next()) {
                                                    String id = result.getString("id");
                                                    String name = result.getString("name");
                                                    String gender = result.getString("gender");
                                                    String pwd = result.getString("pwd");
                                            %>
                                            <tr class="text-center">
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div class="m-r-10"><a class="btn btn-circle btn-info text-white"><%= id %></a>
                                                        </div>
                                                        <div class="">
                                                            <h4 class="m-b-0 font-16 text-center"><%= id %></h4>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= pwd %></td>
                                                <td>
                                                    <label class="label label-danger"><%= gender %></label>
                                                </td>
                                                <td> </td>
                                                <td> </td>
                                                <td>
                                                    <h5 class="m-b-0"> </h5>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                result.close();
                                                statement.close();
                                                conn.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>               

                    <div class="row">          
                        <!-- Knowledge -->             
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Knowledge</h4>
                                    <table class="table table-striped table-hover table-borderless table-vcenter font-size-sm">
                                        <thead>
                                            <tr class="text-uppercase" id="knowlTable">
                                                <th class="font-w700 text-center">Image</th>
                                                <th class="font-w700 text-center">Name</th>
                                                <th class="d-none d-sm-table-cell font-w700 text-center">Type</th>
                                                <th class="font-w700 text-center">Classification</th>
                                                <th class="d-none d-sm-table-cell font-w700 text-center">Bake、Ferment</th>
                                                <th class="text-center">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                                String sqlQuery = "SELECT * FROM knowledge";
                                                Statement statement = conn.createStatement();
                                                ResultSet result = statement.executeQuery(sqlQuery);
                    
                                                while (result.next()) {
                                                    String id = result.getString("id");
                                                    String name = result.getString("name");
                                                    String type = result.getString("type");
                                                    String classification = result.getString("classification");
                                                    String bake = result.getString("bake");
                                                    String ferment = result.getString("ferment");
                                                    String imagePath = result.getString("image_path");
                                            %>
                                                    <tr class="text-center">
                                                        <td>
                                                            <img src="<%= imagePath %>" style="width:50px" alt="">
                                                        </td>
                                                        <td>
                                                            <span class="font-w600"><%= name %></span>
                                                        </td>
                                                        <td class="d-none d-sm-table-cell">
                                                            <span class="font-size-sm text-muted"><%= type %></span>
                                                        </td>
                                                        <td>
                                                            <span class="font-w600 text-success"><%= classification %></span>
                                                        </td>
                                                        <td class="d-none d-sm-table-cell"><%= bake %>、<%= ferment %></td>
                                                        <td class="text-center">
                                                            <a href="javascript:void(0)" data-toggle="tooltip" data-placement="left"
                                                                title="Manage" class="js-tooltip-enabled edit-icon"
                                                                data-original-title="Manage" data-id="<%= id %>">
                                                                <i class="fa fa-fw fa-pencil-alt"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                }
                                                result.close();
                                                statement.close();
                                                conn.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <!-- fun -->
                        <div class="col-lg-6">
                            <div class="card has-shadow">
                                <div class="card-body border-top">
                                    <h4 class="card-title">Stocks</h4>
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Place</th>
                                                <th>classification</th>
                                                <th>Phone</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                                String sqlQuery = "SELECT * FROM fun";
                                                Statement statement = conn.createStatement();
                                                ResultSet result = statement.executeQuery(sqlQuery);
                    
                                                while (result.next()) {
                                                    String id = result.getString("id");
                                                    String name = result.getString("name");
                                                    String classification = result.getString("classification");
                                                    String place = result.getString("place");
                                                    String phone = result.getString("phone");
                                                    String imagePathicon = result.getString("imagePathicon");
                                            %>
                                            <tr>
                                                <td>
                                                    <img src="<%= imagePathicon %>" style="width:50px" alt="">
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= classification %></td>
                                                <td><%= place %></td>
                                                <td class="color-green"><%= phone %></td>
                                            </tr>
                                            <%
                                                }
                                                result.close();
                                                statement.close();
                                                conn.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Store -->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Store</h4>
                                    <table class="table text-center">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>List</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                                String sqlQuery = "SELECT * FROM store";
                                                Statement statement = conn.createStatement();
                                                ResultSet result = statement.executeQuery(sqlQuery);
                    
                                                while (result.next()) {
                                                    String id = result.getString("id");
                                                    String name = result.getString("name");
                                                    String list = result.getString("list");
                                                    String price = result.getString("price");
                                                    String imgpath = result.getString("imgpath");
                                            %>
                                            <tr class="text-center">
                                                <td>
                                                    <img src="<%= imgpath %>" style="width:50px" alt="iPhone">
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= price %></td>
                                                <td>
                                                    <span class="badge badge-warning font-weight-100"><%= list %></span>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                                result.close();
                                                statement.close();
                                                conn.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>



    <!-- Le Javascript -->
    <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
        integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://bootadmin.org/scripts/vendor/bootstrap.min.js"></script>
    <script src="https://bootadmin.org/scripts/vendor/library.min.js"></script>



    <script src="https://bootadmin.org/scripts/core/main.js"></script>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-104952515-1', 'auto');
        ga('send', 'pageview');
    </script>

</body>

</html>