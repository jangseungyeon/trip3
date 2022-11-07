<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Admin Dashboard</title>
</head>

<body>
	<div class="wrapper">
		<div class="sidebar" data-color="green">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="manage_main.do">
							<i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>업주
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_boardList.do"> <i
							class="nc-icon nc-single-copy-04"></i>게시판 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_planList.do"> <i class="nc-icon nc-map-big"></i>플래너
							정보
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							정보
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<a class="navbar-brand" href="#pablo"> Dashboard </a>
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
						<ul class="nav navbar-nav mr-auto">
							<li class="nav-item"><a href="#" class="nav-link"
								data-toggle="dropdown"> <span class="d-lg-none">Dashboard</span>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Search</span>
							</a></li>
						</ul>

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
							<span class="no-icon">${manage_id}님
								접속중</span>
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
					<h2>예약목록</h2>
					<table border="1">
						<tr>
							<th>예약번호</th>
							<th>회원아이디</th>
							<th>imp_uid</th>
							<th>merchant_uid</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>업주아이디</th>
							<th>숙소아이디</th>
							<th>숙소명</th>
							<th>이미지</th>
							<th>결제일자</th>
							<th>결제금액</th>
							<th>예약인원</th>
							<th>변경가능횟수</th>
							<th>예약상태</th>
							<th>체크인</th>
							<th>체크아웃</th>
						</tr>
						<c:forEach var="i" items="${list}">
							<tr align="center">
								<td>${i.res_id}</td>
								<td>${i.user_id}</td>
								<td>${i.imp_uid}</td>
								<td>${i.merchant_uid}</td>
								<td>${i.res_name}</td>
								<td>${i.res_tel}</td>
								<td>${i.res_email}</td>
								<td>${i.host_id}</td>
								<td>${i.room_id}</td>
								<td>${i.room_name}</td>
								<td>${i.room_img}</td>
								<td>${i.pay_date}</td>
								<td>${i.pay_amount}</td>
								<td>${i.res_num}</td>
								<td>${i.res_count}</td>
								<td>${i.res_status}</td>
								<td>${i.res_checkin}</td>
								<td>${i.res_checkout}</td>
								<td><a class="btn btn-danger"
									href="manage_reservInfo.do?res_id=${i.res_id}" role="button">예약수정</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		
		</div>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>