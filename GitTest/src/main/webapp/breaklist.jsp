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
<title>고장신고</title>
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
<title>고장신고</title>

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
	BreakDAO dao = new BreakDAO();

	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int fcount = 0;
	count = dao.getCount();
	fcount = dao.getfCount(sel, find);
	ArrayList<BreakVO> al = null;
	ArrayList<BreakVO> fal = null;
	if (count > 0 && find == null) {
		al = dao.getList(startRow, endRow);
	}
	if (fcount > 0) {
		fal = dao.getfList(startRow, endRow, sel, find);
	}
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
					if(vo!=null){
						System.out.print(vo.getYn());
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">제품리스트</a></li>");
						}
					}
					%>
					<% if(vo!=null){%>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">개인정보</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">제품관리</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">광고관리</a></li>
						</ul></li>
						<%}
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


	<!-- Header -->
	<header class="ex-header">
		<div class="container">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h1>고장 신고 페이지</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<!-- 게시판 테이블 -->
	<!--  
    <section class="contact d-flex align-items-center py-5" id="contact">
        <div class="container-fluid text-light">
            <div class="row">
                <div class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5" data-aos="fade-right">
                    <div style="width:90%">
                        <div class="text-center text-lg-start py-4 pt-lg-0">
                            -->
<body>

		<div class="board">
			<h3>고장신고 목록</h3>
			<div class="table-div">
			<table class="board_table">
				<tr>
					<th width="20%">No.</th>
					<th width="20%">이름</th>
					<th width="30%">제품순번</th>
					<th width="20%">신고날짜</th>
				</tr>
				<%
				if (count > 0 && fcount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
					int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
					for (int i = 0; i < al.size(); i++) {
						BreakVO board = al.get(i); // 반환된 list에 담긴 참조값 할당
				%>
				<tr>
					<td><%=number--%></td>
					<td><%=board.getName()%></td>
					<td>
						<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값을 갖고 content.jsp로 이동 --%> <a
						class="list-a" href="breakcontent.jsp?no=<%=board.getNum()%>"><%=board.getProduct_num()%></a>
					</td>
					<td><%=board.getDate()%></td>
				</tr>
				<%
				}
				} else if (count == 0) { // 데이터가 없으면
				%>
				<tr>
					<td colspan="6">작성된 게시글이 없습니다.</td>
				</tr>
				<%
				} else if (count > 0 && fcount != 0) {
				int number = fcount - (currentPage - 1) * pageSize; // 글 번호 순번
				for (int i = 0; i < fal.size(); i++) {
					BreakVO board = fal.get(i);
				%>
				<tr>
					<td><%=number--%></td>
					<td><%=board.getName()%></td>
					<td>
						<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%>
						<a class="list-a"
						href="breakcontent.jsp?no=<%=board.getNum()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getProduct_num()%></a>
					</td>
					<td><%=board.getDate()%></td>
				</tr>
				<%
				}
				} else { // 검색된 데이터가 없으면
				%>
				<tr>
					<td colspan="6">해당되는 게시글이 없습니다.</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="6" align="center">
						<%
						// 페이징  처리
						if (count > 0 && fcount == 0 && find == null) {
							// 총 페이지의 수
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;

							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
						%> <a class="list-a"
						href="breaklist.jsp?pageNum=<%=startPage - 10%>">[이전]</a> <%
 }

 for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
 if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
 %> [<%=i%>] <%
 } else { // 현재 페이지가 아닌 경우 링크 설정
 %> <a class="list-a" href="breaklist.jsp?pageNum=<%=i%>">[<%=i%>]
					</a> <%
 }
 } // for end

 if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
 %> <a class="list-a" href="breaklist.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
						<%
						}
						} else if (fcount > 0) { // 페이징 처리(검색 데이터)
						// 검색된 레코드의 총 페이지의 수
						int pageCount = fcount / pageSize + (fcount % pageSize == 0 ? 0 : 1);
						// 한 페이지에 보여줄 페이지 블럭(링크) 수
						int pageBlock = 10;
						// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;

						// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
						if (endPage > pageCount) {
						endPage = pageCount;
						}

						if (startPage > pageBlock) {
						%> <a
						href="breaklist.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
						<%
						}

						for (int i = startPage; i <= endPage; i++) {
						if (i == currentPage) { // 현재 페이지는 링크를 설정하지 않음
						%> [<%=i%>] <%
						} else { // 현재 페이지가 아닌 경우 링크
						%> <a href="breaklist.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]
					</a> <%
 }
 }

 if (endPage < pageCount) {
 %> <a
						href="breaklist.jsp?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>">[다음]</a>
						<%
						}
						}
						%>
					</td>
				</tr>
			</table>
			</div>
			<%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>
			<div class="search">
			<form method="get" action="breaklist.jsp">
				<select name="sel" class="sel">
					<option value="product_seq">제품순번</option>
					<option value="reporter_name">이름</option>
				</select> <input type="text" class="search-text" name="find" id="find"> 
				<input type="submit" class="search-button" value="검색">
			</form>
			<br>
							<%
					if(vo!=null){
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){%>
						<input type="button" class="button-content" value="모든글삭제" onclick="location.href='BreakAllDelete'">
						<%
						}
					}
					%>
			</div>

		</div>

</body>
<!-- 
		</div>
		</div>
		 -->
<!-- end of div -->
</div>
<!-- end of col -->
<div id="map" class="col-lg-6 d-flex align-items-center"
	style="width: 800px; height: 400px;"></div>
<!-- end of col -->
</div>
<!-- end of row -->
</div>
<!-- end of container -->
</section>
<!-- end of contact -->



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