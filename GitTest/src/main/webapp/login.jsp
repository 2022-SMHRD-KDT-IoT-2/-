<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
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
<title>�α���</title>
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
						"<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">�α���</a></li>");
					} else {
						out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">�α׾ƿ�</a></li>");
					}
					%>
					<li class="nav-item"><a class="nav-link" href="#introduction">��ǰ�Ұ�</a>
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
					if (vo != null) {
						System.out.print(vo.getYn());
						if (vo.getYn().equals("Y") || vo.getYn().equals("y")) {
							out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">��ǰ����Ʈ</a></li>");
						}
					}
					%>
					<%if(vo!=null) {%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">��������</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">��ǰ����</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.jsp">�������</a></li>
						</ul></li>
						<%} %>
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
					<h1>�α���</h1>
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
		<nav id="menu">
			<h3 class="login-h3">�α���</h3>
			<form class="loginjoinform">
				<table class="loginjoinTable">
					<tr>
						<td>
							<input type="text" id="id" name="id" class="text-field"
							placeholder="���̵�/�̸����� �Է��ϼ���">
						</td>
						<td>
							<p id="id_check" style="color:red";></p>
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" id="pw" name="pw" class="text-field"
							placeholder="��й�ȣ�� �Է��ϼ���">
						</td>
						<td>
							<p id="pw_check" style="color:red";></p>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" id="submit" class="button-field" value="�α���"
							class="button fit">
						</td>
						<td>
							<p id="login_check" style="color:red";></p>
						</td>
					</tr>
					<tr>
						<td><a href="javascript:kakaoLogin();"><img src="assets/images/kakao_login.png"></a> 
						<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=291c1081bfc3fad5cc9de574d8b849d7&redirect_uri=http://localhost:8000/blog/oauth/kakao?cmd=callback&response_type=code"><img height="38px" src="assets/images/kakao_login.png" /></a>
	<script>					
	Kakao.init("b43551a3efd6736c68f6755e449a2250");

    function kakaoLogin(){
        Kakao.Auth.login({
            success: function(response){
                Kakao.API.request({
                    url:'/v2/user/me', 
                    success: function (response) {
                    	console.log(response)
                    },
                    fail : function(response) {
                    	console.log(error)
                    },
                }); //window.location.href="/ex/kakao_login.html" �����̷�Ʈ�Ǵ� �ڵ�
            },
            fail: function(error){
            	console.log(error);
            }
        });
    }
         
	</script>
	</td>
					</tr>				
					<tr>
						<td>
							<button type="button" class="button-field2"
								onclick="location.href='join.jsp';">ȸ������</button>
						</td>
					</tr>
				</table>
			</form>
			</ul>
		</nav>
	</div>

<div class="location-fixed">		
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
      </div>
      <!-- end of container -->
   </section>
   <!-- end of location -->
	<!-- Bottom -->
	<div class="bottom-fixed">
	<div class="bottom py-2 text-light">
		<div class="container d-flex justify-content-between">
			<div></div>
			<div class="bottom-box"></div>
		</div>
		<!-- end of container -->
	</div>
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
			id_check.innerText = "�ʼ������Դϴ�.."
		}
		if(!pw){
			pw_check.innerText = "�ʼ������Դϴ�.."
		}
		if(!id||!pw){
			id_check.innerText = "�ʼ������Դϴ�.."
			pw_check.innerText = "�ʼ������Դϴ�.."
		}
		if(id&&pw){
			login_check.innerText = ""
				// ������ ���� �����, JSON���� {Ű:������}
				let data = {'id':id, 'pw':pw}
				let xhr = new XMLHttpRequest()
				
				// ��û���, ��û���
				xhr.open('post', 'Login.do')
				
				// ���۵������� ����
				xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8')
				
				// ��û&������ ������
				xhr.send(JSON.stringify(data))
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState===XMLHttpRequest.DONE){	// ��û����
						if(xhr.status===200){	// ���伺��
							console.log("���伺��")
							console.log(xhr.responseText) // ���䵥���� Ȯ��(responseXML)
							if(xhr.responseText === "success"){
								location.href = "index.jsp"
							}else{
								login_check.innerText = "���̵�/��й�ȣ�� Ȯ�����ּ���."
							}
						}else{	// �������
							console.log("�������")
						}
					}else{	// ��û����
						console.log("��û����")
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