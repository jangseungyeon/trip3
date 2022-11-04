<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>
</head>
<body>
<br><br>
<div>호스트 정보는 비밀번호 확인 후 수정이 가능합니다.</div>
<div>호스트 아이디: ${host_id}<br>
<form action="host_pw_check.do" method="post">
<input type="hidden" name="host_id" value="${host_id}">
<input type="password" name="host_pw" placeholder="비밀번호를 입력하세요."><br>
<input class="login-button" type="submit" value="확인">

</form></div>
</body>
</html>