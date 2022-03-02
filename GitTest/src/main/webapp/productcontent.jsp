<%@page import="com.VO.ProductVO"%>
<%@page import="com.DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>install</title>
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
    <title>Privacy</title>
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
	ProductDAO dao=new ProductDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	ProductVO vo=dao.getOneList(no);
%>

   <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <!-- <a class="navbar-brand logo-image" href="index.html"><img src="images/logo.svg" alt="alternative"></a> -->

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <a class="navbar-brand logo-text" href="index.html">상단 사이트 제목</a>

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
			<!-- 상단 메뉴 부분 -->
			<div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" >
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">제품소개</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">고장신고</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#plans">제품설치문의</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">광고신청</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>
                        
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="rivacy.html">개인정보</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="terms.html">제품관리</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="particle.html">광고관리</a></li>
                        </ul>
                    </li>
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
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->


    <!-- Header -->
    <header class="ex-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <h1>제품리스트</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    <center>
		<h3>작성글</h3>
		<table border="1" width="600">
			<tr>
				<td width="50">제품번호</td>
				<td width="250"><%=vo.getProduct_uid() %></td>
				<td width="50">설치위치</td>
				<td width="250"><%=vo.getProduct_loc() %></td>
			</tr>
			<tr>
				<td width="50">위도</td>
				<td width="250"><%=vo.getProduct_latitude() %></td>
				<td width="50">경도</td>
				<td width="250"><%=vo.getProduct_longitude() %></td>
			</tr>
			<tr>
				<td width="50">설치일자</td>
				<td width="250"><%=vo.getProduct_date() %></td>
				<td width="50">관리자아이디</td>
				<td width="250"><%=vo.getUser_id() %></td>
			</tr>
			
			<tr align="center">
				<td colspan="4">
					<%-- 버튼을 클릭하면 해당 페이지로 이동 / 수정과 삭제는 get방식으로 no값을 전달 --%>
					<input type="button" value="글목록" onclick="location.href='productlist.jsp'">
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?no=<%=no%>'"> 
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?no=<%=no%>'">
				</td>
			</tr>
		</table>
	</center>
        
</body>
</html>