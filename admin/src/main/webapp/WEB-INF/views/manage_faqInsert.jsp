<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>공지등록</title>
<script>
	
<%if (request.getParameter("manage_faqInsert") != null) {%>
	alert("공지 등록에 실패했습니다");
<%}%>
	//공지 작성 버튼
	function check() {
		$('#manage_faqInsert').submit();

	}
<%Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");%>
	
</script>




</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="green">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="manage_main.do" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="manage_main.do">
							<i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>업주
							관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> 공지사항 관리 </a>
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">${manage_id}님 접속중</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Account</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="manage_logout.do"> <span class="no-icon">Log
										out</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">
				<div class="container-fluid">
					<h3>공지 등록</h3>
					<form action="manage_faqInsert.do" method="post"
						id="manage_faqInsert" enctype="multipart/form-data">

						<input type="text" name="faq_writer" id="faq_writer" value="관리자" readonly><br>
						<!-- <input type="password" name="host_password" id="host_password" placeholder='비밀번호'><br> -->
						<input type="date" name="faq_regdate" value="<%=sf.format(nowTime)%>"><br> 
						<input type="text" name="faq_title" placeholder='제목'><br>
						<textarea name="faq_content" id="faq_content" placeholder='내용'></textarea><br> 
						<input type="hidden" name="faq_cnt" id="faq_cnt" value="0"> 
						<input type="file" name="uploadFile"><br>

						<button type="button" class="submitbutton" onclick="check()">공지등록</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>