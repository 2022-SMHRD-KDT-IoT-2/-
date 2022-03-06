<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
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
<title>회원가입</title>
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
			memberVO vo = (memberVO)session.getAttribute("loginvo");

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
					if(vo!=null){
						System.out.print(vo.getYn());
						if(vo.getYn().equals("Y")||vo.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">제품리스트</a></li>");
						}
					}
					%>
					<%if(vo!=null) {%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">마이페이지</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">개인정보</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">제품관리</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">광고관리</a></li>
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
	<!-- end of navbar -->
	<!-- end of navigation -->


	<!-- Header -->
	<header class="ex-header">
		<div class="container">
			<div class="row">
				<div class="col-xl-10 offset-xl-1">
					<h1>회원가입</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->

	<div class="loginjoindiv">
	<nav id="menu" >
			
			<h3>회원가입</h3>
			<form action="Join" method="post" class="loginjoinform">
				<table class="loginjoinTable">
				<tr>
					<td class="text-text">
					<%
						if(vo==null){
						out.print("아이디");
						}
					%>
					</td>
				</tr>
				<tr>	
					<td><input type="text" name="id" class="text-field" id="id" placeholder="아이디를 입력하세요"></td>
				</tr>
				<tr>	
					<td><input type="button" class="button-field" value="아이디 중복 확인" onclick="idCheck()"><br></td>
				</tr>
				<tr>	
					<td><p id="checkId" class="text-field"></p></td>
				</tr>
				<tr>
				<td class="text-text">비밀번호</td>
				</tr>
				<tr>
					<td>
					<input type="password" name="pw" class="text-field" placeholder="비밀번호를 입력하세요">
					</td>
				</tr>
				<tr>
				<td class="text-text">이름</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="name" class="text-field" placeholder="이름을 입력하세요">
					</td>
				</tr>
				<tr>
				<td class="text-text">전화번호</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="phone" class="text-field" placeholder="전화번호를 입력하세요">
					</td>
				</tr>
				<tr>
				<td class="text-text">이메일</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="email" class="text-field" placeholder="이메일을 입력하세요">
					</td>
				</tr>
				<tr>
				<td class="text-text">주소</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="addr" class="text-field" placeholder="주소를 입력하세요">
					</td>
				</tr>
				<tr>
					<td>
					<input type="submit" class="button-field" value="가입하기" class="button fit">
					</td>
				</tr>
				</table>
			</form>
			
	</nav>
	</div>



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


	<!-- Banner -->
<script>
		function idCheck() {
			let id = document.querySelector('#id') //이메일 작성창
			let span = document.querySelector('#checkId')

			let xhr = new XMLHttpRequest()

			//요청방식 , 요청경로
			xhr.open('get', 'idCheck?id=' + id.value)
			//전송데이터의 형식
			xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded;charset=UTF-8')
			//요청 & 전송할 데이터
			xhr.send()

			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) { //요청성공
					if (xhr.status === 200) { //응답성공
						console.log("응답성공")
						console.log(xhr.responseText) //응답데이터 확인 (responseXML)
						if (xhr.responseText == 'true') {
							span.innerText = '사용할 수 없는 아이디입니다.'
						} else {
							span.innerText = '사용할 수 있는 아이디입니다.'
						}

						//true -> 사용할수없는 아이디
						//false -> 사용할수 있는아이디
					} else {
						console.log("응답실패")
					}
				} else { //요청실패
					console.log("요청실패")
				}
			}
		}
	</script>
					
</html>