
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

						if (vo.getYn().equals("Y") || vo.getYn().equals("y")) {
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
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">광고관리</a></li>
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
				For Your <br>
				<span class="home_text">Safety</span> Drive
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
		</div>
		<!-- end of container -->
	</section>
	<!-- end of information -->

	<!-- 제품소개 -->
	<section class="about d-flex align-items-center text-light py-5"
		id="introduction">
		<div class="container">
			<div class="intro">
				<h2>제품소개</h2>
			</div>
			<div class="box">
				<div class="box_black">
					<p class="inner_content">img</p>
				</div>
				<div class="box_white">
					<p class="inner_content">text</p>
				</div>
			</div>
			<!-- 
				<div class="col-lg-5 text-center py-4 py-sm-0" data-aos="fade-down">
					<img class="img-fluid" src="./assets/images/about.jpg" alt="about">
				</div>
				 -->
		</div>
		<!-- end of container -->
	</section>
	<!-- end of about -->
	
	<section class="work d-flex align-items-center py-5" >
        <div class="container-fluid text-light">
            <div class="row">
                <div class="col-lg-6 d-flex align-items-center" data-aos="fade-right">
                    <img class="img-fluid" src="./assets/images/road.jpg" alt="work">        
                </div>
                <div class="col-lg-5 d-flex align-items-center px-4 py-3" data-aos="">
                    <div class="row">
                        <div class="text-center text-lg-start py-4 pt-lg-0">
                            <p>About Smart Delineator</p>
                            <h2 class="py-2">Smart Delineator</h2>
                            <p class="para-light">제품소개가 여기서부터 시작되는 느낌으로 만들 예정!</p>                         
                            <p class="para-light">우리는 아직 데이터가 없어서 목표를 여기에 넣을까 합니다.</p>
                        </div>
                        <div class="container" data-aos="fade-up">
                            <div class="row g-5">
                                <div class="col-6 text-start" >
                                
                                    <i class="fas fa-briefcase fa-2x text-start"></i>
                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="1258" data-purecounter-duration="3">1</h2>
                                    <p>PROJECTS COMPLETED</p>
                                </div>
                                <div class="col-6" >
                                    <i class="fas fa-award fa-2x"></i>
                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="150" data-purecounter-duration="3">1</h2>
                                    <p>AWARDS</p>
                                </div>
                                <div class="col-6">
                                    <i class="fas fa-users fa-2x"></i>
                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="1255" data-purecounter-duration="3">1</h2>
                                    <p>CUSTOMER ACTIVE</p>
                                </div>
                                <div class="col-6">
                                    <i class="fas fa-clock fa-2x"></i>
                                    <h2 class="purecounter" data-purecounter-start="0" data-purecounter-end="1157" data-purecounter-duration="3">1</h2>
                                    <p>GOOD REVIEWS</p>
                                </div>
                            </div>
                        </div> <!-- end of container -->
                    </div> <!-- end of row -->
                </div> <!-- end of col-lg-5 -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </section> <!-- end of work -->

	<!-- Location -->
	<section class="location text-light py-5">
		<div class="container" data-aos="zoom-in">
			<div class="row">
				<div class="col-lg-3 d-flex align-items-center">
					<div class="p-2">
						<i class="far fa-map fa-3x"></i>
					</div>
					<div class="ms-2">
						<h6>주소</h6>
						<p>광주광역시 동구 예술길 31-15 스마트인재개발원</p>
					</div>
				</div>
				<div class="col-lg-3 d-flex align-items-center">
					<div class="p-2">
						<i class="fas fa-mobile-alt fa-3x"></i>
					</div>
					<div class="ms-2">
						<h6>연락처</h6>
						<p>010-1234-5678</p>
					</div>
				</div>
				<div class="col-lg-3 d-flex align-items-center">
					<div class="p-2">
						<i class="far fa-envelope fa-3x"></i>
					</div>
					<div class="ms-2">
						<h6>이메일</h6>
						<p>kdb7603@naver.com</p>
					</div>
				</div>
				<div class="col-lg-3 d-flex align-items-center">
					<div class="p-2">
						<i class="far fa-clock fa-3x"></i>
					</div>
					<div class="ms-2">
						<h6>상담문의</h6>
						<p>09:00 AM - 18:00 PM</p>
					</div>
				</div>
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
	<!-- end of location -->


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
</body>
</html>