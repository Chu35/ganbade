<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<% String memberName = (String) session.getAttribute("memberName"); %>
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
html{
    scroll-behavior: smooth;
}
a:hover{
    color: #8E7D5C!important;
}
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
.modalcontent {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fefefe;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

label {
    font-weight: bold;
    margin-top: 5px;
}

.edit{
    float: right;
}

input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
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
                                            <div class="user-name"><%= memberName %></div>
                                            <div class="user-plan">admin</div>
                                        </div>
                                        <div class="avatar">
                                            <img src="img/efw.jpg" alt="profile" />
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a href="logout.jsp" class="animsition-link dropdown-item wave-effect">
                                            <i class="feather icon-log-in"></i> Logout</a></li>
                                    </ul>
                                </li>
                                <!-- settings Menu 
                                <li>
                                    <a href="#" class="btn btn-primary wave-effect offcanvas-toggle">
                                        <i class="feather icon-settings"></i></a>
                                </li>-->
                                <!-- Notification Menu
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
                                </li>-->
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
                        <% if (memberName != null) { %>
                            <span class="profile-name"><%= memberName %></span>
                        <% } else { %>
                            <script>
                                window.location.href = "login.html";
                            </script>
                        <% } %>
                        <span class="profile-info">admin</span>
                    </li>                    
                    <!--
                    <li class="title">
                        <i class="feather icon-more-horizontal"></i>
                        <span class="menu-title">Main</span>
                    </li>-->
                    <li class="nav-item">
                        <a href="#member" class="nav-link wave-effect nav-single">
                            <i class="feather icon-users"></i>
                            <span class="menu-title">Member</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link wave-effect nav-single" href="#knowledge">
                            <i class="feather icon-layout"></i>
                            <span class="menu-title">knowledge</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link wave-effect nav-single" href="#fun">
                            <i class="feather icon-map-pin"></i>
                            <span class="menu-title">fun</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link wave-effect nav-single" href="#store">
                            <i class="feather icon-shopping-bag"></i>
                            <span class="menu-title">eCommerce</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link wave-effect nav-single" href="#sugardaddy">
                            <i class="feather icon-package"></i>
                            <span class="menu-title">sugardaddy</span>
                        </a>
                    </li>
                    
                    <!-- <li class="nav-item">
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
                    </li> -->
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
                                        <h4 id="addData" class="card-title"><i class="fa fa-plus" style="margin: 7px; cursor: pointer;"></i></h4>
                                        <script>
                                            $(document).ready(function () {
                                                $('#addData').click(function () {
                                                    Swal.fire({
                                                        title: 'Add Data',
                                                        html:
                                                            '<input id="idInputMember" class="swal2-input" placeholder="Enter id">' +
                                                            '<input id="nameInputMember" class="swal2-input" placeholder="Enter name">' +
                                                            '<input id="pwdInputMember" class="swal2-input" placeholder="Enter pwd">' +
                                                            '<input id="genderInputMember" class="swal2-input" placeholder="Enter gender">',                                                        showCancelButton: true,
                                                        confirmButtonText: 'Insert',
                                                        focusConfirm: false,
                                                        preConfirm: () => {
                                                            let id = $('#idInputMember').val();
                                                            let name = $('#nameInputMember').val();
                                                            let pwd = $('#pwdInputMember').val();
                                                            let gender = $('#genderInputMember').val();
                                                            insertDataIntoTableMember('member', id, name, pwd, gender);
                                                        }
                                                    });
                                                });
                                        
                                                function insertDataIntoTableMember(dataType, id, name, pwd, gender) {
                                                    $.ajax({
                                                        url: 'insertData.jsp',
                                                        type: 'POST',
                                                        data: {
                                                            dataType: dataType,
                                                            newId: id,
                                                            newName: name,
                                                            newPwd: pwd,
                                                            newGender: gender
                                                        },
                                                        success: function (response) {
                                                            Swal.fire({
                                                                title: 'Data Inserted Successfully!',
                                                                icon: 'success',
                                                                timer: 1000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        },
                                                        error: function (error) {
                                                            // Handle the error, e.g., show an error message
                                                            Swal.fire({
                                                                title: 'Error Inserting Data',
                                                                icon: 'error',
                                                                text: error.responseText,
                                                                timer: 3000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        </script>
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
                                                        var nameColumn = $(this).find("td:eq(2)").text().toLowerCase();
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
                                                    String sqlQuery = "SELECT * FROM member"; 
                                                    String countQueryMember = "SELECT COUNT(*) as name_count FROM member_collect where member_name=?";
                                                    
                                                    PreparedStatement countStatement = conn.prepareStatement(countQueryMember);
                                                    
                                                    Statement statement = conn.createStatement(); 
                                                    ResultSet result = statement.executeQuery(sqlQuery);
                                            
                                                    while (result.next()) { 
                                                        String id = result.getString("id"); 
                                                        String name = result.getString("name"); 
                                                        String pwd = result.getString("pwd"); 
                                                        String gender = result.getString("gender"); 
                                                        
                                            
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
                                                            <td><%= gender %></td>
                                                            <td><%= recordCountMemberCollect %></td>
                                                            <td class="text-center">
                                                                <button type="button" class="js-tooltip-enabled edit-icon" data-id="<%= id %>" onclick="openEditDialog('<%= id %>', '<%= id %>', '<%= name %>', '<%= pwd %>', '<%= gender %>')">
                                                                    <i class="fa fa-fw fa-pencil-alt"></i>
                                                                </button>
                                                            </td>
                                                            <div id="editDialog" class="modal">
                                                                <div class="modalcontent">
                                                                    <span class="close" onclick="closeEditDialog()">&times;</span>
                                                                    <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit()">
                                                                        <input type="hidden" name="memberId" id="memberId" value="">
                                                                        <input type="hidden" name="originalId" id="originalId" value="">
                                                                        <input type="hidden" name="originalName" id="originalName" value="">
                                                                        <input type="hidden" name="originalPwd" id="originalPwd" value="">
                                                                        <input type="hidden" name="originalGender" id="originalGender" value="">
                                                                        <label for="newMemberId">New Id:</label>
                                                                        <input type="text" id="newMemberId" name="newMemberId">
                                                                        <label for="newMemberName">New Name:</label>
                                                                        <input type="text" id="newMemberName" name="newMemberName">
                                                                        <label for="newMemberPwd">New Password:</label>
                                                                        <input type="text" id="newMemberPwd" name="newMemberPwd">
                                                                        <label for="newMemberGender">New Gender:</label>
                                                                        <select id="newMemberGender" name="newMemberGender">
                                                                            <option value="M">Male</option>
                                                                            <option value="F">Female</option>
                                                                            <option value="N/A">N/A</option>
                                                                        </select><br>
                                                                        <button type="submit" class="btn btn-primary js-tooltip-enabled edit">Save Changes</button>
                                                                        <button type="button" class="btn btn-primary js-tooltip-enabled " onclick="deleteMember()">Delete</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            
                                                            <script>
                                                                function openEditDialog(id, originalId, originalName, originalPwd, originalGender) {
                                                                    document.getElementById('memberId').value = id;
                                                                    document.getElementById('originalId').value = originalId;
                                                                    document.getElementById('originalName').value = originalName;
                                                                    document.getElementById('originalPwd').value = originalPwd;
                                                                    document.getElementById('originalGender').value = originalGender;
                                                                    document.getElementById('newMemberId').value = originalId;
                                                                    document.getElementById('newMemberName').value = originalName;
                                                                    document.getElementById('newMemberPwd').value = originalPwd;
                                                                    document.getElementById('newMemberGender').value = originalGender;
                                                                    document.getElementById('editDialog').style.display = 'block';
                                                                }
                                                            
                                                                function closeEditDialog() {
                                                                    document.getElementById('editDialog').style.display = 'none';
                                                                }
                                                            
                                                                function handleFormSubmit() {
                                                                    closeEditDialog();
                                                                    return true;
                                                                }
                                                                
                                                                function deleteMember() {
                                                                    Swal.fire({
                                                                        title: '確定要刪除此會員嗎？',
                                                                        text: '刪除後將無法恢復。',
                                                                        icon: 'warning',
                                                                        showCancelButton: true,
                                                                        confirmButtonColor: '#d33',
                                                                        cancelButtonColor: '#3085d6',
                                                                        confirmButtonText: '確定刪除'
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed) {
                                                                            var memberId = document.getElementById("memberId").value;
                                                                            window.location.href = "deleteData.jsp?memberId=" + memberId;
                                                                        }
                                                                    });
                                                                }
                                                            </script>
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
                                        <h4 id="addData2" class="card-title"><i class="fa fa-plus" style="margin: 7px; cursor: pointer;"></i></h4>
                                        <script>
                                            $(document).ready(function () {
                                                $('#addData2').click(function () {
                                                    // Use unique identifiers for the elements in this block
                                                    Swal.fire({
                                                        title: 'Add Data',
                                                        html:
                                                            '<input id="idInputKnowledge" class="swal2-input" placeholder="Enter id">' +
                                                            '<input id="image_pathInputKnowledge" class="swal2-input" placeholder="Enter image_path">' +
                                                            '<input id="nameInputKnowledge" class="swal2-input" placeholder="Enter name">' +
                                                            '<input id="typeInputKnowledge" class="swal2-input" placeholder="Enter type">' +
                                                            '<input id="classificationInputKnowledge" class="swal2-input" placeholder="Enter classification">' +
                                                            '<input id="bakeInputKnowledge" class="swal2-input" placeholder="Enter bake">' +
                                                            '<input id="fermentInputKnowledge" class="swal2-input" placeholder="Enter ferment">',
                                                        showCancelButton: true,
                                                        confirmButtonText: 'Insert',
                                                        focusConfirm: false,
                                                        preConfirm: () => {
                                                            let id = $('#idInputKnowledge').val();
                                                            let image_path = $('#image_pathInputKnowledge').val();
                                                            let name = $('#nameInputKnowledge').val();
                                                            let type = $('#typeInputKnowledge').val();
                                                            let classification = $('#classificationInputKnowledge').val();
                                                            let bake = $('#bakeInputKnowledge').val();
                                                            let ferment = $('#fermentInputKnowledge').val();
                                                            insertDataIntoTableKnowledge('knowledge', id, image_path, name, type, classification, bake, ferment);
                                                        }
                                                    });
                                                });
                                        
                                                function insertDataIntoTableKnowledge(dataType, id, image_path, name, type, classification, bake, ferment) {
                                                    $.ajax({
                                                        url: 'insertData.jsp',
                                                        type: 'POST',
                                                        data: {
                                                            dataType: dataType,
                                                            newId: id,
                                                            newImage_path: image_path,
                                                            newName: name,
                                                            newType: type,
                                                            newClassification: classification,
                                                            newBake: bake,
                                                            newFerment: ferment
                                                        },
                                                        success: function (response) {
                                                            Swal.fire({
                                                                title: 'Data Inserted Successfully!',
                                                                icon: 'success',
                                                                timer: 1000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        },
                                                        error: function (error) {
                                                            // Handle the error, e.g., show an error message
                                                            Swal.fire({
                                                                title: 'Error Inserting Data',
                                                                icon: 'error',
                                                                text: error.responseText,
                                                                timer: 3000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        </script>
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
                                                        var nameColumn = $(this).find("td:eq(2)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>  
                                    </div>
                                    <div class="table-responsive">
                                    <table id="KnowledgeTable" class="table table-striped table-hover table-borderless table-vcenter font-size-sm">
                                        <thead>
                                            <tr class="text-uppercase text-center">
                                                <th class="text-center">Id</th>
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
                                                <td><%= id %></td>
                                                <td>
                                                    <img class="knowledge-image" src="<%= imagePath %>" style="width:50px" alt="">
                                                </td>
                                                <td>
                                                    <%= name %>
                                                </td>
                                                <td >
                                                   <%= type %>
                                                </td>
                                                <td>
                                                   <%= classification %>
                                                </td>
                                                <td><%= bake %>、<%= ferment %></td>
                                                <td class="text-center">
                                                    <button type="button" class="js-tooltip-enabled edit-icon" data-id="<%= id %>"
                                                        onclick="openEditDialog2('<%= id %>', '<%= imagePath %>', '<%= name %>', '<%= type %>', '<%= classification %>', '<%= bake %>', '<%= ferment %>')">
                                                        <i class="fa fa-fw fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                                <div id="editDialog2" class="modal">
                                                    <div class="modalcontent">
                                                        <span class="close" onclick="closeEditDialog2()">&times;</span>
                                                        <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit2()">
                                                            <input type="hidden" name="knowledgeId" id="knowledgeId" value="">
                                                            <input type="hidden" name="originalImagePath" value="<%= imagePath %>">
                                                            <input type="hidden" name="originalName" value="<%= name %>">
                                                            <input type="hidden" name="originalType" value="<%= type %>">
                                                            <input type="hidden" name="originalClassification" value="<%= classification %>">
                                                            <input type="hidden" name="originalBake" value="<%= bake %>"> <!-- Separated bake and ferment -->
                                                            <input type="hidden" name="originalFerment" value="<%= ferment %>">
                                                            <label for="newKnowledgeImgpath">New ImagePath:</label>
                                                            <input type="text" id="newKnowledgeImgpath" name="newKnowledgeImgpath">
                                                            <label for="newKnowledgeName">New Name:</label>
                                                            <input type="text" id="newKnowledgeName" name="newKnowledgeName">
                                                            <label for="newKnowledgeType">New Type:</label>
                                                            <input type="text" id="newKnowledgeType" name="newKnowledgeType">
                                                            <label for="newKnowledgeClassification">New Classification:</label>
                                                            <input type="text" id="newKnowledgeClassification" name="newKnowledgeClassification"> <!-- Corrected id -->
                                                            <label for="newKnowledgeBake">New Bake:</label>
                                                            <input type="text" id="newKnowledgeBake" name="newKnowledgeBake">
                                                            <label for="newKnowledgeFerment">New Ferment:</label> <!-- Corrected label -->
                                                            <input type="text" id="newKnowledgeFerment" name="newKnowledgeFerment"><br>
                                                            <button type="button" class="btn btn-primary js-tooltip-enabled " onclick="deleteknowledge()">Delete</button>
                                                            <button type="submit" class="btn btn-primary js-tooltip-enabled edit">Save Changes</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                
                                                <script>
                                                    function openEditDialog2(id, originalImagePath, originalName, originalType, originalClassification, originalBake, originalFerment) {
                                                        document.getElementById('knowledgeId').value = id;
                                                        document.getElementById('newKnowledgeImgpath').value = originalImagePath;
                                                        document.getElementById('newKnowledgeName').value = originalName;
                                                        document.getElementById('newKnowledgeType').value = originalType;
                                                        document.getElementById('newKnowledgeClassification').value = originalClassification;
                                                        document.getElementById('newKnowledgeBake').value = originalBake;
                                                        document.getElementById('newKnowledgeFerment').value = originalFerment;
                                                        document.getElementById('editDialog2').style.display = 'block';
                                                    }
                                                
                                                    function closeEditDialog2() {
                                                        document.getElementById('editDialog2').style.display = 'none';
                                                    }
                                                
                                                    function handleFormSubmit2() {
                                                        closeEditDialog2();
                                                        return true;
                                                    }
                                                    
                                                    function deleteknowledge() {
                                                        Swal.fire({
                                                            title: '確定要刪除此資料嗎？',
                                                            text: '刪除後將無法恢復。',
                                                            icon: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonColor: '#d33',
                                                            cancelButtonColor: '#3085d6',
                                                            confirmButtonText: '確定刪除'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var knowledgeId = document.getElementById("knowledgeId").value;
                                                                window.location.href = "deleteData.jsp?knowledgeId=" + knowledgeId;
                                                            }
                                                        });
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
                        <!-- fun -->
                        <div id="fun" class="col-lg-12">
                            <div class="card has-shadow">
                                <div class="card-body border-top">
                                    <div class="d-md-flex align-items-center">
                                        <h4 class="card-title">Fun</h4>
                                        <h4 id="addData3" class="card-title"><i class="fa fa-plus" style="margin: 7px; cursor: pointer;"></i></h4>
                                        <script>
                                            $(document).ready(function () {
                                                $('#addData3').click(function () {
                                                    // Use unique identifiers for the elements in this block
                                                    Swal.fire({
                                                        title: 'Add Data',
                                                        html:
                                                            '<input id="idInputFun" class="swal2-input" placeholder="Enter id">' +
                                                            '<input id="imagePathiconInputFun" class="swal2-input" placeholder="Enter imagePathicon">' +
                                                            '<input id="nameInputFun" class="swal2-input" placeholder="Enter name">' +
                                                            '<input id="classificationInputFun" class="swal2-input" placeholder="Enter classification">' +
                                                            '<input id="phoneInputFun" class="swal2-input" placeholder="Enter phone">',
                                                        showCancelButton: true,
                                                        confirmButtonText: 'Insert',
                                                        focusConfirm: false,
                                                        preConfirm: () => {
                                                            let id = $('#idInputFun').val();
                                                            let imagePathicon = $('#imagePathiconInputFun').val();
                                                            let name = $('#nameInputFun').val();
                                                            let classification = $('#classificationInputFun').val();
                                                            let phone = $('#phoneInputFun').val();
                                                            insertDataIntoTableFun('fun', id, imagePathicon, name, classification, phone);
                                                        }
                                                    });
                                                });
                                        
                                                function insertDataIntoTableFun(dataType, id, imagePathicon, name, classification, phone) {
                                                    $.ajax({
                                                        url: 'insertData.jsp',
                                                        type: 'POST',
                                                        data: {
                                                            dataType: dataType,
                                                            newId: id,
                                                            newImagePathicon: imagePathicon,
                                                            newName: name,
                                                            newClassification: classification,
                                                            newPhone: phone
                                                        },
                                                        success: function (response) {
                                                            Swal.fire({
                                                                title: 'Data Inserted Successfully!',
                                                                icon: 'success',
                                                                timer: 1000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        },
                                                        error: function (error) {
                                                            // Handle the error, e.g., show an error message
                                                            Swal.fire({
                                                                title: 'Error Inserting Data',
                                                                icon: 'error',
                                                                text: error.responseText,
                                                                timer: 3000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        </script>
                                        <div class="ml-auto">
                                            <div class="dl">
                                                <input type="text" id="searchInput3" placeholder="Search..." style="border:none;outline: none;">
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                $("#searchInput3").on("keyup", function () {
                                                    var value = $(this).val().toLowerCase();
                                                    $("#funTable tbody tr").filter(function () {
                                                        var nameColumn = $(this).find("td:eq(2)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="table-responsive">
                                        <table id="funTable" class=" table-borderless table">
                                            <thead>
                                                <tr class="text-center">
                                                <tr class="text-uppercase text-center">
                                                    <th class="border-top-0">Id</th>
                                                    <th class="border-top-0">Image</th>
                                                    <th class="border-top-0" data-index="1">
                                                        <div class="sortable-header">
                                                            Name
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="2">
                                                        <div class="sortable-header">
                                                            Classification
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="3">
                                                        <div class="sortable-header">
                                                            Place
                                                            <span class="arrow-up"></span>
                                                            <span class="arrow-down"></span>
                                                        </div>
                                                    </th>
                                                    <th class="border-top-0" data-index="4">
                                                        <div class="sortable-header">
                                                            Phone
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
                                                    Connection conn=DriverManager.getConnection(dbURL, user, password); 
                                                    String sqlQuery="SELECT * FROM fun"; 
                                                    Statement statement=conn.createStatement(); 
                                                    ResultSet result=statement.executeQuery(sqlQuery); 
                                                    while (result.next()) { 
                                                        String id=result.getString("id"); 
                                                        String name=result.getString("name"); 
                                                        String classification=result.getString("classification"); 
                                                        String place=result.getString("place");
                                                        String phone=result.getString("phone"); 
                                                        String imagePathicon=result.getString("imagePathicon"); 
                                                        %>
                                                    <tr class="text-center">
                                                        <td><%= id %></td>
                                                        <td>
                                                            <img src="<%= imagePathicon %>" style="width:50px" alt="">
                                                        </td>
                                                        <td>
                                                            <%= name %>
                                                        </td>
                                                        <td>
                                                            <%= classification %>
                                                        </td>
                                                        <td>
                                                            <%= place %>
                                                        </td>
                                                        <td class="color-green">
                                                            <%= phone %>
                                                        </td>
                                                        <td class="text-center">
                                                            <button type="button" class="js-tooltip-enabled edit-icon" data-id="<%= id %>"
                                                                onclick="openEditDialog3('<%= id %>', '<%= imagePathicon %>', '<%= name %>', '<%= classification %>','<%= place %>','<%= phone %>')">
                                                                <i class="fa fa-fw fa-pencil-alt"></i>
                                                            </button>
                                                        </td>
                                                        <div id="editDialog3" class="modal">
                                                            <div class="modalcontent">
                                                                <span class="close" onclick="closeEditDialog3()">&times;</span>
                                                                <form class="editForm" method="post" action="updateData.jsp"
                                                                    onsubmit="return handleFormSubmit3()">
                                                                    <input type="hidden" name="funId" id="funId" value="">
                                                                    <input type="hidden" name="originalImagePathicon"
                                                                        value="<%= imagePathicon %>">
                                                                    <input type="hidden" name="originalName" value="<%= name %>">
                                                                    <input type="hidden" name="originalClassification"
                                                                        value="<%= classification %>">
                                                                    <input type="hidden" name="originalPlace" value="<%= place %>">
                                                                    <input type="hidden" name="originalPhone" value="<%= phone %>">
                                                                    <label for="newFunimagePathicon">New imagePathicon:</label>
                                                                    <input type="text" id="newFunimagePathicon" name="newFunimagePathicon">
                                                                    <label for="newFunName">New Name:</label>
                                                                    <input type="text" id="newFunName" name="newFunName">
                                                                    <label for="newFunClassification">New Classification:</label>
                                                                    <input type="text" id="newFunClassification" name="newFunClassification">
                                                                    <label for="newFunPlace">New Place:</label>
                                                                    <input type="text" id="newFunPlace" name="newFunPlace">
                                                                    <label for="newFunPhone">New Phone:</label>
                                                                    <input type="text" id="newFunPhone" name="newFunPhone"><br>
                                                                    <button type="button" class="btn btn-primary js-tooltip-enabled " onclick="deletefun()">Delete</button>
                                                                    <button type="submit" class="btn btn-primary  js-tooltip-enabled edit">Save Changes</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <script>
                                                            function openEditDialog3(id, originalImagePathicon, originalName, originalClassification, originalPlace, originalPhone) {
                                                                document.getElementById('funId').value = id;
                                                                document.getElementById('newFunimagePathicon').value = originalImagePathicon;
                                                                document.getElementById('newFunName').value = originalName;
                                                                document.getElementById('newFunClassification').value = originalClassification;
                                                                document.getElementById('newFunPlace').value = originalPlace;
                                                                document.getElementById('newFunPhone').value = originalPhone;
                                                                document.getElementById('editDialog3').style.display = 'block';
                                                            }
                                                            function closeEditDialog3() {
                                                                document.getElementById('editDialog3').style.display = 'none';
                                                            }
                                                            function handleFormSubmit3() {
                                                                closeEditDialog3();
                                                                return true;
                                                            }
                                                            function deletefun() {
                                                                Swal.fire({
                                                                    title: '確定要刪除此資料嗎？',
                                                            text: '刪除後將無法恢復。',
                                                            icon: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonColor: '#d33',
                                                            cancelButtonColor: '#3085d6',
                                                            confirmButtonText: '確定刪除'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var funId = document.getElementById("funId").value;
                                                                window.location.href = "deleteData.jsp?funId=" + funId;
                                                            }
                                                        });
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
                        <!-- Store -->
                        <div id="store" class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <h4 class="card-title">eCommerce</h4>
                                        <h4 id="addData4" class="card-title"><i class="fa fa-plus" style="margin: 7px; cursor: pointer;"></i></h4>
<script>
    $(document).ready(function () {
        $('#addData4').click(function () {
            // Use unique identifiers for the elements in this block
            Swal.fire({
                title: 'Add Data',
                html:
                    '<input id="idInputStore" class="swal2-input" placeholder="Enter id">' +
                    '<input id="imgpathInputStore" class="swal2-input" placeholder="Enter imgpath">' +
                    '<input id="nameInputStore" class="swal2-input" placeholder="Enter name">' +
                    '<input id="priceInputStore" class="swal2-input" placeholder="Enter price">' +
                    '<input id="listInputStore" class="swal2-input" placeholder="Enter list">',
                showCancelButton: true,
                confirmButtonText: 'Insert',
                focusConfirm: false,
                preConfirm: () => {
                    let id = $('#idInputStore').val();
                    let imgpath = $('#imgpathInputStore').val();
                    let name = $('#nameInputStore').val();
                    let price = $('#priceInputStore').val();
                    let list = $('#listInputStore').val();
                    insertDataIntoTableStore('store', id, imgpath, name, price, list);
                }
            });
        });

        function insertDataIntoTableStore(dataType, id, imgpath, name, price, list) {
            $.ajax({
                url: 'insertData.jsp',
                type: 'POST',
                data: {
                    dataType: dataType,
                    newId: id,
                    newImgpath: imgpath,
                    newName: name,
                    newPrice: price,
                    newList: list
                },
                success: function (response) {
                    Swal.fire({
                        title: 'Data Inserted Successfully!',
                        icon: 'success',
                        timer: 1000,
                        timerProgressBar: true,
                        showConfirmButton: false
                    });
                },
                error: function (error) {
                    // Handle the error, e.g., show an error message
                    Swal.fire({
                        title: 'Error Inserting Data',
                        icon: 'error',
                        text: error.responseText,
                        timer: 3000,
                        timerProgressBar: true,
                        showConfirmButton: false
                    });
                }
            });
        }
    });
</script>

                                        <div class="ml-auto">
                                            <div class="dl">
                                                <input type="text" id="searchInput4" placeholder="Search..." style="border:none;outline: none;">   
                                            </div>                                           
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                $("#searchInput4").on("keyup", function () {
                                                    var value = $(this).val().toLowerCase();
                                                    $("#storeTable tbody tr").filter(function () {
                                                        var nameColumn = $(this).find("td:eq(2)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="table-responsive">
                                    <table id="storeTable" class="table table-borderless text-center">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Image</th>
                                                <th class="border-top-0" data-index="1">
                                                    <div class="sortable-header">
                                                        Name
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="2">
                                                    <div class="sortable-header">
                                                        Price
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="3">
                                                    <div class="sortable-header">
                                                        List
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
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
                                                <td><%= id %></td>
                                                <td>
                                                    <img src="<%= imgpath %>" style="width:50px" alt="iPhone">
                                                </td>
                                                <td><%= name %></td>
                                                <td><%= price %></td>
                                                <td>
                                                    <span class="badge badge-warning font-weight-100"><%= list %></span>
                                                </td>
                                                <td class="text-center">
                                                    <button type="button" class="js-tooltip-enabled edit-icon" data-id="<%= id %>"
                                                        onclick="openEditDialog4('<%= id %>', '<%= imgpath %>', '<%= name %>', '<%= price %>', '<%= list %>')">
                                                        <i class="fa fa-fw fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                                <div id="editDialog4" class="modal">
                                                    <div class="modalcontent">
                                                        <span class="close" onclick="closeEditDialog4()">&times;</span>
                                                        <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit4()">
                                                            <input type="hidden" name="storeId" id="storeId" value="">
                                                            <input type="hidden" name="originalImgpath" value="<%= imgpath %>">
                                                            <input type="hidden" name="originalName" value="<%= name %>">
                                                            <input type="hidden" name="originalPrice" value="<%= price %>">
                                                            <input type="hidden" name="originalList" value="<%= list %>">
                                                            <label for="newStoreImgpath">New Imgpath:</label>
                                                            <input type="text" id="newStoreImgpath" name="newStoreImgpath">
                                                            <label for="newStoreName">New Name:</label>
                                                            <input type="text" id="newStoreName" name="newStoreName">
                                                            <label for="newStorePrice">New Price:</label>
                                                            <input type="text" id="newStorePrice" name="newStorePrice">
                                                            <label for="newStoreList">New List:</label>
                                                            <input type="text" id="newStoreList" name="newStoreList"><br>
                                                            <button type="button" class="btn btn-primary js-tooltip-enabled " onclick="deletestore()">Delete</button>
                                                            <button type="submit" class="btn btn-primary  js-tooltip-enabled edit">Save Changes</button>
                                                        </form>
                                                    </div>
                                                </div>
                                                <script>
                                                    function openEditDialog4(id, originalImgpath, originalName, originalPrice, originalList) {
                                                        document.getElementById('storeId').value = id;
                                                        document.getElementById('newStoreImgpath').value = originalImgpath;
                                                        document.getElementById('newStoreName').value = originalName;
                                                        document.getElementById('newStorePrice').value = originalPrice;
                                                        document.getElementById('newStoreList').value = originalList;
                                                        document.getElementById('editDialog4').style.display = 'block';
                                                    }
                                                
                                                    function closeEditDialog4() {
                                                        document.getElementById('editDialog4').style.display = 'none';
                                                    }
                                                
                                                    function handleFormSubmit4() {
                                                        closeEditDialog4();
                                                        return true;
                                                    }
                                                    function deletestore() {
                                                        Swal.fire({
                                                            title: '確定要刪除此資料嗎？',
                                                            text: '刪除後將無法恢復。',
                                                            icon: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonColor: '#d33',
                                                            cancelButtonColor: '#3085d6',
                                                            confirmButtonText: '確定刪除'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var storeId = document.getElementById("storeId").value;
                                                                window.location.href = "deleteData.jsp?storeId=" + storeId;
                                                            }
                                                        });
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
                        <!-- Sugardaddy -->
                        <div id="sugardaddy" class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-md-flex align-items-center">
                                        <h4 class="card-title">Sugardaddy</h4>
                                        <h4 id="addData5" class="card-title"><i class="fa fa-plus" style="margin: 7px; cursor: pointer;"></i></h4>
                                        <script>
                                            $(document).ready(function () {
                                                $('#addData5').click(function () {
                                                    Swal.fire({
                                                        title: 'Add Data',
                                                        html:
                                                            '<input id="idInputSugardaddy" class="swal2-input" placeholder="Enter id">' +
                                                            '<input id="imagepathInputSugardaddy" class="swal2-input" placeholder="Enter imagepath">' +
                                                            '<input id="nameInputSugardaddy" class="swal2-input" placeholder="Enter name">' +
                                                            '<input id="hrefInputSugardaddy" class="swal2-input" placeholder="Enter href">',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Insert',
                                                            focusConfirm: false,
                                                        preConfirm: () => {
                                                            let id = $('#idInputSugardaddy').val();
                                                            let imagepath = $('#imagepathInputSugardaddy').val();
                                                            let name = $('#nameInputSugardaddy').val();
                                                            let href = $('#hrefInputSugardaddy').val();
                                                            insertDataIntoTable('sugardaddy',id,imagepath,name, href);
                                                        }
                                                    });
                                                });
                                        
                                                function insertDataIntoTable(dataType,id,imagepath,name, href) {
                                                    $.ajax({
                                                        url: 'insertData.jsp', 
                                                        type: 'POST',
                                                        data: {
                                                            dataType: dataType,
                                                            newId: id,
                                                            newImagepath: imagepath,
                                                            newName: name,
                                                            newhref: href,
                                                        }, 
                                                        success: function (response) {
                                                            Swal.fire({
                                                                title: 'Data Inserted Successfully!',
                                                                icon: 'success',
                                                                timer: 1000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        },
                                                        error: function (error) {
                                                            Swal.fire({
                                                                title: 'Error Inserting Data',
                                                                icon: 'error',
                                                                text: error.responseText,
                                                                timer: 3000,
                                                                timerProgressBar: true,
                                                                showConfirmButton: false
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        </script>
                                        <div class="ml-auto">
                                            <div class="dl">
                                                <input type="text" id="searchInput5" placeholder="Search..." style="border:none;outline: none;">
                                            </div>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                $("#searchInput5").on("keyup", function () {
                                                    var value = $(this).val().toLowerCase();
                                                    $("#sugardaddyTable tbody tr").filter(function () {
                                                        var nameColumn = $(this).find("td:eq(2)").text().toLowerCase();
                                                        $(this).toggle(nameColumn.indexOf(value) > -1);
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="table-responsive">
                                    <table id="sugardaddyTable" class="table table-borderless text-center">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>Image</th>
                                                <th class="border-top-0" data-index="1">
                                                    <div class="sortable-header">
                                                        Name
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
                                                <th class="border-top-0" data-index="2">
                                                    <div class="sortable-header">
                                                        Href
                                                        <span class="arrow-up"></span>
                                                        <span class="arrow-down"></span>
                                                    </div>
                                                </th>
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
                                                <td><%= id %></td>
                                                <td>
                                                    <img src="<%= imagepath %>" style="width:50px" alt="iPhone">
                                                </td>
                                                <td><%= name %></td>
                                                <td>
                                                    <%= href %>
                                                </td>
                                                <td class="text-center">
                                                    <button type="button" class="js-tooltip-enabled edit-icon" data-id="<%= id %>"
                                                        onclick="openEditDialog5('<%= id %>', '<%= imagepath %>', '<%= name %>', '<%= href %>')">
                                                        <i class="fa fa-fw fa-pencil-alt"></i>
                                                    </button>
                                                </td>
                                                
                                                <div id="editDialog5" class="modal">
                                                    <div class="modalcontent">
                                                        <span class="close" onclick="closeEditDialog5()">&times;</span>
                                                        <form class="editForm" method="post" action="updateData.jsp" onsubmit="return handleFormSubmit5()">
                                                            <input type="hidden" name="sugardaddyId" id="sugardaddyId" value="">
                                                            <input type="hidden" name="originalImagepath" value="<%= imagepath %>">
                                                            <input type="hidden" name="originalName" value="<%= name %>">
                                                            <input type="hidden" name="originalHref" value="<%= href %>">
                                                            <label for="newSugardaddyImagepath">New Imagepath:</label>
                                                            <input type="text" id="newSugardaddyImagepath" name="newSugardaddyImagepath">
                                                            <label for="newSugardaddyName">New Name:</label>
                                                            <input type="text" id="newSugardaddyName" name="newSugardaddyName">
                                                            <label for="newSugardaddyHref">New Href:</label>
                                                            <input type="text" id="newSugardaddyHref" name="newSugardaddyHref"><br>
                                                            <button type="button" class="btn btn-primary js-tooltip-enabled " onclick="deletesugardaddy()">Delete</button>
                                                            <button type="submit" class="btn btn-primary js-tooltip-enabled edit">Save Changes</button>
                                                        </form>
                                                    </div>
                                                </div>                                               
                                                <script>
                                                    function openEditDialog5(id, originalImagepath, originalName, originalHref) {
                                                        document.getElementById('sugardaddyId').value = id;
                                                        document.getElementById('newSugardaddyImagepath').value = originalImagepath;
                                                        document.getElementById('newSugardaddyName').value = originalName;
                                                        document.getElementById('newSugardaddyHref').value = originalHref;
                                                        document.getElementById('editDialog5').style.display = 'block';
                                                    }

                                                    function closeEditDialog5() {
                                                        document.getElementById('editDialog5').style.display = 'none';
                                                    }

                                                    function handleFormSubmit5() {
                                                        closeEditDialog5();
                                                        return true;
                                                    }
                                                    function deletesugardaddy() {
                                                        Swal.fire({
                                                            title: '確定要刪除此資料嗎？',
                                                            text: '刪除後將無法恢復。',
                                                            icon: 'warning',
                                                            showCancelButton: true,
                                                            confirmButtonColor: '#d33',
                                                            cancelButtonColor: '#3085d6',
                                                            confirmButtonText: '確定刪除'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var sugardaddyId = document.getElementById("sugardaddyId").value;
                                                                window.location.href = "deleteData.jsp?sugardaddyId=" + sugardaddyId;
                                                            }
                                                        });
                                                    }
                                                </script>
                                                
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

                            // fun Table Sorting
                            var funSortDirection = 1; 
                            var funLastSortedColumn = 0;
                            function sortfunTable(selectedValue) {
                                var funRows = $('#funTable tbody tr').get();
                    
                                funRows.sort(function (a, b) {
                                    var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                    var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                    
                                    if (selectedValue === 1) {
                                        keyA = $(a).find('label').text().toUpperCase();
                                        keyB = $(b).find('label').text().toUpperCase();
                                    }
                                    if (keyA < keyB) return -1 * funSortDirection;
                                    if (keyA > keyB) return 1 * funSortDirection;
                                    return 0;
                                });
                    
                                $.each(funRows, function (index, row) {
                                    $('#funTable tbody').append(row);
                                });
                            }
                    
                            $('#funTable th').hover(
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
                    
                            $('#funTable th').click(function () {
                                var columnIndex = $(this).data('index');
                                if (funLastSortedColumn === columnIndex) {
                                    funSortDirection = -funSortDirection;
                                } else {
                                    funSortDirection = 1;
                                }
                                sortfunTable(columnIndex);
                                updateFunHeaderIcons($(this), funSortDirection);
                                funLastSortedColumn = columnIndex;
                            });
                            sortfunTable(0);
                            function updateFunHeaderIcons(clickedHeader, direction) {
                                $('#funTable th').each(function () {
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

                            // store Table Sorting
                            var storeSortDirection = 1; 
                            var storeLastSortedColumn = 0;
                            function sortstoreTable(selectedValue) {
                                var storeRows = $('#storeTable tbody tr').get();
                    
                                storeRows.sort(function (a, b) {
                                    var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                    var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                    
                                    if (selectedValue === 5) {
                                        keyA = $(a).find('label').text().toUpperCase();
                                        keyB = $(b).find('label').text().toUpperCase();
                                    }
                                    if (keyA < keyB) return -1 * storeSortDirection;
                                    if (keyA > keyB) return 1 * storeSortDirection;
                                    return 0;
                                });
                    
                                $.each(storeRows, function (index, row) {
                                    $('#storeTable tbody').append(row);
                                });
                            }
                    
                            $('#storeTable th').hover(
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
                    
                            $('#storeTable th').click(function () {
                                var columnIndex = $(this).data('index');
                                if (storeLastSortedColumn === columnIndex) {
                                    storeSortDirection = -storeSortDirection;
                                } else {
                                    storeSortDirection = 1;
                                }
                                sortstoreTable(columnIndex);
                                updateFunHeaderIcons($(this), storeSortDirection);
                                storeLastSortedColumn = columnIndex;
                            });
                            sortstoreTable(0);
                            function updateFunHeaderIcons(clickedHeader, direction) {
                                $('#storeTable th').each(function () {
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

                            // sugardaddy Table Sorting
                            var sugardaddySortDirection = 1; 
                            var sugardaddyLastSortedColumn = 0;
                            function sortsugardaddyTable(selectedValue) {
                                var sugardaddyRows = $('#sugardaddyTable tbody tr').get();
                    
                                sugardaddyRows.sort(function (a, b) {
                                    var keyA = $(a).children('td').eq(selectedValue).text().toUpperCase();
                                    var keyB = $(b).children('td').eq(selectedValue).text().toUpperCase();
                    
                                    if (selectedValue === 5) {
                                        keyA = $(a).find('label').text().toUpperCase();
                                        keyB = $(b).find('label').text().toUpperCase();
                                    }
                                    if (keyA < keyB) return -1 * sugardaddySortDirection;
                                    if (keyA > keyB) return 1 * sugardaddySortDirection;
                                    return 0;
                                });
                    
                                $.each(sugardaddyRows, function (index, row) {
                                    $('#sugardaddyTable tbody').append(row);
                                });
                            }
                    
                            $('#sugardaddyTable th').hover(
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
                    
                            $('#sugardaddyTable th').click(function () {
                                var columnIndex = $(this).data('index');
                                if (sugardaddyLastSortedColumn === columnIndex) {
                                    sugardaddySortDirection = -sugardaddySortDirection;
                                } else {
                                    sugardaddySortDirection = 1;
                                }
                                sortsugardaddyTable(columnIndex);
                                updateFunHeaderIcons($(this), sugardaddySortDirection);
                                sugardaddyLastSortedColumn = columnIndex;
                            });
                            sortsugardaddyTable(0);
                            function updateFunHeaderIcons(clickedHeader, direction) {
                                $('#sugardaddyTable th').each(function () {
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
                    
                                    if (selectedValue === 5) {
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


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