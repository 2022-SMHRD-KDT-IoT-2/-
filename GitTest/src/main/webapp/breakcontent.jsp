<%@page import="com.VO.BreakVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.BreakDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>break</title>
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
	BreakDAO dao=new BreakDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	BreakVO vo=dao.getOneList(no);
%>

   <!-- Navigation -->
    <nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark" aria-label="Main navigation">
        <div class="container">

            <!-- Image Logo -->
            <!-- <a class="navbar-brand logo-image" href="index.html"><img src="images/logo.svg" alt="alternative"></a> -->

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <a class="navbar-brand logo-text" href="index.jsp">��� ����Ʈ ����</a>

            <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
			<!-- ��� �޴� �κ� -->
			<div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" >
                <ul class="navbar-nav ms-auto navbar-nav-scroll">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="login.jsp">�α���</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">��ǰ�Ұ�</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="break.jsp">����Ű�</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">��ǰ��ġ����</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�����û</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>
                        
                        <ul class="dropdown-menu" aria-labelledby="dropdown01">
                            <li><a class="dropdown-item" href="rivacy.html">��������</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="terms.html">��ǰ����</a></li>
                            <li><div class="dropdown-divider"></div></li>
                            <li><a class="dropdown-item" href="particle.html">�������</a></li>
                        </ul>
                    </li>
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
            </div> <!-- end of navbar-collapse -->
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->
    
	<!-- Header -->
    <header class="ex-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-10 offset-xl-1">
                    <h1>���� �Ű� ������</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->

    <!-- Contact -->
    <section class="contact d-flex align-items-center py-5" id="contact">
        <div class="container-fluid text-light">
            <div class="row">
                <div class="col-lg-6 d-flex justify-content-center justify-content-lg-end align-items-center px-lg-5" data-aos="fade-right">
                    <div style="width:90%">
                        <div class="text-center text-lg-start py-4 pt-lg-0">
                            <h3>�Խ��� ���</h3>
		<h3>�ۼ���</h3>
		<table border="1" width="600">
			<tr>
				<td width="50">�̸�</td>
				<td width="250"><%=vo.getName() %></td>
				<td width="50">�Ű�¥</td>
				<td width="250"><%=vo.getDate() %></td>
			</tr>
			<tr>
				<td width="50">�ڵ�����ȣ</td>
				<td width="250"><%=vo.getPhone() %></td>
				<td width="50">��ǰ��ȣ</td>
				<td width="250"><%=vo.getProduct_num() %></td>
			</tr>
			<tr>
				<td>����</td>
				<td colspan="3"><pre><%=vo.getContent() %></pre></td>
			</tr>
			<tr align="center">
				<td colspan="4">
				</td>>
				</tr>
				</table>
                        </div>
                    </div> <!-- end of div -->
                </div> <!-- end of col -->
                <div id="map" class="col-lg-6 d-flex align-items-center" style="width:800px;height:400px;">                
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </section> <!-- end of contact -->
    
    
    
   <!-- Location -->
    <section class="location text-light py-5">
        <div class="container" data-aos="zoom-in">
            <div class="row">
                <div class="col-lg-3 d-flex align-items-center">
                    <div class="p-2"><i class="far fa-map fa-3x"></i></div>
                    <div class="ms-2">
                        <h6>�ּ�</h6>
                        <p>���ֱ����� ���� ������ 31-15 ����Ʈ���簳�߿�</p>
                    </div>
                </div>
                <div class="col-lg-3 d-flex align-items-center" >
                    <div class="p-2"><i class="fas fa-mobile-alt fa-3x"></i></div>
                    <div class="ms-2">
                        <h6>����ó</h6>
                        <p>010-1234-5678</p>
                    </div>
                </div>
                <div class="col-lg-3 d-flex align-items-center" >
                    <div class="p-2"><i class="far fa-envelope fa-3x"></i></div>
                    <div class="ms-2">
                        <h6>�̸���</h6>
                        <p>kdb7603@naver.com</p>
                    </div>
                </div>
                <div class="col-lg-3 d-flex align-items-center" >
                    <div class="p-2"><i class="far fa-clock fa-3x"></i></div>
                    <div class="ms-2">
                        <h6>��㹮��</h6>
                        <p>09:00 AM - 18:00 PM</p>
                    </div>
                </div>
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </section> <!-- end of location -->    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54eb6a93d19563f656425928fbb6c218"></script>
    
    <!-- īī�� �� -->
    <script>
    var container = document.getElementById('map');
    var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
    </script>
    
    
    <!-- Scripts -->
    <script src="./js/bootstrap.min.js"></script><!-- Bootstrap framework -->
    <script src="./js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
    <script src="./js/swiper.min.js"></script><!-- Swiper for image and text sliders -->
    <script src="./js/aos.js"></script><!-- AOS on Animation Scroll -->
    <script src="./js/script.js"></script>  <!-- Custom scripts -->
</body>
</html>