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

	<h2>업주목록</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>업소명</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>상태</th>
			<th>사업자번호</th>
			<th>이미지</th>
			<th>은행</th>
			<th>계좌번호</th>
			<th><a class="btn btn-primary" href="manage_hostInsertForm.do" role="button">업주가입</a></th>
		</tr>
		<c:forEach var="i" items="${list}">
			<tr align="center">
				<td>${i.host_id}</td>
				<td>${i.host_bizname}</td>
				<td>${i.host_name}</td>
				<td>${i.host_birth}</td>
				<td>${i.host_email}</td>
				<td>${i.host_phone}</td>
				<td>${i.host_addr1}</td>
				<td>${i.host_addr2}</td>
				<td>${i.host_status}</td>
				<td>${i.host_biznum}</td>
				<td>${i.host_bizimg}</td>
				<td>${i.host_bank}</td>
				<td>${i.host_banknum}</td>
				<td><a class="btn btn-danger" href="manage_hostInfo.do?host_id=${i.host_id}" role="button">정보수정</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>