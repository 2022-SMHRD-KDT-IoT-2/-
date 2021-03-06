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
<title>力前府胶飘</title>
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
    <title>力前府胶飘</title>
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
					if(vo1!=null){
						System.out.print(vo1.getYn());
						if(vo1.getYn().equals("Y")||vo1.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">力前府胶飘</a></li>");
						}
					}
					%>
					<%if(vo1!=null){ %>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">付捞其捞瘤</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">俺牢沥焊</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">力前包府</a></li>
						</ul></li>
						<%} %>
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
                    <h1>力前府胶飘</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    <div class="board2">
    <div class="content">
		<h3><%=vo.getProduct_uid() %></h3>
	<div class="contentdiv-div">
    <div class="content-div">
    <form action="ProductModify.do?no=<%=vo.getProduct_seq()%>" method="post">
		<table class="content-table">
			<tr>
				<td class="td-title">力前<br>锅龋</td>
				<td class= "td-text"><input type="text" name="product_id" class="text-box" value="<%=vo.getProduct_uid() %>"></td>
				<td class="td-title">汲摹<br>困摹</td>
				<td class= "td-text"><input type="text" name="loc" class="text-box" value="<%=vo.getProduct_loc() %>"></td>
			</tr>
			<tr>
				<td class="td-title">困档</td>
				<td class= "td-text"><input type="text" name="latitude" class="text-box" value="<%=vo.getProduct_latitude() %>"></td>
				<td class="td-title">版档</td>
				<td class= "td-text"><input type="text" name="longitude" class="text-box" value="<%=vo.getProduct_longitude() %>"></td>
			</tr>
			<tr>
				<td class="td-title">汲摹<br>老磊</td>
				<td class= "td-text"><%=vo.getProduct_date() %></td>
				<td class="td-title">包府磊<br>酒捞叼</td>
				<td class= "td-text"><%=vo.getUser_id() %></td>
			</tr>
			
			<tr>
				<td class="td-button" colspan="4">
					<%-- 滚瓢阑 努腐窍搁 秦寸 其捞瘤肺 捞悼 / 荐沥苞 昏力绰 get规侥栏肺 no蔼阑 傈崔 --%>
					<input type="submit" class="button-content" value="肯丰" > 
					<input type="button" class="button-content" value="秒家" onclick= history.back()>
				</td>
				</form>
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