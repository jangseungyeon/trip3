<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.host.HostVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	padding: 12px;
	margin-top: 10px;
}

input#btnDelete {
	margin: 10px;
}

textarea#faq_content {
    margin-top: 15px;
    margin-bottom: 5px;
}

input#uploadFile {
	padding-top: 7px;
	background-color: white;
}

.submitbutton {
	/* 	margin: 10px 5px; */
	color: white;
	border-radius: 7px;
	background-color: #19558c;
	border: none;
	width: 130px;
	margin-top: 30px;
}
</style>
</head>
<body class="info-body">
	<script>
		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자    
				if (confirm("수정하시겠습니까?")) {
					document.manage_faqInfo.action = "manage_faqUpdate.do";
					document.manage_faqInfo.submit();
				}
			});
		});
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				// 확인 대화상자 
				if (confirm("삭제하시겠습니까?")) {
					document.manage_faqInfo.action = "manage_faqDelete.do";
					document.manage_faqInfo.submit();
				}
			});
		});
	</script>

	<div class="wrapper">
		<div class="sidebar" data-color="green">
			<!-- data-color="purple | blue | green | orange | red | azure | black" -->
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
					<div class="faqInfo-div1">공지사항</div>
					<hr class="faqInfo-hr">

					<form name="manage_faqInfo" id="manage_faqInfo" method="post" enctype="multipart/form-data">
						<table class="faqInfo-table container">
							<tr>
								<th class="faqInfo-th">번호</th>
								<td><input name="faq_no" value="${FaqVO.faq_no}" readonly></td>
							</tr>
							<tr>
								<th class="faqInfo-th">제목</th>
								<td><input name="faq_title" value="${FaqVO.faq_title}"></td>
							</tr>
							<tr>
								<th class="faqInfo-th">내용</th>
								<td><textarea class="form-control" rows="10"
										id="faq_content" name="faq_content">${FaqVO.faq_content}</textarea></td>
							</tr>
							<tr>
								<th class="faqInfo-th">작성일</th>
								<td><input name="faq_regdate" value="${FaqVO.faq_regdate}"></td>
							</tr>
							<tr>
								<th class="faqInfo-th">작성자</th>
								<td><input name="faq_writer" value="${FaqVO.faq_writer}"></td>
							</tr>
							<tr>
								<th class="faqInfo-th">조회수</th>
								<td><input name="faq_cnt" value="${FaqVO.faq_cnt}"></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th class="faqInfo-th">파일첨부</th> -->
<!-- 								<td><input type="file" name="uploadFile" id="uploadFile"></td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th class="faqInfo-th">파일</th> -->
<%-- 								<td><input name="filename" value="${FaqVO.filename}"></td> --%>
<!-- 							</tr> -->
							<tr>
								<th></th>
								<td><input type="button" class="submitbutton" value="수정"
									id="btnUpdate"> <input type="button"
									class="submitbutton" value="삭제" id="btnDelete"></td>
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