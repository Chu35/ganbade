<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <% String memberName = (String) session.getAttribute("memberName"); %>
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
	<!-- <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet"> -->

	<!-- Icon Font Stylesheet -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
				<img src="img/logo.png" alt="Website Logo" width="70px" height="auto"/>
			</a>
			<a href="index.jsp" class="navbar-brand ms-4 ms-lg-0">
				<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
			</a>
			<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse" id="navbar-toggler">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto p-4 p-lg-0">
					<a href="index.jsp#home" class="nav-item nav-link">首頁</a>
					<a class="nav-item nav-link" data-bs-toggle="modal" data-bs-target="#myModal">許願茶池</a>
					<div class="nav-item dropdown">
						<a href="knowl.jsp" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
							aria-expanded="true">知識調茶局</a>
						<div class="dropdown-menu border-light m-0" data-bs-popper="none">
							<a href="knowl.jsp" class="dropdown-item">茶種介紹</a>
							<a href="story.jsp" class="dropdown-item">故事專訪</a>
							<a href="brew.jsp" class="dropdown-item">泡法介紹</a>

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
	<!-- Navbar End -->

	<!-- Keyvision Start -->
	<div id="home" class="container-fluid p-0 mb-1 wow fadeIn">
		<div id="image-container">
			<img src="img/kv1.png" alt="Original Image" class="image w-100">
			<img src="img/kv2.png" alt="Original Image" class="image w-100">
			<img src="img/kv3.png" alt="Left Image" class="image left-image w-100">
			<img src="img/kv4.png" alt="Right Image" class="image right-image w-100">
			<img src="img/kv5.png" alt="Right Image" class="image right-image w-100">
			<img src="img/kv7.png" alt="Left Image" class="image left-image w-100">
			<img src="img/kv9.png" alt="Right Image" class="image right-image w-100">
			<img src="img/黑.png" alt="Original Image" class="image w-100">
			<img src="img/kv10.png" alt="Original Image" class="image w-100">
			<div class="scroll-icon">
				<div class="scroll-down bounce">
					<a href="#life" style="color: #fff;">
						<i class="fa fa-chevron-down"></i>
						<p>Scroll Down</p>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- keyvision End -->
	

	<!-- proc Start -->
	<div id="life" class="container-xxl py-4">
		<div class="container">
			<div class="text-center mx-auto" style="max-width: 1000px;">
				<div class="head text-center">
					<h1 class="mb-3" style="position: absolute;">製茶流程</h1>
					<div class="images-box" id="imageContainer">
						<img id="img1" src="img/採菁.gif" alt="stack" class="scroll-img">
						<img id="img2" src="img/萎凋.gif" alt="stack" class="scroll-img">
						<img id="img3" src="img/浪菁.gif" alt="stack" class="scroll-img">
						<img id="img4" src="img/發酵.gif" alt="stack" class="scroll-img">
						<img id="img5" src="img/殺菁.gif" alt="stack" class="scroll-img">
						<img id="img6" src="img/揉捻.gif" alt="stack" class="scroll-img">
						<img id="img7" src="img/乾燥.gif" alt="stack" class="scroll-img">
						<img id="img8" src="img/烘焙.gif" alt="stack" class="scroll-img">
					</div>
					<div class="content-box">
						<div class="heading" id="heading1">
							<h2>採菁</h2>
							<p>採菁是摘斷葉間幼梗的中部。採摘標準視老嫩程度而定，一般為一心兩葉至三葉，茶菁的完整度關係到茶葉製造的品質。</p>
						</div>
						<div class="heading" id="heading2">
							<h2>萎凋</h2>
							<p>萎凋可分為日光（熱風）萎凋及室內萎凋，日光（熱風）萎凋室藉由熱能使茶葉水分消散，日光萎凋後移入室內進行室內萎凋繼續使茶葉水分消散。萎凋過程可使茶葉重量、體積、硬度降低，促進化學反應產生特殊香氣及滋味。</p>
						</div>
						<div class="heading" id="heading3">
							<h2>浪菁</h2>
							<p>製作部分發酵茶時，初期藉由翻動，使茶菁水分重新分配，達到減低茶梗水分的目的。後續藉由攪拌使茶葉細胞摩擦破損，增加多元酚氧化酶及兒茶素作用，進而控制茶葉發酵的程度。</p>
						</div>
						<div class="heading" id="heading4">
							<h2>發酵</h2>
							<p>因揉捻後的茶葉發酵程度不足，所以需將茶葉堆疊進行補足發酵，使多元酚氧化酶與兒茶素類充分反應。</p>
						</div>
						<div class="heading" id="heading5">
							<h2>殺菁</h2>
							<p>藉由熱破壞茶葉中酵素活性，並促使茶葉水分消散、葉片軟化，利於後續揉捻成形，並去除茶葉不良的菁味及穩定茶菁色澤及香氣。<p>
						</div>
						<div class="heading" id="heading6">
							<h2>揉捻</h2>
							<p>使茶葉捲曲形成條狀，並破壞茶葉的細胞組織，使茶葉的汁液流出附著於表面，增加沖泡時的風味；在揉捻中使茶葉細胞劇烈破壞，促使多元酚氧化酶及兒茶素反應。</p>
						</div>
						<div class="heading" id="heading7">
							<h2>乾燥</h2>
							<p>以熱風去除茶葉中的水分，使其含水量降至5%以下，延長保存期限，並可停止發酵作用及其他生化反應，使品質固定。此外加熱過程亦可引起若干化學成分的變化促使茶葉香氣形成。茶葉烘乾後可使形狀固定，方便包裝及運輸。</p>
						</div>
						<div class="heading" id="heading8">
							<h2>烘焙</h2>
							<p>烘焙具有去除水分效果，有效延長茶葉貯藏壽命，並改善粗製茶普遍帶有之臭味和不良雜味，增加茶葉的特殊香氣及特色性。</p>
						</div>
					</div>
				</div>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.0/gsap.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.0/ScrollTrigger.min.js"></script>
				<script>
					gsap.registerPlugin(ScrollTrigger);
					function setScrollElement(selector, start, end) {
						gsap.to(selector, {
							scrollTrigger: {
								trigger: selector,
								toggleActions: 'play reverse play reverse',
								start: start,
								end: end,
							},
							opacity: 1,
						});
					}
					setScrollElement('#heading1', '0s', '+=1000s');
					setScrollElement('#heading2', '+=1000s', '+=1000s');
					setScrollElement('#heading3', '+=2000s', '+=1000s');
					setScrollElement('#heading4', '+=3000s', '+=1000s');
					setScrollElement('#heading5', '+=4000s', '+=1000s');
					setScrollElement('#heading6', '+=5000s', '+=1000s');
					setScrollElement('#heading7', '+=6000s', '+=1000s');
					setScrollElement('#heading8', '+=7000s', '+=1000s');
					setScrollElement('#img1', '0s', '+=1000s');
					setScrollElement('#img2', '+=1000s', '+=1000s');
					setScrollElement('#img3', '+=2000s', '+=1000s');
					setScrollElement('#img4', '+=3000s', '+=1000s');
					setScrollElement('#img5', '+=4000s', '+=1000s');
					setScrollElement('#img6', '+=5000s', '+=1000s');
					setScrollElement('#img7', '+=6000s', '+=1000s');
					setScrollElement('#img8', '+=7000s', '+=1000s');
					gsap.to('.head', {
						scrollTrigger: {
							pin: '.head',
							end: '+=8000s',
							pinSpacing: true,
						},
					});
				</script>
			</div>
		</div>
	</div>
	<!-- proc End -->

	<!-- knowledge -->
	<div class="container-xxl py-4">
		<div class="container">
		  <div class="text-center mx-auto" style="max-width: 1000px; height: auto;">
			<h1 class="mb-2">不同茶種有不同的風味與特色</h1>
			<div class="mb-3"><p >是否你曾經也有以下困擾：<br>
				「不同品種的茶到底差在哪 ?」<br>
				「為什麼同樣顏色的茶湯喝起來風味卻不同呢 ?」<br></p>
			<a href="knowl.jsp" id="knowlbtn" class="btn btn-primary">看更多</a></div>
			<div id="type" class="slider">
			  <div class="slide-track" id="slideTrack">
				<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				try {
				  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				  String url = "jdbc:sqlserver://127.0.0.1:1433;database=109_ganbade";
				  String user = "chu";
				  String password = "0725";
				  conn = DriverManager.getConnection(url, user, password);
				  // Query tea data from the database
				  stmt = conn.createStatement();
				  String query = "SELECT * FROM Knowledge";
				  rs = stmt.executeQuery(query);
	  
				  while (rs.next()) {
					String id = rs.getString("id");
					String name = rs.getString("name");
					String imagePath = rs.getString("image_path");
	  
					// Create a unique modal ID
					String modalId = "exampleModal" + id;
				%>
				
				<div class="slide">
				  <div class="img">
					<img data-bs-toggle="modal" data-bs-target="#<%= modalId %>" src="<%= imagePath %>" alt="<%= name %>">
				  </div>
				  <div class="title"><%= name %></div>
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
			  </div>
			</div>
		  </div>			  
		</div>
	  </div>
	<!-- knowledge -->

	<!-- fun -->
	<div class="container-xxl py-4">
		<div class="container">
			<div class="text-center mx-auto" style="max-width: 800px;">
				<h1 class="mb-3">台北哪裡有茶</h1>
			</div>
			<!-- Panel 1 -->
			<div class="row">
				<div id="indexfun1" class="indexfun mb-4">
					<div class="text-center mx-auto" style="max-width: 800px;">
						<a href="fun.jsp"><img src="img/貓空.JPG" class="d-block img-fluid" alt="貓空"></a>
					</div>
				</div>
				<!-- Panel 2 -->
				<div id="indexfun2" class="indexfun mb-4">
					<div class="text-center mx-auto" style="max-width: 800px;">
						<a href="fun.jsp"><img src="img/坪林.JPG" class="d-block img-fluid" alt="坪林"></a>
					</div>
				</div>
			</div>
			<!-- Panel 3 -->
			<div class="row">
				<div id="indexfun3" class="indexfun mb-4">
					<div class="text-center mx-auto" style="max-width: 800px;">
						<a href="fun.jsp"><img src="img/大稻埕.JPG" class="d-block img-fluid" alt="大稻埕"></a>
					</div>
				</div>
				<!-- Panel 4 -->
				<div id="indexfun4" class="indexfun mb-4">
					<div class="text-center mx-auto" style="max-width: 800px;">
						<a href="fun.jsp"><img src="img/西門.JPG" class="d-block img-fluid" alt="西門"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- fun -->

	<!-- store -->
		<div class="container-xxl py-4">
			<div class="container">
				<div class="text-center mx-auto" style="max-width: 1000px;">
					<h1 class="mb-4">滴滴商城</h1>
				</div>
				<div class="container mb-5">
					<div class="row" style="justify-content:flex-start;">
						<div class="indexshopping">
							<img class="card-img-top" src="https://static.wixstatic.com/media/88d72e_29994688105f4153aaebd81887bd6e93~mv2_d_3024_4032_s_4_2.jpg/v1/fill/w_422,h_563,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/88d72e_29994688105f4153aaebd81887bd6e93~mv2_d_3024_4032_s_4_2.jpg" alt=" ">
							<div class="card-block">
								<h4 class="card-title">茶包/茶葉</h4>
								<a href="store.jsp">看更多 →</a>
							</div>
						</div>
						<div class="indexshopping">
							<img class="card-img-top" src="https://shoplineimg.com/579027d161706979befd2e01/65274549dd82be00119d90f7/540x.webp?source_format=jpg" alt=" ">
							<div class="card-block">
								<h4 class="card-title">茶禮盒</h4>
								<a href="store.jsp">看更多 →</a>
							</div>
						</div>
						<div class="indexshopping">
							<img class="card-img-top" src="https://www.tdh.com.tw/static/ecommerce/74/74385/media/catalog/product/cache/1/small_image/210x/9df78eab33525d08d6e5fb8d27136e95/_/-/_-_/www.tdh.com.tw-%E6%96%87%E5%B1%B1%E5%8C%85%E7%A8%AE%E8%8C%B6%E7%94%9F%E4%B9%B3%E6%8D%B2-20.jpg" alt=" ">
							<div class="card-block">
								<h4 class="card-title">茶點心</h4>
								<a href="store.jsp">看更多 →</a>
							</div>
						</div>
						<div class="indexshopping">
							<img class="card-img-top" src="https://uanuan.com/cdn/shop/files/white-close_1600x.jpg?v=1687228556" alt=" ">
							<div class="card-block">
								<h4 class="card-title">其他</h4>
								<a href="store.jsp">看更多 →</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- store -->
	
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
		<i class="bi bi-arrow-up"></i>
	</a>
	<!-- Back to Top -->

	<!-- footer -->
	<footer class="footer-distributed">
		<div class="footer-left">	
			<img src="img/logo.png" alt="logo" width="150px">
			<p class="footer-links">
				<a href="index.jsp" class="link-1">首頁</a>
				<a href="knowl.jsp">知識調查局</a>
				<a href="fun.jsp">茶遊此地</a>
				<a href="contact.jsp">關於我們</a>
				<a href="store.jsp">滴滴商城</a>
				<a href="member.jsp">會員中心</a>
			</p>
			<p class="footer-company-name">Ganbade © 2023</p>
		</div>
		<div class="footer-center">
			<div>
				<a href="https://www.instagram.com/ganbade.tea/">
				<i class="fab fa-instagram"></i>
				<p>@ganbade.tea</p></a>
			</div>
			<div>
				<a href="https://www.facebook.com/profile.php?id=100091759804013">
				<i class="fab fa-facebook"></i>
				<p>甘吧茶ㄉㄟˊ </p></a>
			</div>
			<div>
				<a href="https://www.tiktok.com/@ganbade.tea?lang=zh-Hant-TW">
					<i class="fab fa-tiktok"></i>
					<p>甘吧茶ㄉㄟˊ </p></a>
			</div>
			<div>
				<a href="mailto:icscheerstea@gmail.com">
				<i class="fa fa-envelope"></i>
				<p>icscheerstea@gmail.com</p></a>
			</div>
		</div>
		<div class="footer-right">
			<p class="footer-company-about">
				<span>關於甘吧茶ㄉㄟˊ</span>
				透過建立網站與社群經營，帶年輕人從我們的視角走遍台灣體驗茶，讓大家更了解台灣茶的知識與故事。
			</p>
		</div>
	</footer>
	<!-- footer -->
	<!-- modal code -->
	<div id="modalContainer"></div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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