<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.room.RoomVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="header.jsp"%>

<!doctype html>
<html lang="ko">

<title>정보 수정</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
</head>
<body class="info-body">
	<script>
		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자    
				if (confirm("수정하시겠습니까?")) {
					document.manage_roomInfo.action = "manage_updateRoom.do";
					document.manage_roomInfo.submit();
				}
			});
		});
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				// 확인 대화상자 
				if (confirm("삭제하시겠습니까?")) {
					document.manage_roomInfo.action = "manage_deleteRoom.do";
					document.manage_roomInfo.submit();
				}
			});
		});
	</script>

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
						href="manage_faqList.do"> <i
							class="nc-icon nc-single-copy-04"></i>공지사항 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
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
									<span class="no-icon">${manage_id}님 접속중</span>
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

					<h2>회원정보 상세</h2>
					<form name="manage_roomInfo" method="post">
						<table border="1">
							<tr>
								<td>숙소명</td>
								<td><input name="room_name" value="${RoomVO.room_name}"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input name="room_addr" value="${RoomVO.room_addr}"></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td><input name="room_addr_detail"
									value="${RoomVO.room_addr_detail}"></td>
							</tr>
							<tr>
								<td>설명</td>
								<td><input name="room_desc" value="${RoomVO.room_desc}"></td>
							</tr>
							<tr>
								<td>숙소 아이디</td>
								<td><input name="room_id" value="${RoomVO.room_id}"></td>
							</tr>
							<tr>
								<td>업주 아이디</td>
								<td><input name="host_id" value="${RoomVO.host_id}"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input name="room_price" value="${RoomVO.room_price}"></td>
							</tr>
							<tr>
								<td>이미지</td>
								<td><input name="room_img_no1"
									value="${RoomVO.room_img_no1}"></td>
							</tr>
							<tr>
								<td>마일리지</td>
								<td><input name="room_points" value="${RoomVO.room_points}"></td>
							</tr>
							<tr>
								<td>최대인원</td>
								<td><input name="room_max" value="${RoomVO.room_max}"></td>
							</tr>
							<tr>
								<td>테마</td>
								<td><input name="room_theme" value="${RoomVO.room_theme}"></td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td><input name="room_cat" value="${RoomVO.room_cat}"></td>
							</tr>
							<tr>
								<td>와이파이</td>
								<td><input name="room_wifi" value="${RoomVO.room_wifi}"></td>
							</tr>
							<tr>
								<td>동물</td>
								<td><input name="room_pet" value="${RoomVO.room_pet}"></td>
							</tr>
							<tr>
								<td>조식</td>
								<td><input name="room_meal" value="${RoomVO.room_meal}"></td>
							</tr>
							<tr>
								<td>주차</td>
								<td><input name="room_parking"
									value="${RoomVO.room_parking}"></td>
							</tr>
							<tr>
								<td>수영장</td>
								<td><input name="room_swpool" value="${RoomVO.room_swpool}"></td>
							</tr>
							<tr>
								<td>좋아요</td>
								<td><input name="room_likes" value="${RoomVO.room_likes}"></td>
							</tr>
							<tr>
								<td>별점</td>
								<td><input name="room_stars" value="${RoomVO.room_stars}"></td>
							</tr>

							<tr>
								<td colspan="2" align="center"><input type="button"
									value="수정" id="btnUpdate"> <input type="button"
									value="삭제" id="btnDelete"></td>
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