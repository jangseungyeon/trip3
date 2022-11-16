<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
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
function plannertr(val){
	location.href = "plannerinfo.do?planner_no="+val;
}
</script>
</head>
<body class="d-flex flex-column min-vh-100">
<div class="footer-div">
<br><br>
	<div class="container">
	<div class="myplanner-div1">작성한 플래너</div>
<hr class="myplanner-hr">
		<table class="table table-hover myplanner-table">
			<thead class="btn-primary">
				<tr>
					<th class="myplanner-th">플래너 제목</th>
					<th id="myplan-start1" class="myplanner-th">여행 시작일</th>
					<th id="myplan-end1" class="myplanner-th">여행 종료일</th>
					<th class="myplanner-th">여행 지역</th>
					<th class="myplanner-th">여행 기간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
						<tr onclick="plannertr(${i.planner_no})" align="center">
						<td>${i.planner_title}</td>
						<td id="myplan-start">${i.planner_start}</td>
						<td id="myplan-end">${i.planner_end}</td>
						<td>${i.planner_area}</td>
						<td>${i.planner_day}일</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
	</div>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>