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
<title>力前包府</title>
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
<title>力前包府</title>
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
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">肺弊牢</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">肺弊酒眶</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="index.jsp#introduction">力前家俺</a>
					</li>
					<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown02"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">绊厘脚绊</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item" href="break.jsp">绊厘脚绊 累己</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="breaklist.jsp">绊厘脚绊 霸矫魄</a></li>
					</ul></li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">力前汲摹巩狼</a>
					</li>
					<%
					if(vo!=null){
						System.out.print(vo.getYn());
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">力前府胶飘</a></li>");
						}
					}
					%>				
						<% if(vo!=null){%>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">付捞其捞瘤</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">俺牢沥焊</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">力前包府</a></li>
						</ul></li>
						<%}
						%>
					<!-- 
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                     -->
				</ul>
				<!-- 家既 酒捞能 见辫
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
					<h1>力前包府</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<!-- 汲摹 抛捞喉 -->
	<!-- Header -->
	<div class="board">
		
			
				<div class="container-fluid text-light">

					<div class="row">
						<!-- 谅螟 汽 -->
				<div class="break-left">
							<div
								class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5"
								data-aos="fade-right">
								<div>
					<form action="ProductWrite.do" method="post">
					<h3 class="productrequest-h3">力前 眠啊窍扁</h3>
					
						<div class="table3-div">
						<table class="board_table3">
							<tr>
								<th>力前锅龋</th>
								<td><input type="text" class="table3-textbox" name="pro_id" autofocus></td>
							</tr>
							<tr>
								<th>困摹</th>
								<td><input type="text" class="table3-textbox" name="loc"></td>
							</tr>
							<tr>
								<th>困档</th>
								<td><input type="text" readonly id="latitude" class="table3-textbox" name="latitude"></td>
							</tr>
							<tr>
								<th>版档</th>
								<td><input type="text" readonly id="longitude"class="table3-textbox" name="longitude"></td>
							</tr>
							<tr>
								<th>包府磊酒捞叼</th>
								<td><input type="text" readonly name="id"  class="table3-readonly" value="<%=vo.getId()%>"></td>
							</tr>
						</table>
						</div>
						<div class="request-button">
						<input type="submit" class="request-button-in" value="力前 眠啊">
						</div>
					</form>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
			<!-- 谅螟 汽 div辆丰 -->
						<!-- end of col -->
						<!-- 坷弗率 -->
	<!-- end of ex-basic-1 -->
	<div class="break-right">
							<table class="break-table2">
								<tr>
									<td>
										<!-- 瘤档 -->
										<div class="map-right">
											<div class="col-lg-6 d-flex align-items-center">
												<div id="map" class="map"></div>

											</div>
										</div> <!-- 瘤档 div 辆丰 -->
									</td>
								</tr>
								</div>
							</table>
						</div>
						
								</div>
						<!-- end of row -->
					</div>
					<!-- end of container -->
		
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
	
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218&libraries=services"></script>
	<!-- 墨墨坷 甘 -->
	<script>
		var mapContainer = document.getElementById('map'), // 瘤档甫 钎矫且 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.150078125347754,
					126.91980634412012), // 瘤档狼 吝缴谅钎
			level : 6
		// 瘤档狼 犬措 饭骇
		};

		// 瘤档甫 积己钦聪促    
		var map = new kakao.maps.Map(mapContainer, mapOption); // 瘤档甫 积己钦聪促

// 瘤档甫 努腐茄 困摹俊 钎免且 付目涝聪促
var marker = new kakao.maps.Marker({ 
    // 瘤档 吝缴谅钎俊 付目甫 积己钦聪促 
    position: map.getCenter() 
}); 
// 瘤档俊 付目甫 钎矫钦聪促
marker.setMap(map);

// 瘤档俊 努腐 捞亥飘甫 殿废钦聪促
// 瘤档甫 努腐窍搁 付瘤阜 颇扼固磐肺 逞绢柯 窃荐甫 龋免钦聪促
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 努腐茄 困档, 版档 沥焊甫 啊廉可聪促 
    var latlng = mouseEvent.latLng; 
    
    // 付目 困摹甫 努腐茄 困摹肺 颗遍聪促
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