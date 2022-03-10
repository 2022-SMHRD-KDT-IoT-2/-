<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.ProductVO"%>
<%@page import="com.DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ����</title>
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
<title>��ǰ����</title>
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
	ProductDAO dao = new ProductDAO();
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
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">�α���</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">�α׾ƿ�</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="index.jsp#introduction">��ǰ�Ұ�</a>
					</li>
					<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����Ű�</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item" href="break.jsp">����Ű� �ۼ�</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="breaklist.jsp">����Ű� �Խ���</a></li>
					</ul></li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">��ǰ��ġ����</a>
					</li>
					<%
					if(vo!=null){
						System.out.print(vo.getYn());
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">��ǰ����Ʈ</a></li>");
						}
					}
					%>				
						<% if(vo!=null){%>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">��������</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">��ǰ����</a></li>
						</ul></li>
						<%}
						%>
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
    <!-- end of navigation -->


	<!-- Header -->
	<header class="ex-header">
		<div class="container">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h1>��ǰ����</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<!-- ��ġ ���̺� -->
	<!-- Header -->
	<div class="board">
			<section class="contact d-flex align-items-center py-5" id="contact"
				style="height: 800px">
				<div class="container-fluid text-light">

					<div class="row">
						<!-- ���� �� -->
						<div class="break-left">
							<div
								class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5"
								data-aos="fade-right">
								<div>
									<div class="text-center text-lg-start py-4 pt-lg-0">
					<form action="ProductWrite.do" method="post">
					<h3 class="request-h5">��ǰ �߰��ϱ�</h3>
						<div class="table3-div">
						<table class="board_table3">
							<tr>
								<th>��ǰ��ȣ</th>
								<td><input type="text" class="table3-textbox" name="pro_id"></td>
							</tr>
							<tr>
								<th>��ġ</th>
								<td><input type="text" class="table3-textbox" name="loc"></td>
							</tr>
							<tr>
								<th>����</th>
								<td><input type="text" id="latitude" class="table3-textbox" name="latitude"></td>
							</tr>
							<tr>
								<th>�浵</th>
								<td><input type="text" id="longitude"class="table3-textbox" name="longitude"></td>
							</tr>
							<tr>
								<th>�����ھ��̵�</th>
								<td><input type="text" readonly name="id"  class="readonly" value="<%=vo.getId()%>"></td>
							</tr>
						</table>
						</div>
						<br><input type="submit" class="list-button" value="��ǰ �߰�">
					</form>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of ex-basic-1 -->
	<div class="break-right">
							<table class="break-table">
								<tr>
									<td>
										<!-- �˻�â -->
										<div class="searchbox">
											<div class="break-search">
												<input type="text" name="detailAddress" id="address"
													placeholder="����� ��ġ�� �ּҸ� �˻����ּ���" class="break-search-text">
												<button type="button" id="searchBtn"
													onclick="adressSearch()" class="break-search-button">�˻�</button>
											</div>
										</div>
										<div class="col-lg-6 d-flex"></div> <!-- �˻�â div ���� -->
									</td>
								</tr>
								<tr>
									<td>
										<!-- ���� -->
										<div class="map-right">
											<div class="col-lg-6 d-flex align-items-center">
												<div id="map" class="map"></div>

											</div>
										</div> <!-- ���� div ���� -->
									</td>
								</tr>
								</div>
							</table>
						</div>
						<!-- end of row -->
	
		
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
	
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218&libraries=services"></script>
	<!-- īī�� �� -->
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(35.150078125347754,
					126.91980634412012), // ������ �߽���ǥ
			level : 6
		// ������ Ȯ�� ����
		};

		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
var marker = new kakao.maps.Marker({ 
    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
    position: map.getCenter() 
}); 
// ������ ��Ŀ�� ǥ���մϴ�
marker.setMap(map);

// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
    var latlng = mouseEvent.latLng; 
    
    // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
    marker.setPosition(latlng);
    
    var latitude = latlng.getLat();
    var longitude = latlng.getLng()
    
    var resultDiv1 = document.getElementById('latitude');
    var resultDiv2 = document.getElementById('longitude'); 
    resultDiv1.value=latitude;
    resultDiv2.value=longitude;
    
});
		
	</script>
	
	
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