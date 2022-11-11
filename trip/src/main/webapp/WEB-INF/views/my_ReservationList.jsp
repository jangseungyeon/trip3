<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.reservation.ReservationVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>


<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

 <script>

</script> 

<script>


function f_getPayInfo(mid, idx) {
	$.ajax({
		url : "payamount",
		data : {"mid": mid},
		method : "GET",
		contentType : 'application/json; charset=UTF-8',
		success : function(val){
			console.log(val);
			getPayInfoIdx(idx, val);
			if(val.msg!=null){
				alert(val.msg + "\n관리자에게 문의하십시오.");
			}else{
				console.log(val)
			}
		},
		error :  function(request, status){
			alert("목록 가져오기를 할 수 없습니다.");
			}
		});
}

function f_cancelPay(mid, fmIndex){
	$.ajax({
		url : "paycan",
		data : {"mid": mid},
		method : "POST",
		success : function(val){
			console.log(val);
			if(val==1) {
				alert("취소 완료");
				f_cancelRes(fmIndex)
			} else {
				alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			}
		},
		error :  function(request, status){
			alert("취소가 실패하였습니다.");
		}
	});
}

function f_cancelRes(fmIndex){
	let frm = document.getElementsByName(fmIndex)[0];
	frm.action = "cancelReservation.do";
	frm.method = "post";
	frm.submit();
};

function getPayInfoIdx(idx, val) {
	let PayInfos = document.getElementById(idx);
	
	while ( PayInfos.hasChildNodes() )
	{
		PayInfos.removeChild( PayInfos.firstChild );       
	}
	
	const node = document.createElement("text");
// 	const textnode1 = document.createTextNode("고유ID: "+val.imp_uid);
// 	const textnode2 = document.createTextNode("\n상점 거래ID: "+val.merchant_uid);
	const textnode3 = document.createTextNode("주문상품: "+val.name);
	const textnode4 = document.createTextNode("주문자: "+val.buyer_name);
	const textnode5 = document.createTextNode("결제금액: "+val.amount);
// 	node.appendChild(textnode1);
// 	node.appendChild(textnode2);
	node.appendChild(textnode3);
	node.appendChild(textnode4);
	node.appendChild(textnode5);
	PayInfos.appendChild(node);
}

function reservationtr(val) {
	location.href = "check.do?res_id="+val;
};

function f_move_to_insert_review(room_id) {
	
	location.href = "u_getRoom.do?room_id=" + room_id + "#u_room_review";
	
}
</script>


</head>
<body>

<br><br>
<div class="container">
</div>
<div class="container">
<div class="reslist-div1">결제한 숙소 목록</div>
<hr class="reslist-hr">
<div class="row list-grid-div">
  <table class="table table-hover" id="re_table">
    <thead class="btn-primary">
      <tr>
       <th class="col-sm-3">숙소 이미지</th>
        <th class="col-sm-2">숙소명</th>
          <th class="col-sm-1">결제금액</th>
          <th class="col-sm-1">예약인원</th>
          <th class="col-sm-1">체크인</th>
          <th class="col-sm-1">체크아웃</th>
          <th class="col-sm-1">결제</th>
          <th class="col-sm-1">상세정보</th>
          <th class="col-sm-1">리뷰</th>
      </tr>
    </thead>
    <tbody>
<c:forEach var="i" items="${reservationList}" varStatus="status">
			<tr align="center">
			<td><img style="width: 300px; height:200px" src="resources/room_img/${i.room_img}"></td>
				<td>${i.room_name}</td>
				<td>${i.pay_amount}</td>
				<td>${i.res_num}</td>
				<td style="display: none" class="status">${i.res_status}</td>
				<td>${i.res_checkin}</td>
				<td id="checkout" class="checkout">${i.res_checkout}</td>
				<td id="daybefore${status.index}"><button class="reserlist-btn" onclick="f_cancelPay('${i.merchant_uid}', 'resCancelfm_${status.index}')">결제<br>취소</button></td>
				<td id="ing${status.index}" style="display: none"><span>취소<br>완료</span></td>
				<td><button class="reserlist-btn" onclick="reservationtr('${i.res_id}')">상세<br>정보</button></td>
				<td id="dayafter${status.index}" class="dayafter${status.index}"><button class="reserlist-btn" onclick="f_move_to_insert_review('${i.room_id}')">리뷰<br>쓰기</button></td>
				<td id="ing2${status.index}" style="display: none"><span>작성<br>대기</span></td>
<%-- 				<td><button onclick="f_getPayInfo('${i.merchant_uid}','PayInfos${status.index}')">결제 정보 보기</button></td> --%>
			</tr>
			<br>
			<form name="resCancelfm_${status.index}">
			<input type="hidden" name="user_id" value="${user_id}" />
			<input type="hidden" name="res_id" value="${i.res_id}" />
			<input type="hidden" name="imp_uid" id="${i.imp_uid}_${status.index}" value="${i.imp_uid}" />
			<input type="hidden" name="merchant_uid" id="${i.merchant_uid}_${status.index}" value="${i.merchant_uid}" />
			</form>
		</c:forEach>
		    </tbody>
  </table>
  <br><br>
  </div>
  </div>
		  <div id="btnBox">
  <!-- 반복처리할 태그 시작-->
  <c:if test="${paging.nowPageBtn > 1 }">
  	<a class="list-btn" href ="getBoardList.do?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
  </c:if>
  <c:forEach begin="${paging.startBtn}" end="${paging.endBtn }" step="1" var="i" >
  <c:choose>
  	  <c:when test="${paging.nowPageBtn == i}">
  	  	<a class="aSel">${i}</a>
	  </c:when>
	  <c:otherwise>
		<a class="list-btn" href ="getBoardList.do?nowPageBtn=${i}">${i}</a>
	  </c:otherwise>
  </c:choose>
  </c:forEach>
  <c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
  	<a class="list-btn" href ="getBoardList.do?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
  </c:if>
  <!-- 반복처리할 태그 끝 -->
  </div><br>
  <br>
  
  
  <script>
  
//   예약취소
  $(function() {
		var tdArr = $("#re_table td.status");
		var i = 0;
	
		$.each(tdArr, function(i, v){
			var status = $(v).text();
			if($(v).text() == 1) {
				$("#ing" + i).show();
				$("#daybefore" + i).hide();
			} 
		i = i + 1;
		});
	});
  
  // 리뷰 쓰기
</script>
<script type="text/javascript">
	var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var today = year + "-" + month + "-" + day;
$(function() {
	//오늘 날짜
	
    
	var tdArrco = $("#re_table td.checkout");
	var x = 0;
	$.each(tdArrco, function(x, v){
		var checkout = $(v).text();
			console.log("체크아웃"+$(v).text())
			console.log(checkout < today)
		if(checkout < today) {
			$("#re_table td#dayafter"+x).show();

		} else {
			$("#re_table td#dayafter"+x).hide();
			$("#ing2" + x).show();
// 		

		}
	x = x + 1;
	});
});
</script>
</body>
</html>