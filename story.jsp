<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*" %>
        <!DOCTYPE html>
        <% String memberName=(String) session.getAttribute("memberName"); %>
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
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
                    integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
                    crossorigin="anonymous">

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
                    <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-4 wow fadeIn"
                        data-wow-delay="0.1s">
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
                                    <a href="knowl.jsp" class="nav-link dropdown-toggle active"
                                        data-bs-toggle="dropdown" aria-expanded="true">知識調茶局</a>
                                    <div class="dropdown-menu border-light m-0" data-bs-popper="none">
                                        <a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
                                        <a href="#" class="dropdown-item active">故事專訪</a>
                                        <a href="brew.jsp" class="dropdown-item">泡法介紹</a>

                                    </div>
                                </div>
                                <a href="fun.jsp" class="nav-item nav-link">茶遊此地</a>
                                <a href="contact.jsp" class="nav-item nav-link">關於我們</a>
                                <a href="store.jsp" class="nav-item nav-link">滴滴商城</a>
                                <div class="nav-item dropdown">
                                    <div id="user-icon" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <small class="fa fa-user text-primary"></small></div>
                                    <div class="dropdown-menu border-light m-0">
                                        <% if (memberName !=null) { %>
                                            <span class="dropdown-item disabled-text">
                                                <%= memberName %>, 你好
                                            </span>
                                            <% } else { %>
                                                <a class="dropdown-item" href="login.html">登入/註冊</a>
                                                <% } %>
                                                    <a href="member.jsp" class="dropdown-item">會員中心</a>
                                                    <% if (memberName !=null) { %>
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
                        <div class="container">
                            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
                                style="max-width: 600px;">
                                <h1 class="display-3 mb-5"> </h1>
                                <h1 class="display-5 mb-4">故事專訪 : 天薌茶行 </h1>
                            </div>
                            <div class="col-lg-12" style="line-height: 3;">
                                <img class="img-fluid mb-50" src="img/n1.jpg" alt="">

                                <div class="audio-player">
                                    <div id="play-btn"></div>
                                    <div class="audio-wrapper" id="player-container" href="javascript:;">
                                        <audio id="player" ontimeupdate="initProgressBar()">
                                            <source
                                                src="https://raw.githubusercontent.com/Chu35/ganbade/main/img/阿姨_行銷.mp3"
                                                type="">
                                        </audio>
                                    </div>
                                    <div class="player-controls scrubber">
                                        <p>Oslo <small>by</small> Holy Esque</p>
                                        <span id="seekObjContainer">
                                            <progress id="seekObj" value="0" max="1"></progress>
                                        </span>
                                        <br>
                                        <small style="float: left; position: relative; left: 15px;"
                                            class="start-time"></small>
                                        <small style="float: right; position: relative; right: 20px;"
                                            class="end-time"></small>
                                    </div>
                                    <div class="album-image"
                                        style="background-image: url('https://artwork-cdn.7static.com/static/img/sleeveart/00/051/614/0005161476_350.jpg')">
                                    </div>
                                </div>

                                <b>一、初期在經營茶行有遇到哪些困難?</b>
                                <p> 「茶葉沒了，錢也沒了」，過去在茶葉買賣的過程中經常會遇到瓶頸，即使自產的茶葉品質很好，但盤商開出來的價錢卻總是不盡理想，導致最後茶葉賣出去，錢也沒了。</p>

                                <blockquote class="p-2 mb-50"></blockquote>
                                <p class="mb-50" style="line-height: 3;">
                                    <img class="img-fluid mb-50" src="img/n2.jpg" alt="">
                                    <b>二、茶行近年有碰到什麼衝擊或瓶頸?</b><br>
                                    是製茶的重要工序，所有的茶最後都需要烘焙降低水分，以利茶葉保存。但是「烘焙」的偉大之處在於，讓製茶師傅能夠依據茶葉不同的狀態，以及自身對於茶風味的想像，透過不同烘焙溫度、時間的控制調整，能將同一種茶葉，創作出無數風味。<br>
                                    在一些老茶行常將茶葉分成半生熟、三分火、七分火、全熟，基本上就是輕烘焙、深烘焙的區別，「輕焙茶」略保有葉片原始的口感及蜜香，「深焙茶」帶有焦香和蜜香。不過烘焙引出的蜜香，基調比較類似麥芽糖的路線，不同於發酵的水果蜜香。
                                </p>
                                <blockquote class="p-2 mb-50"></blockquote>
                                <p class="mb-50" style="line-height: 3;">
                                    <img class="img-fluid mb-50" src="img/n3.jpg" alt="">
                                    <b>三、年輕人對傳統茶產業來說重要嗎?</b><br>
                                    是年輕族群，人手一杯飲料與咖啡已是常態，較少人會選擇喝茶，更不用說養成泡茶習慣，如果年輕一輩的人不走進來，我們的銷路選擇也會較少，很難向外拓展出去。
                                </p>
                                <blockquote class="p-2 mb-50"></blockquote>
                                <p class="mb-50" style="line-height: 3;">
                                    <img class="img-fluid mb-50" src="img/n4.jpg" alt="">
                                    <b>四、年輕一輩沒有人願意接手家業怎麼辦?</b><br>
                                    只能接受事實，但不怕沒有練習機會，只怕孩子選擇放手，長輩還是很希望年輕人能回來接手，只是我們不能逼迫年輕人做選擇，因為茶產業沒有熱忱也無法走得長遠。
                                </p>
                                <div class="text-center">
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        function calculateTotalValue(length) {
                            var minutes = Math.floor(length / 60),
                                seconds_int = length - minutes * 60,
                                seconds_str = seconds_int.toString(),
                                seconds = seconds_str.substr(0, 2),
                                time = minutes + ':' + seconds;

                            return time;
                        }

                        function calculateCurrentValue(currentTime) {
                            var current_hour = parseInt(currentTime / 3600) % 24,
                                current_minute = parseInt(currentTime / 60) % 60,
                                current_seconds_long = currentTime % 60,
                                current_seconds = current_seconds_long.toFixed(),
                                current_time = (current_minute < 10 ? "0" + current_minute : current_minute) + ":" + (current_seconds < 10 ? "0" + current_seconds : current_seconds);

                            return current_time;
                        }

                        function initProgressBar() {
                            var player = document.getElementById('player');
                            var length = player.duration;
                            var current_time = player.currentTime;

                            // calculate total length of value
                            var totalLength = calculateTotalValue(length);
                            jQuery(".end-time").html(totalLength);

                            // calculate current value time
                            var currentTime = calculateCurrentValue(current_time);
                            jQuery(".start-time").html(currentTime);

                            var progressbar = document.getElementById('seekObj');
                            progressbar.value = (player.currentTime / player.duration);
                            progressbar.addEventListener("click", seek);

                            if (player.currentTime == player.duration) {
                                $('#play-btn').removeClass('pause');
                            }

                            function seek(evt) {
                                var percent = evt.offsetX / this.offsetWidth;
                                player.currentTime = percent * player.duration;
                                progressbar.value = percent / 100;
                            }
                        }

                        function initPlayers(num) {
                            for (var i = 0; i < num; i++) {
                                (function () {
                                    var playerContainer = document.getElementById('player-container'),
                                        player = document.getElementById('player'),
                                        isPlaying = false,
                                        playBtn = document.getElementById('play-btn');

                                    if (playBtn != null) {
                                        playBtn.addEventListener('click', function () {
                                            togglePlay();
                                        });
                                    }

                                    function togglePlay() {
                                        if (player.paused === false) {
                                            player.pause();
                                            isPlaying = false;
                                            $('#play-btn').removeClass('pause');
                                        } else {
                                            player.play();
                                            $('#play-btn').toggleClass('pause');
                                            isPlaying = true;
                                        }
                                    }
                                }());
                            }
                        }

                        initPlayers(jQuery('#player-container').length);
                    </script>
                    <!-- Back to Top -->
                    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
                        <i class="bi bi-arrow-up"></i>
                    </a>

                    <script>
                        $(document).ready(function () {
                            $('#modalContainer').load('modal.html');
                        });
                        $(document).ready(function () {
                            $('#myModal').modal('show');
                        });
                    </script>


                    <!-- JavaScript Libraries -->


                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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