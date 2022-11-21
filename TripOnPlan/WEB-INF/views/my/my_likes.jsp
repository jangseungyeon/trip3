<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<title>Insert title here</title>
<script>
$(function() {
var idcheck_check = '<%=(String)session.getAttribute("user_id")%>';

console.log(idcheck_check);

if(idcheck_check == 'null') {
	alert("로그인이 필요합니다.");
	location.href = "user.login.do";
}
});
</script>
<script>
function f_getRoom(room_id) {
	location.href="u_getRoom.do?room_id=" + room_id;
}
</script>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="footer-div">
<br>
<div class="container mt-3">
  <div class="mylikes-div1">좋아요 목록</div>
<hr class="mylikes-hr">
	

	<div class="mylib-body container mt-2">
		<ul class="nav nav-tabs mylike-ul">
			<li class="nav-item flex_item mylib-li">
				<div id="test">
					<a style="color:#ff8e15; font-weight: bold;" id="test" class="tab-link current" data-tab="tab-1"
						href="likeslist.do">숙소</a>
				</div>
			</li>
			<li class="nav-item flex_item mylib-li">
				<div id="test1">
					<a id="test1" class="tab-link" data-tab="tab-2"
						href="likeslist2.do">플래너</a>
				</div>
			</li>
		</ul>
		
		<div class="tab-content">
			<div id="tab-1" class="tab-content current">
				<br>
				
				<div class="container-fluid">
		<table class="table table-hover mylike-table">
			<thead class="btn-primary">
				<tr>
					<th id="mylike-rimg1" class="likes-th1 mylike-th">숙소 사진</th>
					<th class="mylike-th">숙소명</th>
					<th class="mylike-th">지역</th>
					<th class="mylike-th">가격</th>
					<th id="mylike-rcnt1" class="mylike-th">좋아요 갯수</th>
					<th id="mylike-rlike1" class="mylike-th">좋아요</th>
				</tr>
			</thead>
			<tbody>
      <c:forEach var="i" items="${list}">
						<tr onclick="f_getRoom('${i.like_id}')" style="cursor: pointer;">
						<td id="mylike-rimg"><img style="width: 300px; height:200px" src="resources/room_img/${i.room_img_no1}"></td>
						<td>${i.room_name}</td>
						<td>${i.room_area}</td>
						<td>${i.room_price}원</td>
						<td id="mylike-rcnt">${i.like_count}</td>
						<td id="mylike-rlike">♥</td>
					
					</tr>
					
				</c:forEach>
				
				</tbody>
		</table>
		<br>
		<br>
	</div>

			</div>



		</div>
	</div>
	</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>