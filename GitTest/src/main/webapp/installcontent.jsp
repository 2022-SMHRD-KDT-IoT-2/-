<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.InstallVO"%>
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
    <title>설치문의</title>
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
	InstallDAO dao=new InstallDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	InstallVO vo=dao.getOneList(no);
	memberVO vo1 = (memberVO) session.getAttribute("loginvo");
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
		if (vo1 == null) {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">로그인</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">로그아웃</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="index.jsp#introduction">제품소개</a>
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

						if(vo1.getYn().equals("Y")||vo1.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">제품리스트</a></li>");
						}
					}
					%>
					<%if(vo1!=null){ %>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">개인정보</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">제품관리</a></li>
						</ul></li>
						<%} %>
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
                    <h1>설치문의게시판</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    <div class="board">
		<div class="content">
		<h3>상세내용</h3>
    	<div class="contentdiv-div">
    	<div class=content-div>
		<table class="content-table">
			<tr>
				<td class="td-title">이름</td>
				<td class= "td-text"><%=vo.getRequest_name() %></td>
				<td class="td-title">처리상태</td>
				<td class= "td-text"><%=vo.getRequest_status() %></td>
			</tr>
			<tr>
				<td class="td-title">지역</td>
				<td class= "td-text" colspan="3"><%=vo.getRequest_loc() %></td>
			</tr>
			<tr>
				<td class="td-title">핸드폰</td>
				<td class= "td-text" colspan="3"><%=vo.getRequest_Phone() %></td>
			</tr>
			<tr>
				<td class="td-title">날짜</td>
				<td class= "td-text" colspan="3"><%=vo.getRequest_date() %></td>
			</tr>
						<tr>
				<td class="td-title">아이디</td>
				<td class= "td-text" colspan="3"><%=vo.getUser_id() %></td>
			</tr>
			
			<tr>
				<td class="td-button" colspan="4">
					<input type="button" class="button-content" value="목록" onclick="location.href='install.jsp'">
					<%if(vo1!=null){
					if(vo.getUser_id().equals(vo1.getId())||vo1.getYn().equals("Y")||vo1.getYn().equals("y")) {%>
					<input type="button" class="button-content" value="수정" onclick="location.href='installmodify.jsp?no=<%=vo.getRequest_req()%>'"> 
					<input type="button" class="button-content" value="삭제" onclick="location.href='InstallDelete.do?no=<%=vo.getRequest_req()%>'">
					<% }
					}%>
				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
		
	<!-- Location -->
	<jsp:include page="footer.jsp"></jsp:include>
   
	<!-- Bottom -->
	<div class="bottom py-2 text-light">
		<div class="container d-flex justify-content-between">
			<div></div>
			<div class="bottom-box"></div>
		</div>
		<!-- end of container -->
	</div>
	<!-- end of bottom -->
	
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
</body>
</html>