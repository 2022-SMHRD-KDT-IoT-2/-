<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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

	<!-- Navigation -->
	<nav id="navbar" class="navbar navbar-expand-lg fixed-top navbar-dark"
		aria-label="Main navigation">
		<div class="container">

			<!-- Image Logo -->
			<!-- <a class="navbar-brand logo-image" href="index.html"><img src="images/logo.svg" alt="alternative"></a> -->

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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">�α���</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">��ǰ�Ұ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="break.jsp">����Ű�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">��ǰ��ġ����</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">�����û</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">����������</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.html">��������</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="terms.html">��ǰ����</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="particle.html">�������</a></li>
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
					<h1>ȸ������</h1>
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
			
			<h5>ȸ������</h5>
			<form action="Join" method="post" class="loginjoinform">
				<table class="loginjoinTable">
				<tr>
					<td><input type="text" name="id" class="text-field" id="id" placeholder="ID�� �Է��ϼ���"></td>
				</tr>
				<tr>	
					<td><input type="button" class="button-field" value="�ߺ� ID Ȯ��" onclick="idCheck()"><br></td>
				</tr>
				<tr>	
					<td><p id="checkId" class="text-field"></p></td>
				</tr>
				<tr>
					<td>
					<input type="password" name="pw" class="text-field" placeholder="��й�ȣ�� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="name" class="text-field" placeholder="�̸��� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="phone" class="text-field" placeholder="��ȭ��ȣ�� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="email" class="text-field" placeholder="�̸����� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="addr" class="text-field" placeholder="�ּҸ� �Է��ϼ���">
					</td>
				</tr>
				<tr>
					<td>
					<input type="submit" class="button-field" value="�����ϱ�" class="button fit">
					</td>
				</tr>
				</table>
			</form>
			
	</nav>
	</div>


  <!-- Bottom -->
    <div class="bottom py-2 text-light" >
        <div class="container d-flex justify-content-between">
            <div>
            </div>
            <div class="bottom-box">
                
            </div>
        </div> <!-- end of container -->
    </div> <!-- end of bottom -->

	<!-- Banner -->


</body>
<script>
		function idCheck() {
			let id = document.querySelector('#id') //�̸��� �ۼ�â
			let span = document.querySelector('#checkId')

			let xhr = new XMLHttpRequest()

			//��û��� , ��û���
			xhr.open('get', 'idCheck?id=' + id.value)
			//���۵������� ����
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded;charset=UTF-8')
			//��û & ������ ������
			xhr.send()

			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) { //��û����
					if (xhr.status === 200) { //���伺��
						console.log("���伺��")
						console.log(xhr.responseText) //���䵥���� Ȯ�� (responseXML)
						if (xhr.responseText == "true") {
							span.innerText = '����� �� ���� ���̵��Դϴ�.'
						} else {
							span.innerText = '����� �� �ִ� ���̵��Դϴ�.'
						}

						//true -> ����Ҽ����� ���̵�
						//false -> ����Ҽ� �ִ¾��̵�
					} else {
						console.log("�������")
					}
				} else { //��û����
					console.log("��û����")
				}
			}
		}
	</script>
</html>