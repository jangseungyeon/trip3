<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
	$("#check_module").click(function () {
		IMP.request_pay({
			pg: 'html5_inicis.INIpayTest', // 자신이 설정한 pg사 설정
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '주문명:결제테스트',
			amount: $("#res_pay_amount_ipt").val(),
			buyer_email: $("#res_email_ipt").val(),
			buyer_name: $("#res_name_ipt").val(),
			buyer_tel: $("#res_tel_ipt").val(),
// 			buyer_addr: $("#uaddr").val() ,
// 			buyer_postcode: '123-456',
			m_redirect_url: 'http://localhost:8090/payments/complete'
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
					
					$("#imp_uid").val(rsp.imp_uid);
					$("#merchant_uid").val(rsp.merchant_uid);
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
		
		$("#list_module").click(function(){
			$.ajax({
				url : "payamount",
				data : {"mid": $("#merchant_uid").val()},
				method : "GET",
				contentType : 'application/json; charset=UTF-8',
				success : function(val){
					console.log(val);
					$("#paylist").empty();
					if(val.msg!=null){
						$("#paylist").append(val.msg);
					}else{
						$("#paylist").append("고유ID: "+val.imp_uid);
						$("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
						$("#paylist").append("<br>주문상품: "+val.name);
						$("#paylist").append("<br>주문자: "+val.buyer_name);
						$("#paylist").append("<br>결제금액: "+val.amount);
					}
				},
				error :  function(request, status){
					alert("목록 가져오기를 할 수 없습니다.");
				}
			});
		});
		
		$("#all_module").click(function(){
			$.ajax({
				url : "paylist",
				method : "GET",
				contentType : 'application/json; charset=UTF-8',
				success : function(val){
					console.log(val);
					$("#paylist").empty();
					$.each(val, function(i, v){
						$("#paylist").append("고유ID: "+v.imp_uid);
						$("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
						if(v.cancel_amount != 0 ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
						else if(v.failed_at != 0 ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
						else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
						$("#paylist").append("<br>주문상품: "+v.name);
						$("#paylist").append("<br>주문자: "+v.buyer_name);
						$("#paylist").append("<br>결제금액: "+v.amount+"<hr><br>");
					});
					
				},
				error :  function(request, status){
					alert("목록 가져오기를 할 수 없습니다.");
				}
			});
		});
		
		$("#cancel_module").click(function () {
			$.ajax({
				url : "paycan",
				data : {"mid": $("#merchant_uid").val()},
				method : "POST",
				success : function(val){
					console.log(val);
					if(val==1) alert("취소 완료");
					else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
				},
				error :  function(request, status){
					alert("취소가 실패하였습니다.");
				}
			});
		});
	
});
	
	function orderList(){
		alert('주문내역 처리할 곳. 컨트롤러 호출');
		let fm = document.Reservationfrm;
		fm.action ="pay.do";
		fm.method="post";
		fm.submit();
	}

</script>
</head>
<body>
<form name="Reservationfrm">

	<fieldset>
	
		<legend>결제 세부 정보</legend>
		
		<img src="resources/room_img/${room.room_img_no1}" alt="숙소 ${room.room_img_no1} 대표 이미지" title="숙소 ${room.room_img_no1} 대표 이미지" width="150" height="200" />
		
		숙소명: <input type="text" name="room_name" value="${room.room_name}" />
		
		<input type="hidden" name="user_id" value="${userInfo.user_id}" />
		
		<input type="hidden" name="host_id" value="${room.host_id}" />
		
		<input type="hidden" name="room_id" value="${room.room_id}" />
		
		<input type="hidden" name="room_img" value="${room.room_img_no1}" />
		
		이름: <input id="res_name_ipt" name="res_name" type="text" value="${userInfo.user_name}" />
		
		전화번호: <input id="res_tel_ipt" name="res_tel" type="text" value="${userInfo.user_phone}" />
		
		이메일: <input id="res_email_ipt" name="res_email" type="text" value="${userInfo.user_email}" />
		
		금액: <input id="res_pay_amount_ipt" name="pay_amount" type="number" value="${reservation.pay_amount}" />
		
		체크인 날짜: <input id="res_checkin_ipt" name="res_checkin" type="text" value="${reservation.res_checkin}" readonly />
		
		체크아웃 날짜: <input id="res_checkout_ipt" name="res_checkout" type="text" value="${reservation.res_checkout}" readonly />
		
		예약 인수: <input id="res_num_ipt" name="res_num" type="text" value="${reservation.res_num}" readonly />
		
		결제일: <input id="res_pay_date" name="pay_date" type="text" readonly/>
		
		<button id="check_module" type="button">결제하기</button>
		
		<br><hr>	
	
		<h2>결제내역 관련</h2>
		
	imp_uid: <input type="text" name="imp_uid" id="imp_uid" placeholder="imp_uid 입력" /><br>
	
	merchant_uid: <input type="text" name="merchant_uid" id="merchant_uid" placeholder="merchant_uid 입력"><br>
		
		<button id="cancel_module" type="button">취소하기</button>
		
		<button id="list_module" type="button">결제완료목록조회</button>
		
		<button id="all_module" type="button">모든목록조회</button>
		
	</fieldset>
	
		<p id="paylist"></p>

</form>
</body>
</html>