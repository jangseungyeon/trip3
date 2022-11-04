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
<br>
예약 리스트 페이지.<br>


<div class="container-fluid">
  <table class="table table-hover" id="re_table">
    <thead class="btn-primary">
      <tr>
       <th>숙소 이미지</th>
        <th>예약번호</th>
        <th>숙소명</th>
         <th>결제날짜</th>
          <th>결제금액</th>
          <th>예약인원</th>
          <th>변경 가능 횟수</th>
          <th>예약상태</th>
          <th>체크인 날짜</th>
          <th>체크아웃 날짜</th>
          <th>버튼</th>
          
      </tr>
    </thead>
    <tbody>
<c:forEach var="i" items="${reservationList}">
			<tr align="center">
			<td><img style="width: 300px;" src="resources/img/${i.room_img}"></td>
				<td>${i.res_id}</td>
				<td>${i.room_name}</td>
				<td>${i.pay_date}</td>
				<td>${i.pay_amount}</td>
				<td>${i.res_num}</td>
				<td>${i.res_count}</td>
				<td>${i.res_status}</td>
				<td>${i.res_checkin}</td>
				<td id="checkout">${i.res_checkout}</td>
				<td id="daybefore"><button>결제 취소</button></td>
				<td id="dayafter" style="display: none"><button>리뷰 쓰기</button></td>
			</tr>
			<br>
		</c:forEach>
		    </tbody>
  </table><br><br>
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
  </div><br><br>
  <script>
// var now = new Date();
// /* console.log(now.getFullYear() + "-" + (now.getMonth()+1) + "-" + now.getDate()); */
// function rowClick(){
// var table = document.getElementById("re_table");
// console.log(table);
// var rowList = table.rows;
// console.log(rowList);
// for(i=1; i<rowList.length; i++){
// 	var row = rowList[i];
// 	var str = "";
	
// 	row.onclick= function(){
// 		return function(){
// 			var one = this.cells[9].innerHTML;
// 			console.log(one);
			
			
			
// 			str = "체크"+one;
// 			document.querySelector('p').innerText = str;
// 		};
// 	}(row);
	
// }
// }
// window.onload = rowClick();




var now = new Date();
var day = now.getFullYear() + "-" + (now.getMonth()+1) + "-" + now.getDate();
var checkout = $("#checkout").val();
console.log(day);
// if(){}

$(function() {
	console.log($("#re_table").find("td:eq(9)").text());
	$('#dayafter').show();
	$('#daybefore').hide();
});
</script>
</body>
</html>