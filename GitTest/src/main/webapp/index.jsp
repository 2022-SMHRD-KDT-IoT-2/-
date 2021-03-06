
<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<!-- SEO Meta Tags -->
<meta name="description" content="Your description">
<meta name="author" content="Your name">

<!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
<meta property="og:site_name" content="" />
<!-- website name -->
<meta property="og:site" content="" />
<!-- website link -->
<meta property="og:title" content="" />
<!-- title shown in the actual shared post -->
<meta property="og:description" content="" />
<!-- description shown in the actual shared post -->
<meta property="og:image" content="" />
<!-- image link, make sure it's jpg -->
<meta property="og:url" content="" />
<!-- where do you want your post to link to -->
<meta name="twitter:card" content="summary_large_image">
<!-- to have large image post format in Twitter -->

<!-- Webpage Title -->
<title>Smart Delineator</title>

<!-- Styles(스타일 시트) -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/fontawesome-all.min.css" rel="stylesheet">
<link href="./css/aos.min.css" rel="stylesheet">
<link href="./css/swiper.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">

<!-- Favicon(상단바 icon) 
    <link rel="icon" href="./assets/images/favicon.png">
    -->

<!-- 제품설명크기 조질 -->
<style>
#about {
	height: 600px
}

</style>


</head>
<body>
	<%
	memberVO vo = (memberVO) session.getAttribute("loginvo");
	%>

	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<!-- <a class="navbar-brand logo-image" href="index.jsp"><img src="images/logo.svg" alt="alternative"></a> -->

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<a class="navbar-brand logo-text" href="index.jsp"><img
				src="assets/images/bluelogo.svg" width="200" height="200"></a>

			<button class="navbar-toggler p-0 border-0" type="button"
				id="navbarSideCollapse" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse offcanvas-collapse"
				id="navbarsExampleDefault">
				<ul class="navbar-nav ms-auto navbar-nav-scroll">
					<%
					if (vo == null) {
						out.print(
						"<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">로그인</a></li>");
					} else {
						out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">로그아웃</a></li>");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="#introduction">제품소개</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">고장신고</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item" href="break.jsp">고장신고 작성</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="breaklist.jsp">고장신고
									게시판</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">제품설치문의</a>
					</li>
					<%
					if (vo != null) {

						if (vo.getYn().equals("Y") || vo.getYn().equals("y") || vo.getYn().equals("a") || vo.getYn().equals("A")) {
							out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">제품리스트</a></li>");
						}
					}
					%>
					<%
					if (vo != null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">개인정보</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">제품관리</a></li>
						</ul></li>
					<%
					}
					%>
					<!-- 
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                     -->
				</ul>
				<!-- 소셜 아이콘 숨김
                <span class="nav-item social-icons">
                    <span class="fa-stack">
                        <a href="#your-link">
                            <i class="fas fa-circle fa-stack-2x"></i>
                            <i class="fab fa-facebook-f fa-stack-1x"></i>
                        </a>
                    </span>
                    <span class="fa-stack">
                        <a href="#your-link">
                            <i class="fas fa-circle fa-stack-2x"></i>
                            <i class="fab fa-twitter fa-stack-1x"></i>
                        </a>
                    </span>
                </span>
                 -->
			</div>
			<!-- end of navbar-collapse -->
		</div>
		<!-- end of container -->
	</nav>
	<!-- end of navbar -->
	<!-- end of navigation -->
	<!-- 메인페이지 -->
	<section class="home py-5 d-flex align-items-center" id="header">
		<div class="container text-light py-5" data-aos="fade-right">
			<h1 class="headline" style="font-size: 80px;">
				For Your <br> <span class="home_text">Safety</span> Drive
			</h1>
			<p class="para para-light py-3">스마트 델리네이터는 야간 급커브도로 안전운행을 지원합니다</p>
			<div class="d-flex align-items-center">
				<!-- 
                <p class="p-2"><i class="fas fa-laptop-house fa-lg"></i></p>
                <p>Lorem ipsum dolor sit amet.</p>  
                 -->
			</div>
			<div class="d-flex align-items-center">
				<!--  
                <p class="p-2"><i class="fas fa-wifi fa-lg"></i></p>
                <p>Lorem ipsum dolor sit amet.</p>  
            	-->
			</div>
			<div class="my-3">
				<!-- 
                <a class="btn" href="#plans">View Plans</a>
            	 -->
			</div>
		</div>
		<!-- end of container -->
	</section>
	<!-- end of home -->

	<!-- Information -->
	<section class="information">
		<div class="container-fluid">
			<div class="row text-light">
				<div class="col-lg-4 text-center p-5" data-aos="zoom-in">
					<i class="fas fa-map-marked-alt fa-3x p-2"></i>
					<h4 class="py-3">Product Location Notification</h4>
					<p class="para-light">You can check the location of the
						products you manage!</p>
				</div>
				<div class="col-lg-4 text-center p-5" data-aos="zoom-in">
					<i class="fas fa-tools fa-3x p-2"></i>
					<h4 class="py-3">Easy Installation</h4>
					<p class="para-light">This product is easy to install at an
						affordable price!</p>
				</div>
				<div class="col-lg-4 text-center p-5 text-dark" data-aos="zoom-in">
					<i class="fas fa-satellite-dish fa-3x p-2"></i>
					<h4 class="py-3">24/7 Management</h4>
					<p class="para-light">Manage product status in real time
						through product information!</p>
				</div>
			</div>
			<!-- end of container -->
	</section>
	<!-- end of information -->

	<section class="work d-flex align-items-center py-5" id="introduction">
		<div class="container-fluid text-light">
			<div class="row">
				<div class="col-lg-6 d-flex align-items-center"
					data-aos="fade-right">
					<img class="img-fluid" src="./assets/images/road.jpg" alt="work">
				</div>
				<div class="col-lg-5 d-flex align-items-center px-4 py-3"
					data-aos="">
					<div class="row">
						<div class="text-center text-lg-start py-4 pt-lg-0">
							<p>About Smart Delineator</p>
							<h1 class="py-2">Smart Delineator</h1>
							<p class="para-light">야간 급커브도로 교통사고 방지를 위한 스마트 비상경고 장치</p>
							<p class="para-light">스마트 델리네이터는 야간 안전운행을 지원합니다</p>
						</div>
						<div class="container" data-aos="fade-up">
							<div class="row g-5">
								<div class="col-6 text-start">

									<i class="fas fa-chart-line fa-2x text-start"></i>
									<h2 class="purecounter" data-purecounter-start="0"
										data-purecounter-end="3588" data-purecounter-duration="6">1</h2>
									<p>NUMBER OF INSTALLATIONS</p>
								</div>

								<div class="col-6">
									<i class="fas fa-users fa-2x"></i>
									<h2 class="purecounter" data-purecounter-start="0"
										data-purecounter-end="1255" data-purecounter-duration="3">1</h2>
									<p>SIGN UP CUSTOMER</p>
								</div>
								<div class="col-6">
									<i class="fas fa-clock fa-2x"></i>
									<h2 class="purecounter" data-purecounter-start="0"
										data-purecounter-end="82" data-purecounter-duration="3">1</h2>
									<h2>%</h2>
									<p>VEHICLE ACCIDENT REDUCTION</p>
								</div>
							</div>
						</div>
						<!-- end of container -->
					</div>
					<!-- end of row -->
				</div>
				<!-- end of col-lg-5 -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
	<!-- end of work -->

	<!-- About -->
	<div class="index-about">
		<section class="about d-flex align-items-center text-light py-5"
			id="about">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-lg-7" data-aos="fade-right">
						<p>ABOUT US</p>
						<h1>POINT 1</h1>
						<h4 class="py-2 para-light">
							도로공사 등의 큰 비용손실 없이<br>본 제품만으로 손쉬운 급커브구간 환경개선이 가능합니다.
						</h4>
						<p class="py-2 para-light">
							It is possible to easily improve the environment of steep slopes
							<br> only with this product without significant cost loss
							due to road construction.
						</p>
					</div>
					<div class="col-lg-5 text-center py-4 py-sm-0" data-aos="fade-down">
						<img class="img-fluid" src="./assets/images/main_pro01.png" alt="about">
					</div>
				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->

		</section>
		<!-- end of about -->

		<section class="about d-flex align-items-center text-light py-5"
			id="about">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-lg-5 text-center py-4 py-sm-0" data-aos="fade-down">
						<img class="img-fluid" src="./assets/images/main_pro02.png" alt="about">
					</div>
					<div class="col-lg-7" data-aos="fade-right">
						<p style="text-align: right">ABOUT US</p>
						<h1 style="text-align: right">POINT 2</h1>
						<h4 class="py-2 para-light" style="text-align: right">두 가지
							색상의 LED를 사용하여 위험도에 따른 가시성을 높였습니다.</h4>
						<p class="py-2 para-light" style="text-align: right">We used
							yellow LED and red LED to make it easy for anyone to see.</p>

					</div>

				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->
		</section>
		<!-- end of about -->
		<section class="about d-flex align-items-center text-light py-5"
			id="about">
			<div class="container">
				<div class="row d-flex align-items-center">
					<div class="col-lg-7" data-aos="fade-right">
						<h1>시연 동영상</h1>
						<h4 class="py-2 para-light">
							야간 급커브 도로 운행시 스마트델리네이터 자동 작동 시연 동영상 </h4>
					</div>
					<div class="col-lg-5 text-center py-4 py-sm-0" data-aos="fade-down">
						<iframe width="700" height="380"
							src="https://www.youtube.com/embed/wDrkiA74xjI" frameborder="0"
							gesture="media" allowfullscreen="" class="video"></iframe>
					</div>
				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->
		</section>


	</div>

	<!-- Location -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Scripts -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- Bootstrap framework -->
	<script src="./js/purecounter.min.js"></script>
	<!-- Purecounter counter for statistics numbers -->
	<script src="./js/swiper.min.js"></script>
	<!-- Swiper for image and text sliders -->
	<script src="./js/aos.js"></script>
	<!-- AOS on Animation Scroll -->
	<script src="./js/script.js"></script>
	<!-- Custom scripts -->
	<!-- Bottom -->
	<div class="bottom py-2 text-light">
		<div class="container d-flex justify-content-between">
			<div></div>
			<div class="bottom-box"></div>
		</div>
		<!-- end of container -->
	</div>
	<!-- end of bottom -->
	<script src="https://kit.fontawesome.com/70d105e515.js"
		crossorigin="anonymous"></script>
</body>
</html>