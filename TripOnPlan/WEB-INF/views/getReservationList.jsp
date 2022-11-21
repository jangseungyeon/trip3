<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.reservation.ReservationVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>

</head>
<body>
예약 내역 페이지.

<div class="container info-div">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">호텔 정보</h4>
				<br> <br>
				
				<form class="validation-form info-form" action="user_update.do" method="post"
					name="joinform">

					<div class="mb-3">
						<label for="id">res_id</label> <input type="text"
							class="form-control" name="res_id" id="id" value="${res_id}"
							readonly>
					</div>

					<div class="mb-3">
						<label for="pw">user_id</label> <input type="text"
							class="form-control" name="user_id" id="pw" value="${user_id}"
							minlength="8" maxlength="16" required>
					</div>

					<div class="mb-3">
						<label for="pw2">host_id</label> <input type="text"
							class="form-control" name="host_id" id="pw2" value="${host_id}"
							minlength="8" maxlength="16" required>
					</div>
					<font id="checkPw" size="2"></font>
					<div class="mb-3">
						<label for="name">room_id</label> <input type="text"
							class="form-control" id="name" name="room_id" value="${room_id}" required
							>
					</div>

					
					<br>
					<div class="mb-3">
						<label for="id">room_name</label> <input type="text"
							class="form-control" name="room_name" id="phone"
							value="${room_name}">
					</div>

					<label for="birth">room_img</label>
					<img style="width: 300px;" src="./resources/img/${room_img}">

					<div class="mb-3">
						<label for="gender">pay_date</label> <input type="text"
							class="form-control" id="gender" name="pay_date"
							value="${pay_date}"> <font id="checkgender"
							size="2"></font>
					</div>

					<div class="mb-3">
						<label for="email">pay_amount</label> <input type="email"
							class="form-control" id="email" name="pay_amount" required	
							value="${pay_amount}"> <font id="checkemail"
							size="2"></font>
					</div>
					<div class="mb-3">
						<label for="email">res_num</label> <input type="email"
							class="form-control" id="email" name="res_num" required	
							value="${res_num}"> <font id="checkemail"
							size="2"></font>
					</div>
					<div class="mb-3">
						<label for="email">res_count</label> <input type="email"
							class="form-control" id="email" name="res_count" required	
							value="${res_count}"> <font id="checkemail"
							size="2"></font>
					</div>
					<div class="mb-3">
						<label for="email">res_status</label> <input type="email"
							class="form-control" id="email" name="res_status" required	
							value="${res_status}"> <font id="checkemail"
							size="2"></font>
					</div>
					<div class="mb-3">
						<label for="email">res_checkin</label> <input type="email"
							class="form-control" id="email" name="res_checkin" required	
							value="${res_checkin}"> <font id="checkemail"
							size="2"></font>
					</div>
					<div class="mb-3">
						<label for="email">res_checkout</label> <input type="email"
							class="form-control" id="email" name="res_checkout" required	
							value="${res_checkout}"> <font id="checkemail"
							size="2"></font>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
<!-- 					<button class="btn btn-lg btn-block" type="button" id="cbtn" -->
<!-- 						onclick="checkForm()">수정 완료</button> -->
					<button class="btn btn-lg btn-block" type="submit" id="cbtn"
						>수정 완료</button>
					<button class="btn btn-lg btn-block info-del-btn" type="button"
						onclick="deletecheck()">탈퇴 하기</button>
				</form>
			</div>
		</div>
	</div>

	<br>
	<br>

</body>
</html>