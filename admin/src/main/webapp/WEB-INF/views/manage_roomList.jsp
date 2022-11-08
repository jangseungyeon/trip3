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
		<div class="sidebar" data-color="orange">
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
					<li class="nav-item active"><a class="nav-link"
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
					<li class="nav-item"><a class="nav-link"
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

					<h3>숙소목록</h3>
					<table border="1">
						<tr>
							<th>이름</th>
							<th>주소</th>
							<th>상세주소</th>
							<th>설명</th>
							<th>숙소 아이디</th>
							<th>업주 아이디</th>
							<th>가격</th>
							<th>이미지</th>
							<th>마일리지</th>
							<th>최대인원</th>
							<th>테마</th>
							<th>카테고리</th>
							<th>와이파이</th>
							<th>동물</th>
							<th>조식</th>
							<th>주차</th>
							<th>수영</th>
							<th>좋아요</th>
							<th>별점</th>
						</tr>
						<c:forEach var="i" items="${list}">
							<tr align="center">
								<td>${i.room_name}</td>
								<td>${i.room_addr}</td>
								<td>${i.room_addr_detail}</td>
								<td>${i.room_desc}</td>
								<td>${i.room_id}</td>
								<td>${i.host_id}</td>
								<td>${i.room_price}</td>
								<td>${i.room_img_no1}</td>
								<td>${i.room_points}</td>
								<td>${i.room_max}</td>
								<td>${i.room_theme}</td>
								<td>${i.room_cat}</td>
								<td>${i.room_wifi}</td>
								<td>${i.room_pet}</td>
								<td>${i.room_meal}</td>
								<td>${i.room_parking}</td>
								<td>${i.room_swpool}</td>
								<td>${i.room_likes}</td>
								<td>${i.room_stars}</td>
								<td><a class="btn btn-danger"
									href="manage_roomInfo.do?host_id=${i.host_id}" role="button">정보수정</a></td>
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