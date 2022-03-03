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
<title>��ǰ����Ʈ</title>
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
<title>��ǰ����Ʈ</title>
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

	String sel = request.getParameter("sel"); // �˻� �ɼ��� value
	String find = request.getParameter("find");
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int fcount = 0;

	ArrayList<ProductVO> al = null;
	ArrayList<ProductVO> fal = null;

	memberVO vo1 = (memberVO) session.getAttribute("loginvo");
	count = dao.getprivacyCount(vo1.getId());
	fcount= dao.getprivacyfCount(sel, find,vo1.getId());
	if (count > 0 && find==null) {
		al = dao.privacyList(startRow, endRow, vo1.getId());
	}
	if(fcount>0){
		fal=dao.getfList(startRow,endRow,sel,find);
	}
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
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"login.jsp\">�α���</a></li>");
		} else {
			out.print("<li class=\"nav-item\"><a class=\"nav-link active\"aria-current=\"page\" href=\"Logout\">�α׾ƿ�</a></li>");
		}
		%> 
					<li class="nav-item"><a class="nav-link" href="#introduction">��ǰ�Ұ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="break.jsp">����Ű�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="install.jsp">��ǰ��ġ����</a>
					</li>
					<%
					if(vo1!=null){
						System.out.print(vo1.getYn());
						if(vo1.getYn().equals("Y")||vo1.getYn().equals("y")){
						out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">��ǰ����Ʈ</a></li>");
						}
					}
					%>
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
					<h1>��ǰ����Ʈ</h1>
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


		<div class="board">
			<h3>��ϵ� ��ǰ ���</h3>
			<div class="table-div">
			<table class="board_table">
				<tr>
					<th width="20%">No.</th>
					<th width="20%">��ǰ��ȣ</th>
					<th width="30%">��ġ</th>
					<th width="30%">���̵�</th>
				</tr>
				<%
				if (count > 0 && fcount==0 && find==null) { // �����ͺ��̽��� �����Ͱ� ������
					int number = count - (currentPage - 1) * pageSize; // �� ��ȣ ���� 
					for (int i = 0; i < al.size(); i++) {
						ProductVO board = al.get(i); // ��ȯ�� list�� ��� ������ �Ҵ�
				%>
				<tr>
					<td><%=number--%></td>
					<td><%=board.getProduct_uid()%></td>
					<td><%=board.getProduct_loc()%></td>
					<td>
						<%-- ������ Ŭ���ϸ� get ������� �ش� �׸��� no���� ���� content.jsp�� �̵� --%> <a
						class="list-a"
						href="productcontent.jsp?no=<%=board.getProduct_seq()%>"><%=board.getUser_id()%></a>
					</td>
				</tr>
				<%
				}
				} else if(count==0){ // �����Ͱ� ������
				%>
				<tr>
					<td colspan="6">�ۼ��� �Խñ��� �����ϴ�.</td>
				</tr>
				<%
				}else if(count>0 && fcount !=0){
					int number = fcount - (currentPage - 1) * pageSize; // �� ��ȣ ����
					for(int i = 0; i<fal.size(); i++){
						ProductVO board = fal.get(i);
				%>
				<tr>
				<td><%=number--%></td>
				<td><%=board.getProduct_uid()%></td>
				<td><%=board.getProduct_loc()%></td>
				<td>
					<%-- ������ Ŭ���ϸ� get ������� �ش� �׸��� no���� pageNum, sel, find�� ���� content.jsp�� �̵� --%> 
					<a class="list-a" href="productcontent.jsp?no=<%=board.getProduct_seq()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getUser_id()%></a>
				</td>
			</tr>
			<%			
					}
				} else { // �˻��� �����Ͱ� ������
			%>
			<tr>
				<td colspan="6">�ش�Ǵ� �Խñ��� �����ϴ�.</td>
			</tr>
			<%		
				}
			%>
			<%if(vo1 != null){ %>
				<tr>
					<td colspan="6" align="right">
						<%-- ��ư�� Ŭ���ϸ� proudctwrite.jsp�� �̵� --%> <input type="button"
						class="list-button" value="�۾���" onclick="location.href='productrequest.jsp'">
					</td>
				</tr>
				<tr>
				<%} %>
					<td colspan="6" align="center">
						<%
						// ����¡  ó��
						if (count > 0 && fcount==0 && find==null) {
							// �� �������� ��
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							// �� �������� ������ ������ ��(��ũ) ��
							int pageBlock = 10;
							// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;

							// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) { // ������ ��ϼ����� startPage�� Ŭ��� ���� ��ũ ����
						%> <a class="list-a"
						href="privacyproduct.jsp?pageNum=<%=startPage - 10%>">[����]</a> <%
 }

 for (int i = startPage; i <= endPage; i++) { // ������ ��� ��ȣ
 if (i == currentPage) { // ���� ���������� ��ũ�� �������� ����
 %> [<%=i%>] <%
 } else { // ���� �������� �ƴ� ��� ��ũ ����
 %> <a class="list-a" href="privacyproduct.jsp?pageNum=<%=i%>">[<%=i%>]
					</a> <%
 }
 } // for end

 if (endPage < pageCount) { // ���� ����� ������ ���������� ������ ��ü ��ϼ��� Ŭ��� ���� ��ũ ����
 %> <a class="list-a"
						href="privacyproduct.jsp?pageNum=<%=startPage + 10%>">[����]</a> <%
 }
 }else if(fcount > 0){ // ����¡ ó��(�˻� ������)
		// �˻��� ���ڵ��� �� �������� ��
		int pageCount = fcount / pageSize + (fcount%pageSize == 0 ? 0 : 1);
		// �� �������� ������ ������ ��(��ũ) ��
		int pageBlock = 10;
		// �� �������� ������ ���� �� �� ��ȣ(�� : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		
		// ������ �������� �� ������ �� ���� ũ�� endPage�� pageCount�� �Ҵ�
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > pageBlock){
%>
			<a href="privacyproduct.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[����]</a>	
<%			
		}
		
		for(int i = startPage; i <= endPage; i++){
			if(i == currentPage){ // ���� �������� ��ũ�� �������� ����
%>
			[<%=i%>]
<%				
			}else{ // ���� �������� �ƴ� ��� ��ũ
%>
			<a href="privacyproduct.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i %>]</a>
<%				
			}
		}
		
		if(endPage < pageCount){
%>
			<a href="privacyproduct.jsp?pageNum=<%=startPage + 10 %>&sel=<%=sel%>&find=<%=find%>">[����]</a>
<%			
		}
	}
%>
</td>
</tr>
</table>
</div>
<%-- �˻��� �Է� form / get��� / option value�� �����ͺ��̽� Į���� �����ϰ� ���� --%>
<div class="search">
<form method="get" action="privacyproduct.jsp">
<select name="sel" class="sel">
<option value="product_uid">��ǰ��ȣ</option>
<option value="product_loc">��ġ</option>
<option value="user_id">���̵�</option>
</select>
<input type="text" class="search-text" name="find" id="find">
<input type="submit" class="search-button" value="�˻�">
</form>
</div>

		</div>


	<!-- Bottom -->
	<div class="bottom py-2 text-light">
		<div class="container d-flex justify-content-between">
			<div></div>
			<div class="bottom-box"></div>
		</div>
		<!-- end of container -->
	</div>
	<!-- end of bottom -->


</body>
</html>