<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="header.jsp"%>
<title>main</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
button.main-icon-div1:hover span:nth-child(1) {
    display: none;
}
button.main-icon-div1:hover span:nth-child(2) {
    display: block;
  
}
button.main-icon-div2:hover span:nth-child(1) {
    display: none;
}
button.main-icon-div2:hover span:nth-child(2) {
    display: block;
  
}
button.main-icon-div3:hover span:nth-child(1) {
    display: none;
}
button.main-icon-div3:hover span:nth-child(2) {
    display: block;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
</style>
<!-- 집아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body class="main-body">
<div class="footer-div">

     <div class="container main-top-div"> 
    <div class="main-div1" style="font-family: 'Pretendard-Regular'">숙소 예매와 </div> <div class="main-div1" style="font-family: 'Pretendard-Regular'">플래너 작성을 한번에</div>
     <div class="main-div2">tripONplan</div><br>
     </div> <br>
 <div class="container-fluid main-img-div">
 <div class="img-wrapper">
<img style="float: left;" src="resources/img/mainimg.png">
</div>
<div class="container-fluid main-iconfull-div" style="position:absolute;">

<button class="main-icon-div1" onclick="location.href='u_getRoomList.do'">
<span class="material-symbols-outlined" style="color: white; font-size: 50px;">home_work</span>
<span class="main-icon-span1">숙소<br>예약하기</span>
</button><br>
<button class="main-icon-div2" onclick="location.href='plannerlist.do?page=Y'">
<span class="material-symbols-outlined" style="color: white; font-size: 50px;">event_note</span>
<span class="main-icon-span1">플래너<br>보기</span>
</button><br>
<button class="main-icon-div3" onclick="location.href='start.do'">
<span class="material-symbols-outlined" style="color: white; font-size: 50px;">edit_calendar</span>
<span class="main-icon-span1">일정<br>만들기</span>
</button>
</div>
</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
