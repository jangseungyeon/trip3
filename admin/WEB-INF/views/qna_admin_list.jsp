<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
<title>관리자 리스트 페이지</title>
<meta charset="utf-8">

<script>
	function detailList(num) {
		location.href = "qna_update.do?qna_num=" + num;
	}
</script>

</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="black">
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
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> 문의 응답 </a>
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

					<div class="container">
						<h2>1:1 문의 목록</h2>
						<p>회원의 문의에 대한 관리자 답변</p>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>질문날짜</th>
									<th>답변여부</th>
									<!-- <th>삭제</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${qnaadminlist}" var="qna1">
									<tr>
										<td>${qna1.qna_num }</td>
										<td><a href="qna_admin_views.do?qna_num=${qna1.qna_num }">${qna1.qna_title }</a></td>
										<td>${qna1.qna_regdate }</td>
										<td>${qna1.qna_views }</td>
<!-- 										<td> -->
<!-- 											<form action="qna_delete.do" method="post"> -->
<!-- 												<input type="hidden" name="qna_admin_id" -->
<%-- 													value="${qna1.qna_num }"> --%>
<%-- 												 <button type="button" onclick="deleteOne(${qnaOne.qna_num});" class="btn btn-primary">삭제</button> --%>
<!-- 											</form> -->
<!-- 										</td> -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
