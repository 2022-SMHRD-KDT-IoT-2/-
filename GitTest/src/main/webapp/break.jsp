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
	memberVO vo = (memberVO) session.getAttribute("loginvo");
	%>

	<!-- Navigation -->
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
						"<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">�α���</a></li>");
					} else {
						out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">�α׾ƿ�</a></li>");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="index.jsp#introduction">��ǰ�Ұ�</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����Ű�</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item" href="break.jsp">����Ű� �ۼ�</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="breaklist.jsp">����Ű�
									�Խ���</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">��ǰ��ġ����</a>
					</li>
					<%
					if (vo != null) {
						System.out.print(vo.getYn());
						if (vo.getYn().equals("Y") || vo.getYn().equals("y")) {
							out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">��ǰ����Ʈ</a></li>");
						}
					}
					%>
					<%
					if (vo != null) {
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">��������</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">��ǰ����</a></li>
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


	<!-- Contact -->
	<!-- ���� -->
	<div class="break-div">
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
							<p>��ǰ����</p>
							<h2 class="py-2">�Ʒ��� ������ ���� ����Ű���� �ۼ����ֽñ� �ٶ��ϴ�.</h2>
							<strong class="para-light">���� �Ű�� ó���� ����� �� �� �����Ƿ� ��Ȯ��
								������ ��� ������� �Ű� �� �ֽñ� ��Ź�帳�ϴ�.</strong>
							<p class="para-light">���ǿ� ���� �亯�� �ۼ����ֽ� ����ó�� ���� �����ϰڽ��ϴ�.</p>
						</div>
						<div>
							<div class="row">
								<div class="col-lg-6">
									<form action="BreakReport.do" method="post">
										<div class="form-group py-2">
											<input type="text" class="form-control form-control-input"
												name="name" id="exampleFormControlInput1"
												placeholder="�Ű��� ����">
										</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group py-2">
										<input type="text" class="form-control form-control-input"
											name="phone" id="exampleFormControlInput2"
											placeholder="010-0000-0000">
									</div>
								</div>
							</div>
							<div class="form-group py-2">
								<textarea class="form-control form-control-input" name="content"
									id="exampleFormControlTextarea1" rows="6"
									placeholder="���� �Ű� ������ �Է��ϼ���."></textarea>
							</div>
							<div class="form-group py-2">
								<input type="text" class="form-control form-control-input"
									name="product_number" id="exampleFormControlInput3"
									placeholder="���� Ȯ�� ��, �Ű��� ��ǰ��ȣ�� �Է��ϼ���.">
							</div>
						</div>
						<div class="my-3">
							<input type="submit" class="btn form-control-submit-button" value="���">
						</div>
						</form>
					</div>
					<!-- end of div -->
				</div>
				</div>
				<!-- ���� �� div���� -->
				<!-- end of col -->
				<!-- ������ -->
				<div class="break-right">
				<!-- �˻�â -->
				
					<div class="searchbox">
					<div class="break-search">
						<input type="text" name="detailAddress" id="address" placeholder="�Ű��� ��ġ�� �ּҸ� �˻����ּ���" class="break-search-text">
						<button type="button" id="searchBtn" onclick="adressSearch()" class="break-search-button">�˻�</button>
					</div>
					</div>
				<div class="col-lg-6 d-flex">
				</div>
				
				<!-- �˻�â div ���� -->		
				<!-- ���� -->
				<div class="map-right">
				<div class="col-lg-6 d-flex align-items-center">
				<div id="map" class="map" ></div>
				
				</div>
				</div>
				<!-- ���� div ���� -->		
				</div>
		</div>
		<!-- end of row -->
		</div>
		<!-- end of container -->
	</section>
	</div>
	<!-- end of contact -->
	
	<section class="location text-light py-5">
      <div class="container" data-aos="zoom-in">
         <div class="row">
            <div class="col-lg-3 d-flex align-items-center">
               <div class="p-2">
                  <i class="far fa-map fa-3x"></i>
               </div>
               <div class="ms-2">
                  <h6>�ּ�</h6>
                  <h6>���ֱ����� ����<br>����Ʈ���簳�߿�</h6>
                  
               </div>
            </div>
            <div class="col-lg-3 d-flex align-items-center">
               <div class="p-2">
                  <i class="fas fa-mobile-alt fa-3x"></i>
               </div>
               <div class="ms-2">
                  <h6>����ó</h6>
                  <p>82) 010-1234-5678</p>
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
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�

		var geocoder = new kakao.maps.services.Geocoder();

		let address = document.querySelector('#address')

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		var positions = [
				{
					content : '<div style="padding:5px;color:black;">����Ʈ���簳�߿� <br><a href="https://map.kakao.com/link/map/��ǰ�� ��ġ�� ��ġ�Դϴ�. �ε�並 ���� �Ű���ǰ�� ��ġ�� ��Ȯ���� Ȯ�����ּ���.,35.150078125347754, 126.91980634412012" style="color:blue" target="_blank">�ε��</a></div>',
					latlng : new kakao.maps.LatLng(35.150078125347754,
							126.91980634412012)
				},
				{
					content : '<div style="color:black;">����Ʈ���簳�߿�<br><a href="https://map.kakao.com/link/map/��ǰ�� ��ġ�� ��ġ�Դϴ�. �ε�並 ���� �Ű���ǰ�� ��ġ�� ��Ȯ���� Ȯ�����ּ���.,35.11069654335439, 126.877761898053" style="color:blue" target="_blank">�ε��</a></div>',
					latlng : new kakao.maps.LatLng(35.11069654335439,
							126.877761898053)
				},
				{
					content : '<div style="color:black;">��ǰ��ȣ : 1 <br><a href="https://map.kakao.com/link/map/��ǰ�� ��ġ�� ��ġ�Դϴ�. �ε�並 ���� �Ű���ǰ�� ��ġ�� ��Ȯ���� Ȯ�����ּ���.,35.1935083414652, 126.71279814289726" style="color:blue" target="_blank">�ε��</a></div>',
					latlng : new kakao.maps.LatLng(35.1935083414652,
							126.71279814289726)
				},
				{
					content : '<div style="color:black;">��ǰ��ȣ : 2 <br><a href="https://map.kakao.com/link/map/��ǰ�� ��ġ�� ��ġ�Դϴ�. �ε�並 ���� �Ű���ǰ�� ��ġ�� ��Ȯ���� Ȯ�����ּ���.,35.15575843433718, 126.971938982733" style="color:blue" target="_blank">�ε��</a></div>', // ���� �ϱ� ȭ�ϵ� �� 171-2
					latlng : new kakao.maps.LatLng(35.15575843433718,
							126.971938982733)
				} ]

		for (var i = 0; i < positions.length; i++) {
			var imageSize = new kakao.maps.Size(24, 35);
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			var marker = new kakao.maps.Marker({
				map : map,
				position : positions[i].latlng,
				image : markerImage,
				clickable : true
			});

			marker.setMap(map);

			var iwRemoveable = true;

			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content,
				removable : iwRemoveable
			});
			kakao.maps.event.addListener(marker, 'click', mouseClick(map,
					marker, infowindow));
		}

		function mouseClick(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		function adressSearch() {
			geocoder.addressSearch(address.value,
					function(result, status) {

						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							map.setCenter(coords);
						}
					});
		}
	</script>

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