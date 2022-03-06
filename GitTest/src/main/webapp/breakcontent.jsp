<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.BreakVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.BreakDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고장신고목록</title>
</head>
<body>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Webpage Title -->
    <title>고장신고목록</title>
    
     <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/fontawesome-all.min.css" rel="stylesheet">
    <link href="./css/aos.min.css" rel="stylesheet">
    <link href="./css/swiper.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    
    <!-- Favicon -->
    <link rel="icon" href="./assets/images/favicon.png">
</head>
<body>
<%
	BreakDAO dao=new BreakDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	BreakVO vo=dao.getOneList(no);
	memberVO vo1 = (memberVO) session.getAttribute("loginvo");
	%>

	<!-- Navigation -->
	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<!-- <a class="navbar-brand logo-image" href="index.jsp"><img src="images/logo.svg" alt="alternative"></a> -->

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<a class="navbar-brand logo-text" href="index.jsp"><img src="assets/images/bluelogo.svg" width="200" height="200"></a>

			<button class="navbar-toggler p-0 border-0" type="button"
				id="navbarSideCollapse" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse offcanvas-collapse"
				id="navbarsExampleDefault">
				<ul class="navbar-nav ms-auto navbar-nav-scroll">
				<%
		if (vo == null) {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">로그인</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">로그아웃</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="#introduction">제품소개</a>
					</li>
					<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">고장신고</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item" href="break.jsp">고장신고 작성</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="breaklist.jsp">고장신고 게시판</a></li>
					</ul></li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">제품설치문의</a>
					</li>
					<%
					if(vo1!=null){
						System.out.print(vo1.getYn());
						if(vo1.getYn().equals("Y")||vo1.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">제품리스트</a></li>");
						}
					}
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
	<!-- end of navigation -->
    
	<!-- Header -->
    <header class="ex-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <h1>고장 신고 페이지</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->

    <!-- Contact -->
    <section class="breakcontent" id="contact">
        <div>
            <div class="row">
                <div class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5" data-aos="fade-right">
                    <div>
                        <div class="text-center">
                            
    <div class="content">
		<h3><%=vo.getName() %></h3>
		<table class="content-table">
			<tr>
				<td class="td-title">이름</td>
				<td class= "td-text"><%=vo.getName() %></td>
				<td class="td-title">신고<br>날짜</td>
				<td class= "td-text"><%=vo.getDate() %></td>
			</tr>
			<tr>
				<td class="td-title">핸드폰<br>번호</td>
				<td class= "td-text"><%=vo.getPhone() %></td>
				<td class="td-title">제품<br>번호</td>
				<td class= "td-text"><%=vo.getProduct_num() %></td>
			</tr>
			<tr>
				<td class="td-title">내용</td>
				<td class= "td-text" colspan="3"><%=vo.getContent() %></td>
			</tr>

				<%
					if(vo1!=null){
						if(vo1.getYn().equals("Y")||vo1.getYn().equals("y")){%>
									<tr>
							<td colspan="4">
						<input type="button" class="button-content" value="글삭제" onclick="location.href='BreakDelete?no=<%=vo.getNum()%>'">
										</td>
				</tr>
						<%
						}
					}
					%>

				</table>
    </div>
                        </div>
                    </div> <!-- end of div -->
                </div> <!-- end of col -->
                <div id="map" class="col-lg-6 d-flex align-items-center" style="width:800px;height:400px;">                
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </section> <!-- end of contact -->
    
    
   <div class="location-fixed">		
		<section class="location text-light py-5">
      <div class="container" data-aos="zoom-in">
         <div class="row">
            <div class="col-lg-3 d-flex align-items-center">
               <div class="p-2">
                  <i class="far fa-map fa-3x"></i>
               </div>
               <div class="ms-2">
                  <h6>주소</h6>
                  <h6>광주광역시 동구<br>스마트인재개발원</h6>
                  
               </div>
            </div>
            <div class="col-lg-3 d-flex align-items-center">
               <div class="p-2">
                  <i class="fas fa-mobile-alt fa-3x"></i>
               </div>
               <div class="ms-2">
                  <h6>연락처</h6>
                  <p>82) 010-1234-5678</p>
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
      </div>
      <!-- end of container -->
   </section>
   <!-- end of location -->
	<!-- Bottom -->
	<div class="bottom-fixed">
	<div class="bottom py-2 text-light">
		<div class="container d-flex justify-content-between">
			<div></div>
			<div class="bottom-box"></div>
		</div>
		<!-- end of container -->
	</div>
	</div>
	<!-- end of bottom -->
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218"></script>
    
    <!-- 카카오 맵 -->
    <script>
    var container = document.getElementById('map');
    var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
    </script>
    
    
    <!-- Scripts -->
    <script src="./js/bootstrap.min.js"></script><!-- Bootstrap framework -->
    <script src="./js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
    <script src="./js/swiper.min.js"></script><!-- Swiper for image and text sliders -->
    <script src="./js/aos.js"></script><!-- AOS on Animation Scroll -->
    <script src="./js/script.js"></script>  <!-- Custom scripts -->
</body>
</html>