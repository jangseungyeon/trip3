<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="resources/css/style.css" rel="stylesheet">

<title>tripONplan</title>
</head>

<style>
* {
	margin: 0;
	padding: 0;
}

.main-container {
	width: 100%;
	/* 		height:600px; */
}

.sub-container-left {
	width: 50%;
	height: 600px;
	float: left;
	position: relative;
}

.sub-container-left::after {
	width: 100%;
	height: 100vh;
	content: "";
	background: url("resources/img/tobehost.gif");
	background-size: cover;
	filter: brightness(50%);
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
}

.sub-container-right {
	width: 50%;
	height: 100vh;
	float: right;
	background: linear-gradient(to right, rgba(20, 20, 20, 0) 10%,
		rgba(20, 20, 20, 0.1) 25%, rgba(20, 20, 20, 0.15) 50%,
		rgba(20, 20, 20, 0.2) 75%, rgba(20, 20, 20, 0.3) 100%),
		url(resources/img/view_960_720.jpg);
	background-size: cover;
	position: relative;
}

.host-insert-text {
	font-size: 30px;
	color: white;
	position: absolute;
	top: 20%;
	left: 20%;
	text-align: left;
	line-height: 180%;
	z-index: 2;
}

.host-insert-button {
	width: 40%;
	height: 40px;
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 5px 20px;
	border-radius: 5px;
	font-size: 15px;
	background-color: #dc3545; /*빨간색*/
	background-color: #007bff; /*파란색*/
	color: white;
	border: none;
	font-weight: bold;
	z-index: 2;
}

.host-insert-button:hover {
	width: 40%;
	height: 40px;
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 5px 20px;
	border-radius: 5px;
	font-size: 15px;
	background-color: #dc3545; /*빨간색*/
	background-color: #007bff; /*파란색*/
	color: white;
	border: none;
	font-weight: bold;
	filter: brightness(80%);
}

.host-login-text {
	font-size: 30px;
	color: white;
	position: absolute;
	top: 20%;
	right: 20%;
	text-align: right;
	line-height: 180%;
	z-index: 2;
}

.login-form {
	width: 60%;
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.input-id-pw {
	width: 100%;
	height: 40px;
	padding: 5px 20px;
	border-radius: 20px;
	border: none;
	margin: 3px;
	font-size: 12px;
}

.input-id-pw:focus {
	width: 100%;
	height: 40px;
	padding: 5px 20px;
	border-radius: 20px;
	border: none;
	margin: 3px;
	font-size: 12px;
	outline: none;
}

.login-button {
	width: 100%;
	height: 35px;
	padding: 5px 20px;
	border-radius: 20px;
	font-size: 12px;
	background-color: #28a745; /*녹색*/
	background-color: #007bff; /*파란색*/
	background-color: #dc3545; /*빨간색*/
	color: white;
	border: none;
}

.login-button:hover {
	width: 100%;
	height: 35px;
	padding: 5px 20px;
	border-radius: 20px;
	font-size: 12px;
	background-color: #28a745; /*녹색*/
	background-color: #007bff; /*파란색*/
	background-color: #dc3545; /*빨간색*/
	color: white;
	border: none;
	filter: brightness(80%);
}

.find-id-pw-box {
	position: absolute;
	top: 85%;
	left: 30%;
}

.find-id-pw {
	text-decoration: none;
	color: white;
	font-size: 12px;
}

.find-id-pw:hover {
	text-decoration: none;
	color: white;
	font-size: 12px;
}

.host-insert-text {
	font-size: 30px;
	color: #ff8e15;
	position: absolute;
	top: 20%;
	left: 20%;
	text-align: left;
	line-height: 180%;
	z-index: 2;
	
}
</style>

<body>


	<div class="main-container">
		<div class="sub-container-left">
			<h1 class="host-insert-text">
				<span class="main-div2" style="font-size: 60px !important">tripONplan</span><br>&nbsp;&nbsp;관리시스템.
			</h1>
		</div>

		<div class="sub-container-right">
			<h1 class="host-login-text">
				어서오세요 관리자님!&nbsp;&nbsp;<br>즐거운 하루입니다 :)
			</h1>

			<form class="login-form" action="manage_login.do" method="post">
				<input class="input-id-pw" type="text" name="manage_id"
					placeholder="아이디를 입력하세요."><br> <input
					class="input-id-pw" type="password" name="manage_pw"
					placeholder="비밀번호를 입력하세요."><br>
				<br> <input class="login-button" type="submit" value="관리자 로그인"><br>
			</form>

		</div>
	</div>

	<!-- 메인 끝 -->

</body>
<%@ include file="footer.jsp"%>
</html>