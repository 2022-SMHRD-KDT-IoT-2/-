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
<title>����Ű�</title>
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
<title>����Ű�</title>

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
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	count = dao.getCount();
	ArrayList<BreakVO> al = null;
	if (count > 0) {
		al = dao.getList(startRow, endRow);
	}
	memberVO vo1 = (memberVO) session.getAttribute("loginvo");
	%>

	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<!-- <a class="navbar-brand logo-image" href="index.jsp"><img src="images/logo.svg" alt="alternative"></a> -->

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<a class="navbar-brand logo-text" href="index.jsp">IoT ����Ʈ �ݻ��</a>

			<button class="navbar-toggler p-0 border-0" type="button"
				id="navbarSideCollapse" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- ��� �޴� �κ� -->
			<div class="navbar-collapse offcanvas-collapse"
				id="navbarsExampleDefault">
				<ul class="navbar-nav ms-auto navbar-nav-scroll">
				<%
		if (vo1 == null) {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">�α���</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">�α׾ƿ�</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="#introduction">��ǰ�Ұ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="break.jsp">����Ű�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">��ǰ��ġ����</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="productlist.jsp">��ǰ����Ʈ</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">��������</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="terms.jsp">��ǰ����</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">�������</a></li>
						</ul></li>
					<!-- 
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                     -->
				</ul>
				<!-- �Ҽ� ������ ����
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
					<h1>���� �Ű� ������</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<!-- �Խ��� ���̺� -->
	<!--  
    <section class="contact d-flex align-items-center py-5" id="contact">
        <div class="container-fluid text-light">
            <div class="row">
                <div class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5" data-aos="fade-right">
                    <div style="width:90%">
                        <div class="text-center text-lg-start py-4 pt-lg-0">
                            -->
		<body>
			<center>
			<div class="board">
				<h3>����Ű� ���</h3>
				<table class="board_table">
					<tr>
						<th width="20%">No.</th>
						<th width="20%">�̸�</th>
						<th width="30%">��ǰ��ȣ</th>
						<th width="20%">�Ű�¥</th>
					</tr>
					<%
					if (count > 0) { // �����ͺ��̽��� �����Ͱ� ������
						int number = count - (currentPage - 1) * pageSize; // �� ��ȣ ���� 
						for (int i = 0; i < al.size(); i++) {
							BreakVO board = al.get(i); // ��ȯ�� list�� ��� ������ �Ҵ�
					%>
					<tr>
						<td><%=board.getNum()%></td>
						<td><%=board.getName()%></td>
						<td>
							<%-- ������ Ŭ���ϸ� get ������� �ش� �׸��� no���� ���� content.jsp�� �̵� --%>
							<a class="list-a" href="breakcontent.jsp?no=<%=board.getNum()%>"><%=board.getProduct_num()%></a>
						</td>
						<td><%=board.getDate()%></td>
					</tr>
					<%
					}
					} else { // �����Ͱ� ������
					%>
					<tr>
						<td colspan="6" align="center">�Խñ��� �����ϴ�.</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td colspan="6" align="right"></td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<%
							// ����¡  ó��
							if (count > 0) {
								// �� �������� ��
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
								// �� �������� ������ ������ ��(��ũ) ��
								int pageBlock = 10;
								// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
								int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
								int endPage = startPage + pageBlock - 1;
		
								// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
								if (endPage > pageCount) {
									endPage = pageCount;
								}
		
								if (startPage > pageBlock) { // ������ ��ϼ����� startPage�� Ŭ��� ���� ��ũ ����
							%> <a class="list-a" href="breaklist.jsp?pageNum=<%=startPage - 10%>">[����]</a> <%
		 }
		
		 for (int i = startPage; i <= endPage; i++) { // ������ ��� ��ȣ
		 if (i == currentPage) { // ���� ���������� ��ũ�� �������� ����
		 %> [<%=i%>] <%
		 } else { // ���� �������� �ƴ� ��� ��ũ ����
		 %> <a class="list-a" href="breaklist.jsp?pageNum=<%=i%>">[<%=i%>]
						</a> <%
		 }
		 } // for end
		
		 if (endPage < pageCount) { // ���� ����� ������ ���������� ������ ��ü ��ϼ��� Ŭ��� ���� ��ũ ����
		 %> <a class="list-a" href="breaklist.jsp?pageNum=<%=startPage + 10%>">[����]</a> <%
		 }
		 }
		 %>
						</td>
					</tr>
				</table>
				</div>
			</center>
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
					<h6>�ּ�</h6>
					<p>���ֱ����� ���� ������ 31-15 ����Ʈ���簳�߿�</p>
				</div>
			</div>
			<div class="col-lg-3 d-flex align-items-center">
				<div class="p-2">
					<i class="fas fa-mobile-alt fa-3x"></i>
				</div>
				<div class="ms-2">
					<h6>����ó</h6>
					<p>010-1234-5678</p>
				</div>
			</div>
			<div class="col-lg-3 d-flex align-items-center">
				<div class="p-2">
					<i class="far fa-envelope fa-3x"></i>
				</div>
				<div class="ms-2">
					<h6>�̸���</h6>
					<p>kdb7603@naver.com</p>
				</div>
			</div>
			<div class="col-lg-3 d-flex align-items-center">
				<div class="p-2">
					<i class="far fa-clock fa-3x"></i>
				</div>
				<div class="ms-2">
					<h6>��㹮��</h6>
					<p>09:00 AM - 18:00 PM</p>
				</div>
			</div>
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
</section>
<!-- end of location -->

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218"></script>

<!-- īī�� �� -->
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
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