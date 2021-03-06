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

	String sel = request.getParameter("sel"); // 八祸 可记狼 value
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
		fal=dao.privacyfList(startRow,endRow,sel,find,vo1.getId());
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
					if (vo1 != null) {
						if (vo1.getYn().equals("Y") || vo1.getYn().equals("y") || vo1.getYn().equals("a") || vo1.getYn().equals("A")) {
							out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"productlist.jsp\">力前府胶飘</a></li>");
						}
					}
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="dropdown01"
						data-bs-toggle="dropdown" aria-expanded="false" href="#">付捞其捞瘤</a>

						<ul class="dropdown-menu" aria-labelledby="dropdown01">
							<li><a class="dropdown-item" href="privacy.jsp">俺牢沥焊</a></li>
							<li><div class="dropdown-divider"></div></li>
							<li><a class="dropdown-item" href="privacyproduct.jsp">力前包府</a></li>
						</ul></li>
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
	<!-- end of navbar -->
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


		<div class="board">
			<h3>殿废等 力前 格废</h3>
			<div class="table-div">
			<table class="board_table">
				<tr>
					<th width="20%">No.</th>
					<th width="20%">力前锅龋</th>
					<th width="30%">困摹</th>
					<th width="30%">酒捞叼</th>
				</tr>
				<%
				if (count > 0 && fcount==0 && find==null) { // 单捞磐海捞胶俊 单捞磐啊 乐栏搁
					int number = count - (currentPage - 1) * pageSize; // 臂 锅龋 鉴锅 
					for (int i = 0; i < al.size(); i++) {
						ProductVO board = al.get(i); // 馆券等 list俊 淬变 曼炼蔼 且寸
				%>
				<tr>
					<td><%=number--%></td>
					<td><%=board.getProduct_seq()%></td>
					<td><%=board.getProduct_loc()%></td>
					<td>
						<%-- 力格阑 努腐窍搁 get 规侥栏肺 秦寸 亲格狼 no蔼阑 爱绊 content.jsp肺 捞悼 --%> <a
						class="list-a"
						href="productcontent.jsp?no=<%=board.getProduct_seq()%>"><%=board.getUser_id()%></a>
					</td>
				</tr>
				<%
				}
				} else if(count==0){ // 单捞磐啊 绝栏搁
				%>
				<tr>
					<td colspan="6">累己等 霸矫臂捞 绝嚼聪促.</td>
				</tr>
				<%
				}else if(count>0 && fcount !=0){
					int number = fcount - (currentPage - 1) * pageSize; // 臂 锅龋 鉴锅
					for(int i = 0; i<fal.size(); i++){
						ProductVO board = fal.get(i);
				%>
				<tr>
				<td><%=number--%></td>
				<td><%=board.getProduct_seq()%></td>
				<td><%=board.getProduct_loc()%></td>
				<td>
					<%-- 力格阑 努腐窍搁 get 规侥栏肺 秦寸 亲格狼 no蔼苞 pageNum, sel, find甫 爱绊 content.jsp肺 捞悼 --%> 
					<a class="list-a" href="productcontent.jsp?no=<%=board.getProduct_seq()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getUser_id()%></a>
				</td>
			</tr>
			<%			
					}
				} else { // 八祸等 单捞磐啊 绝栏搁
			%>
			<tr>
				<td colspan="6">秦寸登绰 霸矫臂捞 绝嚼聪促.</td>
			</tr>
			<%		
				}
			%>
			
			
				
				<tr>
					<td colspan="6" >
						<%
						// 其捞隆  贸府
						if (count > 0 && fcount==0 && find==null) {
							// 醚 其捞瘤狼 荐
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							// 茄 其捞瘤俊 焊咯临 其捞瘤 喉钒(傅农) 荐
							int pageBlock = 10;
							// 茄 其捞瘤俊 焊咯临 矫累 棺 场 锅龋(抗 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;

							// 付瘤阜 其捞瘤啊 醚 其捞瘤 荐 焊促 农搁 endPage甫 pageCount肺 且寸
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) { // 其捞瘤 喉废荐焊促 startPage啊 努版快 捞傈 傅农 积己
						%> <a class="list-a"
						href="privacyproduct.jsp?pageNum=<%=startPage - 10%>">[捞傈]</a> <%
 }

 for (int i = startPage; i <= endPage; i++) { // 其捞瘤 喉废 锅龋
 if (i == currentPage) { // 泅犁 其捞瘤俊绰 傅农甫 汲沥窍瘤 臼澜
 %> [<%=i%>] <%
 } else { // 泅犁 其捞瘤啊 酒囱 版快 傅农 汲沥
 %> <a class="list-a" href="privacyproduct.jsp?pageNum=<%=i%>">[<%=i%>]
					</a> <%
 }
 } // for end

 if (endPage < pageCount) { // 泅犁 喉废狼 付瘤阜 其捞瘤焊促 其捞瘤 傈眉 喉废荐啊 努版快 促澜 傅农 积己
 %> <a class="list-a"
						href="privacyproduct.jsp?pageNum=<%=startPage + 10%>">[促澜]</a> <%
 }
 }else if(fcount > 0){ // 其捞隆 贸府(八祸 单捞磐)
		// 八祸等 饭内靛狼 醚 其捞瘤狼 荐
		int pageCount = fcount / pageSize + (fcount%pageSize == 0 ? 0 : 1);
		// 茄 其捞瘤俊 焊咯临 其捞瘤 喉钒(傅农) 荐
		int pageBlock = 10;
		// 茄 其捞瘤俊 焊咯临 矫累 棺 场 锅龋(抗 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		
		// 付瘤阜 其捞瘤啊 醚 其捞瘤 荐 焊促 农搁 endPage甫 pageCount肺 且寸
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > pageBlock){
%>
			<a href="privacyproduct.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[捞傈]</a>	
<%			
		}
		
		for(int i = startPage; i <= endPage; i++){
			if(i == currentPage){ // 泅犁 其捞瘤绰 傅农甫 汲沥窍瘤 臼澜
%>
			[<%=i%>]
<%				
			}else{ // 泅犁 其捞瘤啊 酒囱 版快 傅农
%>
			<a href="privacyproduct.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i %>]</a>
<%				
			}
		}
		
		if(endPage < pageCount){
%>
			<a href="privacyproduct.jsp?pageNum=<%=startPage + 10 %>&sel=<%=sel%>&find=<%=find%>">[促澜]</a>
<%			
		}
	}
%>
</td>
</tr>
<%
if (vo1 != null && (vo1.getYn().equals("A") || vo1.getYn().equals("a"))) {
%>
	<tr>
		<td colspan="6" class="button-td">
		<%-- 滚瓢阑 努腐窍搁 proudctwrite.jsp肺 捞悼 --%> <input type="button"
		class="list-button" value="臂累己" onclick="location.href='productrequest.jsp'">
		</td>
	</tr>
<%} %>

</table>
</div>
<%-- 八祸绢 涝仿 form / get规侥 / option value绰 单捞磐海捞胶 漠烦苞 悼老窍霸 汲沥 --%>
<div class="search">
<form method="get" action="privacyproduct.jsp">
<select name="sel" class="sel">
<option value="product_uid">力前锅龋</option>
<option value="product_loc">困摹</option>
</select>
<input type="text" class="search-text" name="find" id="find">
<input type="submit" class="search-button" value="八祸">
</form>
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

</body>
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
</html>