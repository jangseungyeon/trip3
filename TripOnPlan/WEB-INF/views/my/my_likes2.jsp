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
function plannertr(val, bal){
	console.log(val, bal)
	location.href = "plannerDP.do?planner_no="+bal +"&&user_id="+val;
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
					<a id="test" class="tab-link current" data-tab="tab-1"
						href="likeslist.do">숙소</a>
				</div>
			</li>
			<li class="nav-item flex_item mylib-li">
				<div id="test1">
					<a style="color:#ff8e15; font-weight: bold;" id="test1" class="tab-link" data-tab="tab-2"
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
					<th class="mylike-th">제목</th>
					<th id="mylike-w1" class="mylike-th">작성자</th>
					<th class="mylike-th">지역</th>
					<th class="mylike-th">기간</th>
					<th id="mylike-pcnt1" class="mylike-th">좋아요 갯수</th>
					<th id="mylike-plike1" class="mylike-th">좋아요</th>
					
				</tr>
			</thead>
			<tbody>
      <c:forEach var="i" items="${list}">
						<tr onclick="plannertr('${i.like_id}','${i.like_no}' )" style="cursor: pointer;">
						<td>${i.planner_title}</td>
						<td id="mylike-w">${i.like_id}</td>
						<td>${i.planner_area}</td>
						<td>${i.planner_day}일</td>
						<td id="mylike-pcnt">${i.like_count}</td>
						<td id="mylike-plike">♥</td>
					
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