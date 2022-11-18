<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.host.HostVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="header.jsp"%>

<!doctype html>
<html lang="ko">
<title>정보 수정</title>
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
		$(document)
				.ready(
						function() {
							$("#btnUpdate")
									.click(
											function() {
												// 확인 대화상자    
												if (confirm("수정하시겠습니까?")) {
													document.manage_plannerInfo.action = "manage_plannerUpdate.do";
													document.manage_plannerInfo
															.submit();
												}
											});
						});
		$(document)
				.ready(
						function() {
							$("#btnDelete")
									.click(
											function() {
												// 확인 대화상자 
												if (confirm("삭제하시겠습니까?")) {
													document.manage_plannerInfo.action = "manage_plannerDelete.do";
													document.manage_plannerInfo
															.submit();
												}
											});
						});
	</script>

	<div class="wrapper">
		<div class="sidebar" data-color="orange">
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
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항
							관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
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
					<a class="navbar-brand"> 플래너 관리 </a>
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
					<div class="userInfo-div1">플래너정보</div>
					<hr class="userInfo-hr">

					<form name="manage_plannerInfo" id="manage_plannerInfo"
						method="post">
						<table class="plannerInfo-table container">
							<tr>
								<th class="plannerInfo-th">번호</th>
								<td><input name="planner_no"
									value="${PlannerVO.planner_no}" readonly></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">제목</th>
								<td><input name="planner_title"
									value="${PlannerVO.planner_title}"></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">아이디</th>
								<td><input name="user_id" value="${PlannerVO.user_id}"></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">시작일</th>
								<td><input name="planner_start"
									value="${PlannerVO.planner_start}"></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">종료일</th>
								<td><input name="planner_end"
									value="${PlannerVO.planner_end}"></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">지역</th>
								<td><input name="planner_area"
									value="${PlannerVO.planner_area}"></td>
							</tr>
							<tr>
								<th class="plannerInfo-th">여행기간</th>
								<td><input name="planner_day"
									value="${PlannerVO.planner_day}" readonly></td>
							</tr>
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