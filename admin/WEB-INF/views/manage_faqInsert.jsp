<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">

<style>
input {
	width: 500px;
	height: 45px;
	border-radius: 15px;
	border: 1px solid #aaa;
	padding-left: 12px;
	padding-right: 12px;
	margin-top: 10px;
}

#phoneChk, button {
	margin: 10px 5px;
	color: white;
	border-radius: 7px;
	background-color: #19558c;
	border: none;
	width: 130px;
	height: 35px;
}

textarea#faq_content {
	margin-top: 15px;
	margin-bottom: 5px;
}

input#uploadFile {
	padding-top: 7px;
	background-color: white;
}

button.submitbutton {
	margin-top: 30px;
}
</style>

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
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>호스트
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
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Account</span> -->
<!-- 							</a></li> -->
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
					<div class="faqInsert-div1">공지등록</div>
					<hr class="faqInsert-hr">
					<form action="manage_faqInsert.do" method="post"
						id="manage_faqInsert" enctype="multipart/form-data">

						<table class="faqInsert-table container">
							<tr>
								<th class="faqInsert-th"></th>
								<td><input type="hidden" name="faq_writer" id="faq_writer"
									value="관리자"></td>
							</tr>
							<tr>
								<th class="faqInsert-th"></th>
								<td><input type="hidden" name="faq_cnt" id="faq_cnt"
									value="0"></td>
							</tr>
							<tr>
								<th class="faqInsert-th">작성일자</th>
								<td><input type="date" name="faq_regdate" readonly
									value="<%=sf.format(nowTime)%>"></td>
							</tr>
							<tr>
								<th class="faqInsert-th">제목</th>
								<td><input type="text" name="faq_title" id="faq_title"
									placeholder='제목' required></td>
							</tr>
							<tr>
								<th class="faqInsert-th">내용</th>
								<td><textarea class="form-control" rows="10"
										id="faq_content" name="faq_content" placeholder='내용'></textarea></td>
							</tr>
							<tr>
								<th class="faqInsert-th">파일첨부</th>
								<td><input type="file" name="uploadFile" id="uploadFile"></td>
							</tr>

							<tr>
								<th></th>
								<td><button type="button" class="submitbutton"
										onclick="check()">공지등록</button>
									<button type="reset" class="submitbutton faqInsert-resetbtn">되돌리기</button>
								</td>
							</tr>

						</table>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>