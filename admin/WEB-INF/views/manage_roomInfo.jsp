<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.room.RoomVO"%>
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
		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자    
				if (confirm("수정하시겠습니까?")) {
					document.manage_roomInfo.action = "manage_roomUpdate.do";
					document.manage_roomInfo.submit();
				}
			});
		});
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				// 확인 대화상자 
				if (confirm("삭제하시겠습니까?")) {
					document.manage_roomInfo.action = "manage_roomDelete.do";
					document.manage_roomInfo.submit();
				}
			});
		});
	</script>

	<div class="wrapper">
		<div class="sidebar" data-color="blue">
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
					<li class="nav-item active"><a class="nav-link"
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
					<a class="navbar-brand"> 숙소 관리 </a>
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
					<div class="roomInfo-div1">숙소정보</div>
					<hr class="roomInfo-hr">

					<form name="manage_roomInfo" id="manage_roomInfo" method="post">
						<table class="roomInfo-table container">


							<tr>
								<th class="roomInfo-th">숙소명</th>
								<td><input name="room_name" value="${RoomVO.room_name}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">주소</th>
								<td><input name="room_addr" value="${RoomVO.room_addr}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">상세주소</th>
								<td><input name="room_addr_detail"
									value="${RoomVO.room_addr_detail}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">설명</th>
								<td><input name="room_desc" value="${RoomVO.room_desc}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">숙소아이디</th>
								<td><input name="room_id" value="${RoomVO.room_id}"
									readonly></td>
							</tr>
							<tr>
								<th class="roomInfo-th">호스트아이디</th>
								<td><input name="host_id" value="${RoomVO.host_id}"
									readonly></td>
							</tr>
							<tr>
								<th class="roomInfo-th">가격</th>
								<td><input name="room_price" value="${RoomVO.room_price}"></td>
							</tr>
							<!-- 							<tr> -->
							<!-- 								<th class="roomInfo-th">이미지</th> -->
							<!-- 								<td><input name="room_img_no1" -->
							<%-- 									value="${RoomVO.room_img_no1}"></td> --%>
							<!-- 							</tr> -->
							<tr>
								<th class="roomInfo-th">최대인원</th>
								<td><input name="room_max" value="${RoomVO.room_max}" readonly></td>
							</tr>
							<tr>
								<th class="roomInfo-th">테마</th>
								<td><input name="room_theme" value="${RoomVO.room_theme}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">카테고리</th>
								<td><input name="room_cat" value="${RoomVO.room_cat}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">와이파이</th>
								<td><input name="room_wifi" value="${RoomVO.room_wifi}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">동물</th>
								<td><input name="room_pet" value="${RoomVO.room_pet}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">조식</th>
								<td><input name="room_meal" value="${RoomVO.room_meal}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">주차</th>
								<td><input name="room_parking"
									value="${RoomVO.room_parking}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">수영장</th>
								<td><input name="room_swpool" value="${RoomVO.room_swpool}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">좋아요</th>
								<td><input name="room_likes" value="${RoomVO.room_likes}"></td>
							</tr>
							<tr>
								<th class="roomInfo-th">별점</th>
								<td><input name="room_stars" value="${RoomVO.room_stars}"></td>
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