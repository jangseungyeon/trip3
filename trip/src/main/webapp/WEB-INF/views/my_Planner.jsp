<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function plannertr(val){
	location.href = "plannerinfo.do?planner_no="+val;
}
</script>
</head>
<body>

	플래너 리스트


	<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>플래너제목</th>
					<th>아이디</th>
					<th>번호</th>
					<th>숙소명</th>
					<th>여행시작일</th>
					<th>여행종료일</th>
					<th>여해지역</th>
					<th>여행기간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${list}">
						<tr onclick="plannertr(${i.planner_no})" align="center">
						<td>${i.planner_title}</td>
						<td>${i.user_id}</td>
						<td>${i.planner_no}</td>
						<td>${i.room_name}</td>
						<td>${i.planner_start}</td>
						<td>${i.planner_end}</td>
						<td>${i.planner_area}</td>
						<td>${i.planner_day}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
	</div>

</body>
</html>