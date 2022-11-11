<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>main</title>
<%@ include file="header.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');

span.material-symbols-outlined {
	color: white;
	font-size: 50px;
}

button.main-icon-div1:hover span:nth-child(1) {
    display: none;
}
button.main-icon-div1:hover span:nth-child(2) {
    display: block;
}

</style>
<!-- 집아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body class="main-body">
<br><br><br>
     <div class="container main-top-div"> 
     <div class="main-div1">숙소 예매와 플레너 작성을 한번에</div>
     <div class="main-div2">tripONplan</div><br>
     </div> <br>
 <div class="container-fluid main-img-div">
<img style="width: 82%; float: left;" src="resources/img/mainimg.png">
<div class="container-fluid main-iconfull-div"style="position:absolute;">

<button class="main-icon-div1" onclick="location.href='u_getRoomList.do'">
<span class="material-symbols-outlined">home_work</span>
<span class="main-icon-span1">숙소<br>예약하기</span>
</button><br>
<button class="main-icon-div2" onclick="location.href='plannerlist.do?page=Y'">플래너(보기)</button><br>
<button class="main-icon-div3" onclick="location.href='start.do'">플래너(쓰기)</button>
</div>
</div>
</body>
</html>
