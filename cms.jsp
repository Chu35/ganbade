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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<style> 
.topbar{
 background-color: #d6c5a4;
}
.btn-primary{
    color: #fff;
    background-color: #d6c5a4!important;
    border-color: #d6c5a4!important;
}
.btn-primary:active,.btn-primary:hover {
    color: #fff;
    background-color: #8E7D5C!important;
    border-color: none!important;
}
.btn{
    box-shadow: none!important;
}
.table td {
    text-align: center;
    vertical-align: middle!important;
}
.edit-icon{
    background: none;
    border: none;
    font: inherit;
    cursor: pointer;
    text-decoration: underline;
}
button {
    outline: none !important;
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
                                    <span class="logo-emblem"><img src="img/ad.jpg" alt=" " /></span>
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
                                    <a href="javascript:;" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
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
                                        <li><a href="" class="animsition-link dropdown-item wave-effect">
                                            <i class="feather icon-user"></i> Profile</a></li>
                                        <li><a href="" class="animsition-link dropdown-item wave-effect">
                                            <i class="feather icon-settings"></i> Settings</a></li>
                                        <li><a href="logout.jsp" class="animsition-link dropdown-item wave-effect">
                                            <i class="feather icon-log-in"></i> Logout</a></li>
                                    </ul>
                                </li>
                                <!-- settings Menu -->
                                <li>
                                    <a href="#" class="btn btn-primary wave-effect offcanvas-toggle">
                                        <i class="feather icon-settings"></i></a>
                                </li>
                                <!-- Notification Menu-->
                                <li class="btn-group notification">
                                    <a href="javascript:;" class="btn btn-primary dropdown-toggle wave-effect"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="feather icon-bell"><span class="notification-count">7</span></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <a href="#" class="wave-effect">
                                                <span class="avatar">
                                                    <img src="img/ad.jpg" alt=" " />
                                                </span>
                                                <span class="name">Jas Gillionaire</span>
                                                <span class="message">Like your post: “Contact Form 7 Multi-Step”</span>
                                                <span class="time">45 min</span>
                                            </a>
                                        </li>
                                        <li><a href="" class="dropdown-item all-notifications wave-effect">See more messages 
                                            <i class="feather icon-arrow-down"></i></a></li>
                                    </ul>
                                </li>
                                <!-- mobile hamburger Menu-->
                                <li class="mobile-menu-toggle">
                                    <a href="#" class="btn btn-primary menu-toggle wave-effect">
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
                            <span class="menu-title">新增/修改內容</span>
                            <i class="feather icon-chevron-down down-arrow"></i>
                        </a>
                        <div class="collapse" id="navDashboard">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="#knowledge">
                                        <i class="feather icon-layout"></i>
                                        <span class="menu-title">knowledge</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse" id="navDashboard">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="#fun">
                                        <i class="feather icon-layout"></i>
                                        <span class="menu-title">fun</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse" id="navDashboard">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="#store">
                                        <i class="feather icon-shopping-bag"></i>
                                        <span class="menu-title">eCommerce</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="collapse" id="navDashboard">
                            <ul class="flex-column sub-menu">
                                <li class="nav-item">
                                    <a class="nav-link wave-effect" href="#sugardaddy">
                                        <i class="feather icon-layout"></i>
                                        <span class="menu-title">sugardaddy</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="#member" class="nav-link wave-effect nav-single">
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
                    <style>
                        .arrow-up, .arrow-down {
                            display: none;
                        }
                    
                        .sortable-header {
                            position: relative;
                            cursor: pointer;
                            display: inline-block;
                        }
                    
                        .sortable-header:hover .arrow-up {
                            display: inline-block;
                        }
                    
                        .sortable-header:hover .arrow-down {
                            display: inline-block;
                        }
                    
                        .arrow-up::before {
                            content: "\25BC";
                            position: absolute;
                            top: 8px;
                            right: -15px;
                            font-size: 10px;
                        }
                    
                        .arrow-down::before {
                            content: "\25B2";
                            position: absolute;
                            bottom: 8px;
                            right: -15px;
                            font-size: 10px;
                        }
                    </style>
                    
                    <!-- count -->
                    <div class="row">
                    <%
                    String dbURL = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
                    String user = "chu";
                    String password = "0725";
                    
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        // Member
                        Connection connMember = DriverManager.getConnection(dbURL, user, password);
                        String countQueryMember = "select count(*) as recordCount from member";
                        Statement stMember = connMember.createStatement();
                        ResultSet countResultMember = stMember.executeQuery(countQueryMember);
                        int recordCountMember = 0;
                        if (countResultMember.next()) {
                            recordCountMember = countResultMember.getInt("recordCount");
                        }
                        String updateTimeQueryMember = "SELECT FORMAT(modify_date, 'yyyy/MM/dd HH:mm:ss') AS LastUpdateTime FROM sys.objects WHERE object_id = OBJECT_ID(N'member')";                        ResultSet updateTimeResultMember = stMember.executeQuery(updateTimeQueryMember);
                        String lastUpdateTimeMember = "";
                        if (updateTimeResultMember.next()) {
                            lastUpdateTimeMember = updateTimeResultMember.getString("LastUpdateTime");
                        }
                    
                        // Knowledge
                        Connection connKnowledge = DriverManager.getConnection(dbURL, user, password);
                        String countQueryKnowledge = "select count(*) as recordCount from Knowledge";
                        Statement stKnowledge = connKnowledge.createStatement();
                        ResultSet countResultKnowledge = stKnowledge.executeQuery(countQueryKnowledge);
                        int recordCountKnowledge = 0;
                        if (countResultKnowledge.next()) {
                            recordCountKnowledge = countResultKnowledge.getInt("recordCount");
                        }
                        String updateTimeQueryKnowledge = "SELECT FORMAT(modify_date, 'yyyy/MM/dd HH:mm:ss') AS LastUpdateTime FROM sys.objects WHERE object_id = OBJECT_ID(N'Knowledge')";                        
                        ResultSet updateTimeResultKnowledge = stKnowledge.executeQuery(updateTimeQueryKnowledge);
                        String lastUpdateTimeKnowledge = "";
                        if (updateTimeResultKnowledge.next()) {
                            lastUpdateTimeKnowledge = updateTimeResultKnowledge.getString("LastUpdateTime");
                        }
                    
                        // Fun
                        Connection connFun = DriverManager.getConnection(dbURL, user, password);
                        String countQueryFun = "select count(*) as recordCount from fun";
                        Statement stFun = connFun.createStatement();
                        ResultSet countResultFun = stFun.executeQuery(countQueryFun);
                        int recordCountFun = 0;
                        if (countResultFun.next()) {
                            recordCountFun = countResultFun.getInt("recordCount");
                        }
                        String updateTimeQueryFun = "SELECT FORMAT(modify_date, 'yyyy/MM/dd HH:mm:ss') AS LastUpdateTime FROM sys.objects WHERE object_id = OBJECT_ID(N'fun')";                        
                        ResultSet updateTimeResultFun = stFun.executeQuery(updateTimeQueryFun);
                        String lastUpdateTimeFun = "";
                        if (updateTimeResultFun.next()) {
                            lastUpdateTimeFun = updateTimeResultFun.getString("LastUpdateTime");
                        }
                    
                        // Store
                        Connection connStore = DriverManager.getConnection(dbURL, user, password);
                        String countQueryStore = "select count(*) as recordCount from store";
                        Statement stStore = connStore.createStatement();
                        ResultSet countResultStore = stStore.executeQuery(countQueryStore);
                        int recordCountStore = 0;
                        if (countResultStore.next()) {
                            recordCountStore = countResultStore.getInt("recordCount");
                        }
                        String updateTimeQueryStore = "SELECT FORMAT(modify_date, 'yyyy/MM/dd HH:mm:ss') AS LastUpdateTime FROM sys.objects WHERE object_id = OBJECT_ID(N'Store')";                        
                        ResultSet updateTimeResultStore = stStore.executeQuery(updateTimeQueryStore);
                        String lastUpdateTimeStore = "";
                        if (updateTimeResultStore.next()) {
                            lastUpdateTimeStore = updateTimeResultStore.getString("LastUpdateTime");
                        }

                        // Sugardaddy
                        Connection connSugardaddy = DriverManager.getConnection(dbURL, user, password);
                        String countQuerySugardaddy = "select count(*) as recordCount from Sugardaddy";
                        Statement stSugardaddy = connSugardaddy.createStatement();
                        ResultSet countResultSugardaddy = stSugardaddy.executeQuery(countQuerySugardaddy);
                        int recordCountSugardaddy = 0;
                        if (countResultSugardaddy.next()) {
                            recordCountSugardaddy = countResultSugardaddy.getInt("recordCount");
                        }
                        String updateTimeQuerySugardaddy = "SELECT FORMAT(modify_date, 'yyyy/MM/dd HH:mm:ss') AS LastUpdateTime FROM sys.objects WHERE object_id = OBJECT_ID(N'Sugardaddy')";
                        ResultSet updateTimeResultSugardaddy = stSugardaddy.executeQuery(updateTimeQuerySugardaddy);
                        String lastUpdateTimeSugardaddy = "";
                        if (updateTimeResultSugardaddy.next()) {
                            lastUpdateTimeSugardaddy = updateTimeResultSugardaddy.getString("LastUpdateTime");
                        }
                        
                    %>
                    
                        <div class="col-sm-12 col-lg-3">
                            <div class="card card-hover">
                                <div class="card-body">
                                    <div class="d-flex">
                                        <div class="mr-4">
                                            Member
                                            <h4 class="mb-0"><%= recordCountMember %></h4>
                                        </div>
                                        <div class="chart ml-auto text-right">
                                             <%= lastUpdateTimeMember %>
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
                                            <h4 class="mb-0"><%= recordCountKnowledge %></h4>
                                        </div>
                                        <div class="chart ml-auto text-right">
                                            <%= lastUpdateTimeKnowledge %>
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
                                            <h4 class="mb-0"><%= recordCountFun %></h4>
                                        </div>
                                        <div class="chart ml-auto text-right">
                                            <%= lastUpdateTimeFun %>
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
                                            <h4 class="mb-0"><%= recordCountStore %></h4>
                                        </div>
                                        <div class="chart ml-auto text-right">
                                            <%= lastUpdateTimeStore %>
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
                                            Sugardaddy
                                            <h4 class="mb-0"><%= recordCountSugardaddy %></h4>
                                        </div>
                                        <div class="chart ml-auto text-right">
                                            <%= lastUpdateTimeSugardaddy %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    <%
                        countResultMember.close();
                        updateTimeResultMember.close();
                        stMember.close();
                        connMember.close();
                    
                        countResultKnowledge.close();
                        updateTimeResultKnowledge.close();
                        stKnowledge.close();
                        connKnowledge.close();
                    
                        countResultFun.close();
                        updateTimeResultFun.close();
                        stFun.close();
                        connFun.close();
                    
                        countResultStore.close();
                        updateTimeResultStore.close();
                        stStore.close();
                        connStore.close();

                        countResultSugardaddy.close();
                        updateTimeResultSugardaddy.close();
                        stSugardaddy.close();
                        connSugardaddy.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    %>
                    </div>
                    <!-- member -->
                    <div id="member" class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <h4 class="card-title">Member</h4>
                                        <div class="ml-auto">
                                            <div class="dl">
                                                <input type="text" id="searchInput" placeholder="Search..." style="border:none;outline: none;">
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                $("#searchInput").on("keyup", function () {
                                                    var value = $(this).val().toLowerCase();
                                                    $("#memberTable tbody tr").filter(function () {
                                                        var nameColumn = $(this).find("td:eq(1)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>  
                                    </div>
                                    <div class="table-responsive">
                                        <table id="memberTable" class="table v-middle">
                                            <thead>
                                                <tr class="text-uppercase text-center">
                                                    <th class="border-top-0" data-index="0">
                                                        <div class="sortable-header">
                                                            Id
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="1">
                                                        <div class="sortable-header">
                                                            Name
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="2">
                                                        <div class="sortable-header">
                                                            Password
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="3">
                                                        <div class="sortable-header">
                                                            Gender
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="4">
                                                        <div class="sortable-header">
                                                            Collect
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% 
                                                try { 
                                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
                                                    Connection conn = DriverManager.getConnection(dbURL, user, password); 
                                                    String sqlQuery = "SELECT * FROM member order by id asc"; 
                                                    String countQueryMember = "SELECT COUNT(*) as name_count FROM member_collect where member_name=?";
                                                    
                                                    PreparedStatement countStatement = conn.prepareStatement(countQueryMember);
                                                    
                                                    Statement statement = conn.createStatement(); 
                                                    ResultSet result = statement.executeQuery(sqlQuery);
                                            
                                                    while (result.next()) { 
                                                        String id = result.getString("id"); 
                                                        String name = result.getString("name"); 
                                                        String gender = result.getString("gender"); 
                                                        String pwd = result.getString("pwd"); 
                                            
                                                        // Set the parameter for the member name
                                                        countStatement.setString(1, name);
                                                        ResultSet countResultMemberCollect = countStatement.executeQuery();
                                                        int recordCountMemberCollect = 0;
                                            
                                                        if (countResultMemberCollect.next()) {
                                                            recordCountMemberCollect = countResultMemberCollect.getInt("name_count");
                                                        }
                                            
                                                        countResultMemberCollect.close();
                                                %>
                                                        <tr class="text-center">
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <div class="m-r-10" style="margin-left:20px">
                                                                        <a class="btn btn-circle btn-info text-white"><%= id %></a>
                                                                    </div>
                                                                    <div class="">
                                                                        <h4 class="m-b-0 font-16 "><%= id %></h4>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td><%= name %></td>
                                                            <td><%= pwd %></td>
                                                            <td>
                                                                <label class="label label-danger"><%= gender %></label>
                                                            </td>
                                                            <td><%= recordCountMemberCollect %></td>
                                                            <td>
                                                                <button type="submit" class="js-tooltip-enabled edit-icon" data-id="<%= id %>">
                                                                    <i class="fa fa-fw fa-pencil-alt"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                <%
                                                    } 
                                                    result.close(); 
                                                    statement.close(); 
                                                    countStatement.close();
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

                    <div class="row">          
                        <!-- Knowledge -->             
                        <div id="knowledge" class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <h4 class="card-title">Knowledge</h4>
                                        <div class="ml-auto">
                                            <div class="dl">
                                                <input type="text" id="searchInput2" placeholder="Search..." style="border:none;outline: none;">
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                $("#searchInput2").on("keyup", function () {
                                                    var value = $(this).val().toLowerCase();
                                                    $("#KnowledgeTable tbody tr").filter(function () {
                                                        var nameColumn = $(this).find("td:eq(1)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>  
                                    </div>
                                    <table id="KnowledgeTable" class="table table-striped table-hover table-borderless table-vcenter font-size-sm">
                                        <thead>
                                            <tr class="text-uppercase text-center">
                                                <th class="text-center">Image</th>
                                                <th class="border-top-0" data-index="1">
                                                    <div class="sortable-header">
                                                        Name
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="2">
                                                    <div class="sortable-header">
                                                        Type
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="3">
                                                    <div class="sortable-header">
                                                        Classification
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="4">
                                                    <div class="sortable-header">
                                                        Bake、Ferment
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="text-center">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                                String sqlQuery = "SELECT * FROM knowledge order by id asc";
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
                                                    <img class="knowledge-image" src="<%= imagePath %>" style="width:50px" alt="">
                                                </td>
                                                <td>
                                                    <span class="font-w600 knowledge-name" data-id="<%= id %>"><%= name %></span>
                                                </td>
                                                <td class="d-none d-sm-table-cell">
                                                    <span class="font-size-sm text-muted knowledge-type" data-id="<%= id %>"><%= type %></span>
                                                </td>
                                                <td>
                                                    <span class="font-w600 text-success knowledge-classification" data-id="<%= id %>"><%= classification %></span>
                                                </td>
                                                <td class="d-none d-sm-table-cell knowledge-bakeferment" data-id="<%= id %>"><%= bake %>、<%= ferment %></td>
                                                <td class="text-center">
                                                    <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit2('<%= id %>', '<%= imagePath %>', '<%= name %>', '<%= type %>', '<%= classification %>')">
                                                        <input type="hidden" name="knowledgeId" value="<%= id %>">
                                                        <input type="hidden" name="originalImagePath" value="<%= imagePath %>">
                                                        <input type="hidden" name="originalName" value="<%= name %>">
                                                        <input type="hidden" name="originalType" value="<%= type %>">
                                                        <input type="hidden" name="originalClassification" value="<%= classification %>">
                                                        <input type="hidden" name="newKnowledgeImgpath" id="newKnowledgeImgpath_<%= id %>" value="">
                                                        <input type="hidden" name="newKnowledgeName" id="newKnowledgeName_<%= id %>" value="">
                                                        <input type="hidden" name="newKnowledgeType" id="newKnowledgeType_<%= id %>" value="">
                                                        <input type="hidden" name="newKnowledgeClassification" id="newKnowledgeClassification_<%= id %>" value="">
                                                        <button type="submit" class="js-tooltip-enabled edit-icon" data-id="<%= id %>">
                                                            <i class="fa fa-fw fa-pencil-alt"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                                <script>
                                                    function handleFormSubmit2(id, originalImagePath, originalName, originalType, originalClassification) {
                                                        // Prompt user for new data
                                                        var newKnowledgeImgpath = prompt("Enter the new imagePath:", originalImagePath);
                                                        var newKnowledgeName = prompt("Enter the new name:", originalName);
                                                        var newKnowledgeType = prompt("Enter the new Type:", originalType);
                                                        var newKnowledgeClassification = prompt("Enter the new Classification:", originalClassification);
                                                        // If user clicks Cancel on all prompts, return false to prevent form submission
                                                        if (newKnowledgeImgpath === null && newKnowledgeName === null && newKnowledgeType === null && newKnowledgeClassification === null) {
                                                            return false;
                                                        }
                                                        // Set the values of hidden form fields
                                                        document.getElementById('newKnowledgeImgpath_' + id).value = (newKnowledgeImgpath !== null) ? newKnowledgeImgpath : originalImagePath;
                                                        document.getElementById('newKnowledgeName_' + id).value = (newKnowledgeName !== null) ? newKnowledgeName : originalName;
                                                        document.getElementById('newKnowledgeType_' + id).value = (newKnowledgeType !== null) ? newKnowledgeType : originalType;
                                                        document.getElementById('newKnowledgeClassification_' + id).value = (newKnowledgeClassification !== null) ? newKnowledgeClassification : originalClassification;
                                                        // Return true to submit the form
                                                        return true;
                                                    }
                                                </script>
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
                        <div id="fun" class="col-lg-12">
                            <div class="card has-shadow">
                                <div class="card-body border-top">
                                    <h4 class="card-title">Fun</h4>
                                    <table class="table mb-0">
                                        <thead>
                                            <tr class="text-center">
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Place</th>
                                                <th>classification</th>
                                                <th>Phone</th>
                                                <th>Actions</th>
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
                                            <tr class="text-center">
                                                <td>
                                                    <img src="<%= imagePathicon %>" style="width:50px" alt="">
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= classification %></td>
                                                <td><%= place %></td>
                                                <td class="color-green"><%= phone %></td>
                                                <td>
                                                    <button type="submit" class="js-tooltip-enabled edit-icon" data-id="<%= id %>">
                                                        <i class="fa fa-fw fa-pencil-alt"></i>
                                                    </button>
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
                        <!-- Store -->
                        <div id="store" class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">eCommerce</h4>
                                    <table class="table text-center">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Price</th>
                                                <th>List</th>
                                                <th>Actions</th>
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
                                                <td class="text-center">
                                                    <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit3('<%= id %>', '<%= imgpath %>', '<%= name %>', '<%= price %>', '<%= list %>')">
                                                        <input type="hidden" name="storeId" value="<%= id %>">
                                                        <input type="hidden" name="originalImgpath" value="<%= imgpath %>">
                                                        <input type="hidden" name="originalName" value="<%= name %>">
                                                        <input type="hidden" name="originalPrice" value="<%= price %>">
                                                        <input type="hidden" name="originalList" value="<%= list %>">
                                                        <input type="hidden" name="newStoreImgpath" id="newStoreImgpath_<%= id %>" value="">
                                                        <input type="hidden" name="newStoreName" id="newStoreName_<%= id %>" value="">
                                                        <input type="hidden" name="newStorePrice" id="newStorePrice_<%= id %>" value="">
                                                        <input type="hidden" name="newStoreList" id="newStoreList_<%= id %>" value="">
                                                        <button type="submit" class="js-tooltip-enabled edit-icon" data-id="<%= id %>">
                                                            <i class="fa fa-fw fa-pencil-alt"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                                <script>
                                                    function handleFormSubmit3(id, originalImgpath, originalName, originalPrice, originalList) {
                                                        // Prompt user for new data
                                                        var newStoreImgpath = prompt("Enter the new imgpath:", originalImgpath);
                                                        var newStoreName = prompt("Enter the new name:", originalName);
                                                        var newStorePrice = prompt("Enter the new Price:", originalPrice);
                                                        var newStoreList = prompt("Enter the new list:", originalList);
                                                        // If user clicks Cancel on all prompts, return false to prevent form submission
                                                        if (newStoreImgpath === null && newStoreName === null && newStorePrice === null && newStoreList === null) {
                                                            return false;
                                                        }
                                                        // Set the values of hidden form fields
                                                        document.getElementById('newStoreImgpath_' + id).value = (newStoreImgpath !== null) ? newStoreImgpath : originalImgpath;
                                                        document.getElementById('newStoreName_' + id).value = (newStoreName !== null) ? newStoreName : originalName;
                                                        document.getElementById('newStorePrice_' + id).value = (newStorePrice !== null) ? newStorePrice : originalPrice;
                                                        document.getElementById('newStoreList_' + id).value = (newStoreList !== null) ? newStoreList : originalList;
                                                        return true;
                                                    }
                                                </script>
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
                        <!-- Sugardaddy -->
                        <div id="sugardaddy" class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Sugardaddy</h4>
                                    <table class="table text-center">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Href</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            try {
                                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                Connection conn = DriverManager.getConnection(dbURL, user, password);
                                                String sqlQuery = "SELECT * FROM sugardaddy";
                                                Statement statement = conn.createStatement();
                                                ResultSet result = statement.executeQuery(sqlQuery);
                    
                                                while (result.next()) {
                                                    String id = result.getString("id");
                                                    String name = result.getString("name");
                                                    String imagepath = result.getString("imagepath");
                                                    String href = result.getString("href");
                                            %>
                                            <tr class="text-center">
                                                <td>
                                                    <img src="<%= imagepath %>" style="width:50px" alt="iPhone">
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= href %></td>
                                                <td class="text-center">
                                                    <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit4('<%= id %>', '<%= imagepath %>', '<%= name %>', '<%= href %>')">
                                                        <input type="hidden" name="sugardaddyId" value="<%= id %>">
                                                        <input type="hidden" name="originalImagepath" value="<%= imagepath %>">
                                                        <input type="hidden" name="originalName" value="<%= name %>">
                                                        <input type="hidden" name="originalHref" value="<%= href %>">
                                                        <input type="hidden" name="newSugardaddyImagepath" id="newSugardaddyImagepath_<%= id %>" value="">
                                                        <input type="hidden" name="newSugardaddyName" id="newSugardaddyName_<%= id %>" value="">
                                                        <input type="hidden" name="newSugardaddyHref" id="newSugardaddyHref_<%= id %>" value="">
                                                        <button type="submit" class="js-tooltip-enabled edit-icon" data-id="<%= id %>">
                                                            <i class="fa fa-fw fa-pencil-alt"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                                <script>
                                                    function handleFormSubmit4(id, originalImagepath, originalName, originalHref) {
                                                        var newSugardaddyImagepath = prompt("Enter the new imgpath:", originalImagepath);
                                                        var newSugardaddyName = prompt("Enter the new name:", originalName);
                                                        var newSugardaddyHref = prompt("Enter the new Href:", originalHref);
                                                        if (newSugardaddyImagepath === null && newSugardaddyName === null && newSugardaddyHref === null) {
                                                            return false;
                                                        }
                                                        document.getElementById('newSugardaddyImagepath_' + id).value = (newSugardaddyImagepath !== null) ? newSugardaddyImagepath : originalImagepath;
                                                        document.getElementById('newSugardaddyName_' + id).value = (newSugardaddyName !== null) ? newSugardaddyName : originalName;
                                                        document.getElementById('newSugardaddyHref_' + id).value = (newSugardaddyHref !== null) ? newSugardaddyHref : originalHref;
                                                        return true;
                                                    }
                                                </script>
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
                    <script>
                        // knowledge Table Sorting
                        $(document).ready(function () {
                            var knowledgeSortDirection = 1; 
                            var knowledgeLastSortedColumn = 0;
                            function sortKnowledgeTable(selectedValue) {
                                var knowledgeRows = $('#KnowledgeTable tbody tr').get();
                    
                                knowledgeRows.sort(function (a, b) {
                                    var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                    var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                    
                                    if (selectedValue === 5) {
                                        keyA = $(a).find('label').text().toUpperCase();
                                        keyB = $(b).find('label').text().toUpperCase();
                                    }
                                    if (keyA < keyB) return -1 * knowledgeSortDirection;
                                    if (keyA > keyB) return 1 * knowledgeSortDirection;
                                    return 0;
                                });
                    
                                $.each(knowledgeRows, function (index, row) {
                                    $('#KnowledgeTable tbody').append(row);
                                });
                            }
                    
                            $('#KnowledgeTable th').hover(
                                function () {
                                    // Hover in
                                    $(this).find('.arrow-up').show();
                                    $(this).find('.arrow-down').show();
                                },
                                function () {
                                    // Hover out
                                    $(this).find('.arrow-up').hide();
                                    $(this).find('.arrow-down').hide();
                                }
                            );
                    
                            $('#KnowledgeTable th').click(function () {
                                var columnIndex = $(this).data('index');
                                if (knowledgeLastSortedColumn === columnIndex) {
                                    knowledgeSortDirection = -knowledgeSortDirection;
                                } else {
                                    knowledgeSortDirection = 1;
                                }
                                sortKnowledgeTable(columnIndex);
                                updateKnowledgeHeaderIcons($(this), knowledgeSortDirection);
                                knowledgeLastSortedColumn = columnIndex;
                            });
                            sortKnowledgeTable(0);
                            function updateKnowledgeHeaderIcons(clickedHeader, direction) {
                                $('#KnowledgeTable th').each(function () {
                                    if (this !== clickedHeader[0]) {
                                        $(this).find('.arrow-up').hide().css('color', ''); 
                                        $(this).find('.arrow-down').hide().css('color', ''); 
                                    }
                                });
                    
                                if (direction === 1) {
                                    clickedHeader.find('.arrow-up').css('color', '#d6c5a4'); 
                                    clickedHeader.find('.arrow-down').css('color', ''); 
                                } else {
                                    clickedHeader.find('.arrow-up').css('color', ''); 
                                    clickedHeader.find('.arrow-down').css('color', '#d6c5a4');
                                }
                            }
                    
                            // Member Table Sorting
                            var memberSortDirection = 1; 
                            var memberLastSortedColumn = 0;
                    
                            function sortMemberTable(selectedValue) {
                                var memberRows = $('#memberTable tbody tr').get();
                    
                                memberRows.sort(function (a, b) {
                                    var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                    var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                    
                                    if (selectedValue === 3) {
                                        keyA = $(a).find('label').text().toUpperCase();
                                        keyB = $(b).find('label').text().toUpperCase();
                                    }
                    
                                    if (keyA < keyB) return -1 * memberSortDirection;
                                    if (keyA > keyB) return 1 * memberSortDirection;
                                    return 0;
                                });
                    
                                $.each(memberRows, function (index, row) {
                                    $('#memberTable tbody').append(row);
                                });
                            }
                    
                            $('#memberTable th').hover(
                                function () {
                                    // Hover in
                                    $(this).find('.arrow-up').show();
                                    $(this).find('.arrow-down').show();
                                },
                                function () {
                                    // Hover out
                                    $(this).find('.arrow-up').hide();
                                    $(this).find('.arrow-down').hide();
                                }
                            );
                    
                            $('#memberTable th').click(function () {
                                var columnIndex = $(this).data('index');
                    
                                if (memberLastSortedColumn === columnIndex) {
                                    memberSortDirection = -memberSortDirection;
                                } else {
                                    memberSortDirection = 1;
                                }
                    
                                sortMemberTable(columnIndex);
                                updateMemberHeaderIcons($(this), memberSortDirection);
                                memberLastSortedColumn = columnIndex;
                            });
                    
                            sortMemberTable(0);
                    
                            function updateMemberHeaderIcons(clickedHeader, direction) {
                                $('#memberTable th').each(function () {
                                    if (this !== clickedHeader[0]) {
                                        $(this).find('.arrow-up').hide().css('color', ''); 
                                        $(this).find('.arrow-down').hide().css('color', ''); 
                                    }
                                });
                    
                                if (direction === 1) {
                                    clickedHeader.find('.arrow-up').css('color', '#d6c5a4'); 
                                    clickedHeader.find('.arrow-down').css('color', ''); 
                                } else {
                                    clickedHeader.find('.arrow-up').css('color', ''); 
                                    clickedHeader.find('.arrow-down').css('color', '#d6c5a4');
                                }
                            }
                        });
                    </script>                    
                </div>
            </main>
        </div>
    </div>
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i class="bi bi-arrow-up"></i>
        <style>
            .back-to-top {
                position: fixed;
                display: none;
                right: 30px;
                bottom: 30px;
                z-index: 99;
                box-shadow: none!important;
            }
            .btn-lg-square {
                width: 48px;
                height: 48px;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: normal;
            }
            </style>
        <script>
        // Back to top button
            $(window).scroll(function () {
                if ($(this).scrollTop() > 300) {
                    $('.back-to-top').fadeIn('slow');
                } else {
                    $('.back-to-top').fadeOut('slow');
                }
            });
            $('.back-to-top').click(function () {
                $('html, body').animate({scrollTop: 0}, 100, 'easeInOutExpo');
                return false;
            });
        </script>
    </a>

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