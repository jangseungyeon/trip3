<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약 결제 페이지</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>

$(document).ready(function(){
	$("#res_pay_date_datePicker").datepicker({
		
		dateFormat: 'yy/mm/dd',

		language: 'kr',

		autoclose: true,

		todayHighlight: true
	});
	
	$("#res_pay_date_datePicker").datepicker('setDate', new Date);
	
});

</script>
</head>
<body>
<form name="Reservationfrm" action="insertReservation.do" method="post">

	<fieldset>
	
		<legend>결제 세부 정보</legend>
		
		<img src="/resources/room_img/${room.room_img_no1}" alt="숙소 ${room.room_img_no1} 대표 이미지" title="숙소 ${room.room_img_no1} 대표 이미지" width="150" height="200" />
		
		숙소명: <input type="text" name="room_name" value="${room.room_name}" />
		
		<input type="hidden" name="host_id" value="${room.host_id}" />
		
		<input type="hidden" name="room_id" value="${room.room_id}" />
		
		<input type="hidden" name="room_img" value="${room.room_img_no1}" />
		
		이름: <input id="res_name_ipt" name="res_name" type="text" value="${userInfo.user_name}" />
		
		전화번호: <input id="res_tel_ipt" name="res_tel" type="text" value="${userInfo.user_phone}" />
		
		이메일: <input id="res_email_ipt" name="res_email" type="text" value="${userInfo.user_email}" />
		
		금액: <input id="res_pay_amount_ipt" name="pay_amount" type="text" value="${reservation.pay_amount}" />
		
		체크인 날짜: <input id="res_checkin_ipt" name="res_checkin" type="text" value="${reservation.res_checkin}" readonly />
		
		체크아웃 날짜: <input id="res_checkout_ipt" name="res_checkout" type="text" value="${reservation.res_checkout}" readonly />
		
		예약 인수: <input id="res_num_ipt" name="res_num" type="text" value="${reservation.res_num}" readonly />
		
		결제일: <input id="res_pay_date_datePicker" name="pay_date" type="text" />
		
		<input type="submit" value="결제하기" />
		
	</fieldset>

</form>
</body>
</html>