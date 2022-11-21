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
		function a() {
			document.manage_reservInfo.action = "manage_reservUpdate.do";
			document.manage_reservInfo.submit();
		};

		function cancelPay(mid) {
			// 현재: 2021-03-24
			var now = new Date();

			// 파라미터로 받을 수 있음. 편의상 현재날짜로 대체
			var date = "${ReservationVO.res_checkin}";
			var date_arr = date.split("-");

			var year = now.getFullYear(); // 연도
			var month = now.getMonth() + 1; // 월    
			var day = now.getDate(); // 일

			var stDate = new Date(date_arr[0], date_arr[1], date_arr[2]);
			var endDate = new Date(year, month, day);

			var btMs = stDate.getTime() - endDate.getTime();
			var btDay = btMs / (1000 * 60 * 60 * 24);

			console.log("일수 차이는?? " + btDay);
			if (btDay >= 3) {
				$.ajax({
					url : "paycan",
					data : {
						"mid" : mid
					},
					method : "POST",
					success : function(val) {
						console.log(val);
						if (val == 1) {
							alert("취소 완료");
							a();
						} else {
							alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
						}
					},
					error : function(request, status) {
						alert("취소가 실패하였습니다.");
					}
				});
			} else {
				alert("환불불가");
			}
		}
		$(document)
				.ready(
						function() {
							$("#btnDelete")
									.click(
											function() {
												// 확인 대화상자 
												if (confirm("삭제하시겠습니까?")) {
													document.manage_reservInfo.action = "manage_reservDelete.do";
													document.manage_reservInfo
															.submit();
												}
											});
						});
	</script>


	<div class="wrapper">
		<div class="sidebar" data-color="red">
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
					<li class="nav-item active"><a class="nav-link"
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
					<a class="navbar-brand"> 예약 관리 </a>
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
					<div class="reservInfo-div1">예약정보</div>
					<hr class="reservInfo-hr">
					<form name="manage_reservInfo" id="manage_reservInfo" method="post">
						<table class="reservInfo-table container">
							<tr>
								<th class="reservInfo-th">예약번호</th>
								<td><input name="res_id" value="${ReservationVO.res_id}"
									readonly></td>
							</tr>
							<tr>
								<th class="reservInfo-th">회원아이디</th>
								<td><input name="user_id" value="${ReservationVO.user_id}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">imp_uid</th>
								<td><input name="imp_uid" value="${ReservationVO.imp_uid}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">merchant_uid</th>
								<td><input name="merchant_uid"
									value="${ReservationVO.merchant_uid}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">이름</th>
								<td><input name="res_name"
									value="${ReservationVO.res_name}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">전화번호</th>
								<td><input name="res_tel" value="${ReservationVO.res_tel}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">이메일</th>
								<td><input name="res_email"
									value="${ReservationVO.res_email}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">호스트아이디</th>
								<td><input name="host_id" value="${ReservationVO.host_id}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">숙소아이디</th>
								<td><input name="room_id" value="${ReservationVO.room_id}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">숙소명</th>
								<td><input name="room_name"
									value="${ReservationVO.room_name}"></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th class="reservInfo-th">이미지</th> -->
<!-- 								<td><input name="room_img" -->
<%-- 									value="${ReservationVO.room_img}"></td> --%>
<!-- 							</tr> -->
							<tr>
								<th class="reservInfo-th">결제일자</th>
								<td><input name="pay_date"
									value="${ReservationVO.pay_date}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">결제금액</th>
								<td><input name="pay_amount"
									value="${ReservationVO.pay_amount}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">예약인원</th>
								<td><input name="res_num" value="${ReservationVO.res_num}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">변경가능횟수</th>
								<td><input name="res_count"
									value="${ReservationVO.res_count}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">예약상태</th>
								<td><input name="res_status"
									value="${ReservationVO.res_status}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">체크인</th>
								<td><input name="res_checkin"
									value="${ReservationVO.res_checkin}"></td>
							</tr>
							<tr>
								<th class="reservInfo-th">체크아웃</th>
								<td><input name="res_checkout"
									value="${ReservationVO.res_checkout}"></td>
							</tr>
							<tr>
								<th></th>
								<td>
<!-- 								<input type="button" class="submitbutton" value="수정" id="btnUpdate">  -->
									<input type="button" class="submitbutton" value="삭제" id="btnDelete"></td>
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