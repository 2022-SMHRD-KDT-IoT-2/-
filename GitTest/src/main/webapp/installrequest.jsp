<%@page import="com.VO.memberVO"%>
<%@page import="com.DAO.InstallDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>설치문의</title>
</head>
<body>

	<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<title>Privacy</title>
<!-- Styles -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
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
	InstallDAO dao = new InstallDAO();
	memberVO vo = (memberVO) session.getAttribute("loginvo");
	%>

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
					<li class="nav-item"><a class="nav-link" href="break.jsp">고장신고</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">제품설치문의</a>
					</li>
					<%
					if(vo!=null){
						System.out.print(vo.getYn());
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){
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


	<!-- Header -->
	<header class="ex-header">
		<div class="container">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h1>설치문의게시판</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<!-- 설치 테이블 -->
	<!-- Header -->
	<div class="board">
		<div class="container">
			<div class="row">
				<div class="intallrequestForm">
					<form  action="InstallService" method="post">
					<h3 class="request-h5">설치문의작성</h3>
						<div class="table2-div">
						<table class="board_table2">
							<tr>
								<th>설치지역</th>
							</tr>
							<tr>
								<td><input class="text-box" type="text" name="loc"></td>
							</tr>
							<tr>
								<th>이름</th>
							</tr>
							<tr>
								<td><input class="text-box" type="text" name="name" value="<%=vo.getName()%>"></td>
							</tr>
							<tr>
								<th>전화번호</th>
							</tr>
							<tr>
								<td><input class="text-box" type="text" name="phone" value="<%=vo.getPhone()%>"></td>
							</tr>
							<th>아이디</th>
							</tr>
							<tr>
								<td><input class="text-box" readonly type="text" name="id" value="<%=vo.getId()%>" ></td>
							</tr>
						</table>
						</div>
							<br><input type="submit" class="list-button" value="글쓰기">
						
					</form>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of ex-basic-1 -->
	
		<!-- Bottom -->
		<div class="bottom-fixed">
    <div class="bottom py-2 text-light" >
        <div class="container d-flex justify-content-between">
            <div>
            </div>
            <div class="bottom-box">
                
            </div>
        </div> <!-- end of container -->
    </div> <!-- end of bottom -->
    </div>
	
</body>
</html>