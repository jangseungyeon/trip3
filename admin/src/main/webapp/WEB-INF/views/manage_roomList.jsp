<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

	<h2>숙소목록</h2>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>설명</th>
			<th>숙소 아이디</th>
			<th>업주 아이디</th>
			<th>가격</th>
			<th>이미지</th>
			<th>마일리지</th>
			<th>최대인원</th>
			<th>테마</th>
			<th>카테고리</th>
			<th>와이파이</th>
			<th>동물</th>
			<th>조식</th>
			<th>주차</th>
			<th>수영</th>
			<th>좋아요</th>
			<th>별점</th>
		</tr>
		<c:forEach var="i" items="${list}">
			<tr align="center">
				<td>${i.room_name}</td>
				<td>${i.room_addr}</td>
				<td>${i.room_addr_detail}</td>
				<td>${i.room_desc}</td>
				<td>${i.room_id}</td>
				<td>${i.host_id}</td>
				<td>${i.room_price}</td>
				<td>${i.room_img}</td>
				<td>${i.room_points}</td>
				<td>${i.room_max}</td>
				<td>${i.room_theme}</td>
				<td>${i.room_cat}</td>
				<td>${i.room_wifi}</td>
				<td>${i.room_pet}</td>
				<td>${i.room_meal}</td>
				<td>${i.room_parking}</td>
				<td>${i.room_swpool}</td>
				<td>${i.room_likes}</td>
				<td>${i.room_stars}</td>
				<td><a class="btn btn-danger" href="manage_roomInfo.do?host_id=${i.host_id}" role="button">정보수정</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>