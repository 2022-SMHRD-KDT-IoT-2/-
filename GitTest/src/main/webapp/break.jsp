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
						"<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">로그인</a></li>");
					} else {
						out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">로그아웃</a></li>");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="index.jsp#introduction">제품소개</a>
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
						System.out.print(vo.getYn());
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


	<!-- Contact -->
	<!-- 본문 -->
	<div class="break-div">
	<section class="contact d-flex align-items-center py-5" id="contact"
		style="height: 800px">
		<div class="container-fluid text-light">
			
			<div class="row">
			<!-- 좌측 폼 -->
			<div class="break-left">
				<div
					class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5"
					data-aos="fade-right">
					<div>
						<div class="text-center text-lg-start py-4 pt-lg-0">
							<p>제품고장</p>
							<h2 class="py-2">아래의 본문을 따라 고장신고글을 작성해주시기 바랍니다.</h2>
							<strong class="para-light">허위 신고는 처벌의 대상이 될 수 있으므로 명확한
								내용을 사실 기반으로 신고를 해 주시길 부탁드립니다.</strong>
							<p class="para-light">문의에 대한 답변은 작성해주신 연락처를 통해 응답하겠습니다.</p>
						</div>
						<div>
							<div class="row">
								<div class="col-lg-6">
									<form action="BreakReport.do" method="post">
										<div class="form-group py-2">
											<input type="text" class="form-control form-control-input"
												name="name" id="exampleFormControlInput1"
												placeholder="신고자 성함">
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
									placeholder="고장 신고 내용을 입력하세요."></textarea>
							</div>
							<div class="form-group py-2">
								<input type="text" class="form-control form-control-input"
									name="product_number" id="exampleFormControlInput3"
									placeholder="지도 확인 후, 신고할 제품번호를 입력하세요.">
							</div>
						</div>
						<div class="my-3">
							<input type="submit" class="btn form-control-submit-button" value="등록">
						</div>
						</form>
					</div>
					<!-- end of div -->
				</div>
				</div>
				<!-- 좌측 폼 div종료 -->
				<!-- end of col -->
				<!-- 오른쪽 -->
				<div class="break-right">
				<!-- 검색창 -->
				
					<div class="searchbox">
					<div class="break-search">
						<input type="text" name="detailAddress" id="address" placeholder="신고할 위치의 주소를 검색해주세요" class="break-search-text">
						<button type="button" id="searchBtn" onclick="adressSearch()" class="break-search-button">검색</button>
					</div>
					</div>
				<div class="col-lg-6 d-flex">
				</div>
				
				<!-- 검색창 div 종료 -->		
				<!-- 지도 -->
				<div class="map-right">
				<div class="col-lg-6 d-flex align-items-center">
				<div id="map" class="map" ></div>
				
				</div>
				</div>
				<!-- 지도 div 종료 -->		
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
      <!-- end of container -->
   </section>
   <!-- end of location -->


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218&libraries=services"></script>
	<!-- 카카오 맵 -->
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.150078125347754,
					126.91980634412012), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다

		var geocoder = new kakao.maps.services.Geocoder();

		let address = document.querySelector('#address')

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		var positions = [
				{
					content : '<div style="padding:5px;color:black;">스마트인재개발원 <br><a href="https://map.kakao.com/link/map/제품이 설치된 위치입니다. 로드뷰를 통해 신고제품의 위치가 정확한지 확인해주세요.,35.150078125347754, 126.91980634412012" style="color:blue" target="_blank">로드뷰</a></div>',
					latlng : new kakao.maps.LatLng(35.150078125347754,
							126.91980634412012)
				},
				{
					content : '<div style="color:black;">스마트인재개발원<br><a href="https://map.kakao.com/link/map/제품이 설치된 위치입니다. 로드뷰를 통해 신고제품의 위치가 정확한지 확인해주세요.,35.11069654335439, 126.877761898053" style="color:blue" target="_blank">로드뷰</a></div>',
					latlng : new kakao.maps.LatLng(35.11069654335439,
							126.877761898053)
				},
				{
					content : '<div style="color:black;">제품번호 : 1 <br><a href="https://map.kakao.com/link/map/제품이 설치된 위치입니다. 로드뷰를 통해 신고제품의 위치가 정확한지 확인해주세요.,35.1935083414652, 126.71279814289726" style="color:blue" target="_blank">로드뷰</a></div>',
					latlng : new kakao.maps.LatLng(35.1935083414652,
							126.71279814289726)
				},
				{
					content : '<div style="color:black;">제품번호 : 2 <br><a href="https://map.kakao.com/link/map/제품이 설치된 위치입니다. 로드뷰를 통해 신고제품의 위치가 정확한지 확인해주세요.,35.15575843433718, 126.971938982733" style="color:blue" target="_blank">로드뷰</a></div>', // 광주 북구 화암동 산 171-2
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