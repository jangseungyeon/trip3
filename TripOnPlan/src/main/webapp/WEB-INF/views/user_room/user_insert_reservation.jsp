<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../header.jsp" %>

<title>숙소 예약 결제 페이지</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

let today = new Date();

let dateFormat = today.getFullYear() + '/'; 

dateFormat += ( (today.getMonth()+1) <= 9 ? "0" + (today.getMonth()+1) : (today.getMonth()+1) ) + '/';

dateFormat += ( (today.getDate()) <= 9 ? "0" + (today.getDate()) : (today.getDate()) ) +  " "; 

dateFormat += ( (today.getHours()) <= 9 ? "0" + (today.getHours()) : (today.getHours()) ) + ":"; 

dateFormat += ( (today.getMinutes()) <= 9 ? "0" + (today.getMinutes()) : (today.getMinutes()) ) + ":"; 

dateFormat += ( (today.getSeconds()) <= 9 ? "0" + (today.getSeconds()) : (today.getSeconds()) );

var chk = false;

$(document).ready(function(){
	
	$("#res_pay_date").val(dateFormat);
	
	var IMP = window.IMP; // 생략가능
	IMP.init('${impKey}');
	
	let mobilePayfrm = $("#Reservationfrm").serialize();
	
	$("#check_module").click(function () {
		IMP.request_pay({
			pg: 'html5_inicis.INIpayTest', // 자신이 설정한 pg사 설정
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'tripOnplan 결제: ' + "${room.room_name}",
			amount: $("#res_pay_amount_ipt").val(),
			buyer_email: $("#res_email_ipt").val(),
			buyer_name: $("#res_name_ipt").val(),
			buyer_tel: $("#res_tel_ipt").val(),
// 			buyer_addr: $("#uaddr").val() ,
// 			buyer_postcode: '123-456',
			m_redirect_url:"http://triponplan.ga/mobilepaymentcomplete.do?formdata=" + mobilePayfrm
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';

					$("#imp_uid").val(rsp.imp_uid);
					$("#merchant_uid").val(rsp.merchant_uid);
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.\n관리자에게 문의 바랍니다.';
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
	
});
	
	function orderList(){
		let fm = document.Reservationfrm;
		fm.action ="pay.do";
		fm.method="post";
		fm.submit();
	}

</script>

<style>

	form {
		
		margin: 20px auto;
		
		text-align: center;
		
	}
	
	#roomImgDiv {
		margin: 0;

	}
	
	#roomImg {
		
		border-radius: 5px;
		
		
	}
	
	#paymentBox {
		
		display: flex;
		
		width: 80%;
		
		margin: 0 auto;
		
		flex-direction: row;
		
		justify-content: center;
		
		flex: auto;
	}
	
	#paymentInfos {
		flex: 0.5;
	}
	
	
	table {
		height: 460px;
		text-align: right;
		margin-left: 20px;
	}
	
	table tr, td {
		font-weight: 600;
	}
	
	
	#CheckBoxNpayBtn {
		text-align: center;
		
		margin-top: 45px;
		
		font-size: 1.3rem;
		
		font-weight: 500;
	}
	
	#CheckBoxNpayBtn button {
		background-color: #ff8e15;
    	color: white;
    	border: 1px solid #ff8e15;
    	border-radius: 7px;
    	height: 40px;
    	font-weight: bold;
    	width: 130px;
	}
	
	#CheckBoxNpayBtn button:hover {
		background-color: #ff9a2d;
    	color: white;
	}
	
	input {
		border-radius: 15px;
    	border: 1px solid #aaa;
    	text-align: center;
	}
	
</style>
</head>
<body>

<form name="Reservationfrm" id="Reservationfrm">

	<div id="paymentBox">
		
		<div id="roomImgDiv">
		
		<img id="roomImg" src="resources/room_img/${room.room_img_no1}" alt="숙소 ${room.room_img_no1} 대표 이미지" title="숙소 ${room.room_img_no1} 대표 이미지" width="460" height="460" />
		
		</div>
		
		<div id="paymentInfos">
		
		<table>
		
		<tr><td> ${room.room_name} </td></tr>
		
		<tr><td> ${room.room_addr} <c:if test="${not empty room.room_addr_detail}">&nbsp;${room.room_addr_detail}</c:if></td></tr>
		
		<tr><td><input type="hidden" name="room_name" value="${room.room_name}"/></td></tr>
		
		<tr><td><input type="hidden" name="user_id" value="${userInfo.user_id}" /></td></tr>
		
		<tr><td><input type="hidden" name="host_id" value="${room.host_id}" /></td></tr>
		
		<tr><td><input type="hidden" name="room_id" value="${room.room_id}" /></td></tr>
		
		<tr><td><input type="hidden" name="room_img" value="${room.room_img_no1}" /></td></tr>
		
		<tr><td><input type="hidden" name="imp_uid" id="imp_uid" /></td></tr>
		
		<tr><td><input type="hidden" name="merchant_uid" id="merchant_uid" /></td></tr>
		
		<tr><td><input type="hidden" id="res_pay_date" name="pay_date" type="text" /></td></tr>
		
		<tr><td>이름: <input id="res_name_ipt" name="res_name" type="text" value="${userInfo.user_name}" /></td></tr>
		
		<tr><td>전화번호: <input id="res_tel_ipt" name="res_tel" type="text" value="${userInfo.user_phone}" /></td></tr>
		
		<tr><td>이메일: <input id="res_email_ipt" name="res_email" type="text" value="${userInfo.user_email}" /></td></tr>
		
		<tr><td><small>[이름과 전화번호, 이메일은 수정이 가능합니다.]</small></td></tr>
		
		<tr><td>금액: <input id="res_pay_amount_ipt" name="pay_amount" type="text" value="${reservation.pay_amount}"/></td></tr>
		
		<tr><td>체크인 날짜: <input id="res_checkin_ipt" name="res_checkin" type="text" value="${reservation.res_checkin}" readonly /></td></tr>
		
		<tr><td>체크아웃 날짜: <input id="res_checkout_ipt" name="res_checkout" type="text" value="${reservation.res_checkout}" readonly /></td></tr>
		
		<tr><td>예약 인수: <input id="res_num_ipt" name="res_num" type="text" value="${reservation.res_num}" readonly /></td></tr>
		
		</table>

		</div>
	
	</div>
	
	<div id="CheckBoxNpayBtn">
	
	<div style="margin-top: 15px;"><button id="check_module" type="button">결제하기</button></div>
	
	</div>

</form>

<br>

<br>

<%@ include file="../footer.jsp" %>

</body>
</html>