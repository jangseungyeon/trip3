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
	
<script>
	function deletecheck() {
		var deletecheck = prompt("탈퇴를 원하시면 아래 문구를 입력해주세요.\n'회원탈퇴'");
		if (deletecheck == "회원탈퇴") {
			location.href = "manage_delete.do";

		} else {
			alert("문구가 일치하지 않습니다.");
		}

	}
</script>

</head>
<body>

	<h2>회원목록</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>상태</th>
			<th>타입</th>
			<th colspan="2"><a class="btn btn-primary" href="manage_userInsertForm.do" role="button">회원가입</a></th>
		</tr>
		<c:forEach var="i" items="${list}">
			<tr align="center">
				<td>${i.user_id}</td>
				<td>${i.user_name}</td>
				<td>${i.user_birth}</td>
				<td>${i.user_gender}</td>
				<td>${i.user_email}</td>
				<td>${i.user_phone}</td>
				<td>${i.user_address1}</td>
				<td>${i.user_address2}</td>
				<td>${i.user_status}</td>
				<td>${i.user_type}</td>
				<td><a class="btn btn-primary" href="manage_userInfo.do?user_id=${i.user_id}" role="button">수정</a></td>
				<td><a class="btn btn-primary" onclick="deletecheck()">탈퇴</a></td>
					
			</tr>
		</c:forEach>
	</table>
</body>
</html>