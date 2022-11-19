<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<title>Insert title here</title>
</head>
<body class="d-flex flex-column min-vh-100">
<br><br>
<div class="footer-div">
<div class="container">
<div class="check-div1">내 정보 수정</div>
<hr class="check-hr">

<div class="check-pw-div" style="font-size:20px;">비밀번호를 입력해 주세요.</div>
<br>
<form class="check-form" action ="myinfogo.do" method="post">
<input class="check-input" type="password" name="user_password">
<button class="check-btn">입력하기</button>
</form>
</div>
<br><br>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>