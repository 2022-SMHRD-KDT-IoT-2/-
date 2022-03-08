<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
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
<title>로그인</title>
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
	memberVO vo = (memberVO) session.getAttribute("loginvo");
	%>

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
					if (vo != null) {
						System.out.print(vo.getYn());
						if (vo.getYn().equals("Y") || vo.getYn().equals("y")) {
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
					<h1>로그인</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->
	
	<div class="board">
	<div class="loginjoindiv">
		<nav id="menu">
			<h3 class="login-h3">로그인</h3>
			<form class="loginjoinform">
				<table class="loginjoinTable">
					<tr>
						<td>
							<input type="text" id="id" name="id" class="text-field"
							placeholder="아이디/이메일을 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<p id="id_check" class="login-idpw-check"></p>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="pw" name="pw" class="text-field"
							placeholder="비밀번호를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>
							<p id="pw_check" class="login-idpw-check"></p>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="submit" class="button-field" value="로그인"
							class="button fit">
						</td>
					</tr>
					<tr>
						<td>
							<p id="login_check" class="login-idpw-check"></p>
						</td>
					</tr>
					<tr>
                  <td class="kakao-login">
                  <a href="javascript:kakaoLogin();"><img src="assets/images/kakao_login.png"></a> 
                  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
                  
   <script>
   window.Kakao.init("f1a70b3ea0e39496dfb511839a1dbddf");
   
   
   function kakaoLogin(){
      window.Kakao.Auth.loginForm({
         scope:'profile_nickname, account_email, gender',
         success : function(response){
            console.log(response);
            window.Kakao.API.request({
               url:'/v2/user/me',
               success : res=> {
                  let email = res.kakao_account.email;
                  let name=res.kakao_account.profile.nickname; 
                  console.log(res.kakao_account);
        				//let data = {'email':email, 'name':name}
          				let xhr = new XMLHttpRequest()
          				
          				xhr.open('get','KakaoLogin.do?id='+email+'&name='+name)
          				
          				// 전송데이터의 형식
          				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8')
          				//console.log(data)
          				// 요청&전송할 데이터
          				xhr.send()
          				
          				xhr.onreadystatechange = function(){
          					if(xhr.readyState===XMLHttpRequest.DONE){	// 요청성공
          						if(xhr.status===200){	// 응답성공
          							console.log("응답성공")
          							console.log(xhr.responseText) // 응답데이터 확인(responseXML)
          							if(xhr.responseText === "kakaosuccess"){
          								location.href = "index.jsp"
          							}else{
          							}
          						}else{	// 응답실패
          							console.log("응답실패")
          						}
          					}else{	// 요청실패
          						console.log("요청실패")
          					}
          				}


  		}
            });
         }
      });
   }
</script>
   </td>
               </tr>			
					<tr>
						<td>
							<button type="button" class="button-field2"
								onclick="location.href='join.jsp';">회원가입</button>
						</td>
					</tr>
				</table>
			</form>
			</ul>
		</nav>
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
	<script>
	let btn_submit = document.getElementById('submit')
	let id_check = document.getElementById('id_check')
	let pw_check = document.getElementById('pw_check')
	let login_check = document.getElementById('login_check')
	
	btn_submit.addEventListener('click', function(){
		
		let id = document.getElementById('id').value
		let pw = document.getElementById('pw').value
		
		if(!id){
			id_check.innerText = "아이디를 입력해주세요."
			pw_check.innerText = " "
		}
		if(!pw){
			id_check.innerText = ""
			pw_check.innerText = "비밀번호를 입력해주세요."
		}
		if(!id&&!pw){
			id_check.innerText = "아이디를 입력해주세요."
			pw_check.innerText = "비밀번호를 입력해주세요."
		}
		if(id&&pw){
			login_check.innerText = ""
				// 데이터 형식 만들기, JSON형식 {키:실제값}
				let data = {'id':id, 'pw':pw}
				let xhr = new XMLHttpRequest()
				
				// 요청방식, 요청경로
				xhr.open('post', 'Login.do')
				
				// 전송데이터의 형식
				xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8')
				
				// 요청&전송할 데이터
				xhr.send(JSON.stringify(data))
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState===XMLHttpRequest.DONE){	// 요청성공
						if(xhr.status===200){	// 응답성공
							console.log("응답성공")
							console.log(xhr.responseText) // 응답데이터 확인(responseXML)
							if(xhr.responseText === "success"){
								location.href = "index.jsp"
							}else{
								login_check.innerText = "아이디/비밀번호를 확인해주세요."
								id_check.innerText = " "
								pw_check.innerText = " "
							}
						}else{	// 응답실패
							console.log("응답실패")
						}
					}else{	// 요청실패
						console.log("요청실패")
					}
				}
		}
			
		})
	
	
	</script>

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