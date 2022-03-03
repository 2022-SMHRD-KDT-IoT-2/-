<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
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
    <title>개인정보</title>
    
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/fontawesome-all.min.css" rel="stylesheet">
    <link href="./css/aos.min.css" rel="stylesheet">
    <link href="./css/swiper.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">

    <!-- Favicon 
    <link rel="icon" href="./assets/images/favicon.png">
    -->
</head>
<body>
    <%
	memberVO vo = (memberVO) session.getAttribute("loginvo");
	%>
    <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <!-- <a class="navbar-brand logo-image" href="index.html"><img src="images/logo.svg" alt="alternative"></a> -->

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <a class="navbar-brand logo-text" href="index.jsp">IoT 스마트 반사경</a>

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
			
			<!-- 상단 메뉴 부분 -->
            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" >
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
					<li class="nav-item"><a class="nav-link" href="break.jsp">고장신고</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">제품설치문의</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="productlist.jsp">제품리스트</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>
                        
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="privacy.jsp">개인정보</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="terms.jsp">제품관리</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">광고관리</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- 소셜 아이콘
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
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->


    <!-- Header -->
    <header class="ex-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <h1>개인정보</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->


    <!-- Basic -->
    <div class="mypage">
    	<h5>내 정보 수정</h5>
			<form action="PrivacyUpdate" method="post" class="mypage">
				<table class="mypage-table">
				<tr>
					<th>이름</th>
					<td><input type="text" value="<%=vo.getName() %>" name="name" class="text-field" placeholder="이름을 입력하세요"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" readonly value="<%=vo.getId() %>" name="id" class="text-field" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" value="<%=vo.getPw() %>" name="pw" class="text-field" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="<%=vo.getEmail() %>" name="email" class="text-field" placeholder="이메일을 입력하세요"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="<%=vo.getPhone() %>" name="phone" class="text-field" placeholder="전화번호를 입력하세요"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" value="<%=vo.getAddr() %>" name="addr" class="text-field" placeholder="주소를 입력하세요"></td>
				</tr>
				</table>
				<!-- 적용 버튼 누르면 DB update하고 (정보가 수정된)privacy.jsp로 돌아가게 -->
				<br><input type="submit" class="mypage-button" value="적용">
				<a href="privacy.jsp"><input type="button" class="mypage-button" value="취소"></a>
			</form>
    </div>
    <!-- end of basic -->

    
    <!-- Bottom -->
    <div class="bottom py-2 text-light" >
        <div class="container d-flex justify-content-between">
            <div>
            </div>
            <div class="bottom-box">
                
            </div>
        </div> <!-- end of container -->
    </div> <!-- end of bottom -->


    <!-- Scripts -->
    <script src="./js/bootstrap.min.js"></script><!-- Bootstrap framework -->
    <script src="./js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
    <script src="./js/swiper.min.js"></script><!-- Swiper for image and text sliders -->
    <script src="./js/aos.js"></script><!-- AOS on Animation Scroll -->
    <script src="./js/script.js"></script>  <!-- Custom scripts -->
</body>
</html>