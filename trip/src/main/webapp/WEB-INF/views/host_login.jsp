<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="resources/css/style.css" rel="stylesheet">

<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/my_info.css" rel="stylesheet">
<link href="resources/css/my_Reservation.css" rel="stylesheet">
<link href="resources/css/my_likes.css" rel="stylesheet">

<title>Host login</title>
<%@ include file="host_login_header.jsp"%>
</head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');
</style>

<style>
	a {
  	text-decoration: none;
  	color: white;
	}
	
	a:hover {
  	text-decoration: none;
  	color: white;
	}
	
	html, body{
	background-color:white;
	}
	
	*{
		margin:0;
		padding:0;
		font-color:#19558c;
	}
	

	
	.main-container{
		width:100%;
		height:600px;
	}
	.sub-container-left{
		width:50%;
		height:600px;
		float:left;
		position: relative;
	}
	.sub-container-left::after {
		width:100%;
		height:600px;
		content:"";
		background:url("resources/img/tobehost.gif");
		background-size:cover;
		filter: brightness(50%);
		position: absolute;
		top:0;
		left:0;
		z-index: 1;
	}
	.sub-container-right{
		width:50%;
		height:600px;
		float:right;
		background: linear-gradient(
			to right,
			rgba(20, 20, 20, 0) 10%,
			rgba(20, 20, 20, 0.1) 25%,
			rgba(20, 20, 20, 0.15) 50%,
			rgba(20, 20, 20, 0.2) 75%,
			rgba(20, 20, 20, 0.3) 100%
		), url(resources/img/view_960_720.jpg);
		background-size:cover;
		position: relative;
	}
	.host-insert-text{
		font-size: 30px;
		color: white;
		position: absolute;
		top: 20%;
		left: 20%;
		text-align: left;
		line-height: 180%;
		z-index: 2;
	}
	.host-insert-button{
		width:40%;
		min-width:153px;
		max-width:300px;
		height:40px;
		position: absolute;
		top:70%;
		left:50%;
		transform: translate(-50%, -50%);
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#dc3545; /*빨간색*/
		background-color:#007bff; /*파란색*/
		background-color:#ff8e15; /*주황색*/
		background:linear-gradient(to right, #ff8e15, #dc3545, #dc3545);
		color:white;
		border:none;
		font-weight:bold;
		z-index: 2;
	}
	.host-insert-button:hover{
		width:40%;
		height:40px;
		position: absolute;
		top:70%;
		left:50%;
		transform: translate(-50%, -50%);
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#dc3545; /*빨간색*/
		background-color:#007bff; /*파란색*/
		background-color:#ff8e15; /*주황색*/
		color:white;
		border:none;
		font-weight:bold;
		filter: brightness(80%);
		cursor : pointer;
	}
		.back-to-index{
		font-size: 12px;
		color: white !important;
		position: absolute;
		top: 5%;
		right: 5%;
		text-align: right;
		line-height: 180%;
		z-index: 2;
		text-decoration: none;
		
	}
		.back-to-index:hover{
		color: white !important;
		text-decoration: none  !important;
		}
		.back-to-index:link { color: white; text-decoration: none;}
 		.back-to-index:visited { color: white; text-decoration: none;}
 		.back-to-index:hover { color: white; text-decoration: none;}
 		
		.host-login-text{
		font-size: 30px;
		color: white;
		position: absolute;
		top: 20%;
		right: 20%;
		text-align: right;
		line-height: 180%;
		z-index: 2;
	}
	
	.login-form{
		width:60%;
		position:absolute;
		top:70%;
		left:50%;
		transform:translate(-50%, -50%);
		text-align:center;
	}
	.input-id-pw{
		width:100%;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
	}
	.input-id-pw:focus{
		width:100%;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		outline:none;
	}
	.login-button{
		width:100%;
		height: 35px;
		padding: 5px 20px;
		border-radius: 20px;
		font-size:12px;
		background-color:#28a745; /*녹색*/
		background-color:#007bff; /*파란색*/
		background-color:#dc3545; /*빨간색*/
		color:white;
		border:none;
	}
	.login-button:hover{
		width:100%;
		height:35px;
		padding:5px 20px;
		border-radius:20px;
		font-size:12px;
		background-color:#28a745; /*녹색*/
		background-color:#007bff; /*파란색*/
		background-color:#dc3545; /*빨간색*/
		color:white;
		border:none;
		filter: brightness(80%);
		cursor : pointer;
	}
	.find-id-pw-box{
		position:absolute;
		top:85%;
		left:30%;
	}
	.find-id-pw{
		text-decoration:none;
		color:white;
		font-size:12px;
	}
	.find-id-pw:hover{
		text-decoration:none;
		color:white;
		font-size:12px;
	}
	.pride{
		/*white, lightCyan, skyBlue, deepSkyBlue*/
		background: #f9fcff;
		color:#19558c;
		font-size:25px;
		padding:30px;	
	}
	.recent30, .count_host, .count_room, .count_money, .count_rank_room_avg_income, .count_best_host_income{
		color:#DC3545;
		font-size:35px;
	}
	
	/*아래로 버튼 깜빡임 애니메이션*/
	.blinking{
		animation:blink 0.8s ease-in-out infinite alternate;
	}
	@keyframes blink{
		0%{
			opacity:0.2;
			}
		100%{
			opacity:0.9;
			}
	}
	
	.contents-box-cap{
		min-height: 35px;
		width:100%;
		background: #19558c;
		border-radius: 20px 20px 0px 0px;
	}
	
	.contents-box{
		min-height:250px;
		padding:30px;
		background: #f9fcff;
		color:#19558c;
		font-size:25px;
		padding:30px;	
		position:relative;
	}
	
	.contents-box2{
		width:100%;
		height:700px;
		position: relative;
;
	}
	.contents-box2::after {
		background:url("resources/img/your-turn.jpg");
		background-size:cover;
		width:100%;
		height:700px;
		content:"";
		filter: brightness(50%);
		z-index: 1;
		top:0;
		left:0;
		position:absolute;
	}
	
	html{
		scroll-behavior:smooth;
	}
	
</style>

<body>


<div class="main-container">
<div class="sub-container-left">
<h1 class="host-insert-text"><span class="main-div2" style="font-size:60px !important">tripONplan</span>의<br>&nbsp;&nbsp;호스트가 되어보세요.</h1>
<button class="host-insert-button" type="button" class="host" onclick="location.href='move_to_host_insert.do'">호스트 신청하기</button>
</div>
<div class="sub-container-right">
<h6 class="back-to-index"><a href="index.jsp"></a></h6>
<h1 class="host-login-text">이미 가입하셨나요?&nbsp;&nbsp;&nbsp;<br>어서오세요  :)</h1>
<form class="login-form" action="host_login.do" method="post">
<input class="input-id-pw" type="text" name="host_id" placeholder="아이디를 입력하세요."><br>
<input class="input-id-pw" type="password" name="host_pw" placeholder="비밀번호를 입력하세요."><br><br>
<input class="login-button" type="submit" value="호스트 로그인"><br>
</form>
<div class="find-id-pw-box">
<a class="find-id-pw" href="move_to_host_find_id.do">아이디 찾기</a>
<span class="find-id-pw">&nbsp;&nbsp; | &nbsp;&nbsp;</span> 
<a class="find-id-pw" href="move_to_host_find_pw.do">비밀번호 찾기</a>
</div>
</div>
</div>


<br>
<!-- div1 위치로 스크롤 -->
<script>
$(document).ready(function($) {
    $(".scroll_move").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 800);
    });
});
</script>


<!-- div1 위치 -->
<div id="div1"></div>

<div style="position:relative;">
<div class="image blinking";><br>
<a href="#div1" class="a" id="scroll_move" style="position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="#DC3545" class="bi bi-arrow-down-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg></a> 
</div>
</div>
<br>



<!-- 홍보 영역 -->
<div class="pride">
<b style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
  <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
  <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
  <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
</svg> 안정적인 수입이 발생합니다.</b><br>


최근 <span class="recent30">10일</span>간 
활동중인 호스트 <span class="count_host"></span>명의
평균 수입은 <span class="count_money"></span>원(₩) 입니다.
</div>
<br>
<div class="pride">
<b style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
  <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2h.5a.5.5 0 0 1 .5.5V15h-1V2zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
</svg> 누구에게나 열려 있습니다.</b><br>
<span class="recent30">민박</span>부터 <span class="recent30">호텔</span>까지, 종류와 관계없이 신청할 수 있습니다.
</div>


<div class="pride">
<b style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-sunglasses" viewBox="0 0 16 16">
  <path d="M4.968 9.75a.5.5 0 1 0-.866.5A4.498 4.498 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.498 3.498 0 0 1 8 11.5a3.498 3.498 0 0 1-3.032-1.75zM7 5.116V5a1 1 0 0 0-1-1H3.28a1 1 0 0 0-.97 1.243l.311 1.242A2 2 0 0 0 4.561 8H5a2 2 0 0 0 1.994-1.839A2.99 2.99 0 0 1 8 6c.393 0 .74.064 1.006.161A2 2 0 0 0 11 8h.438a2 2 0 0 0 1.94-1.515l.311-1.242A1 1 0 0 0 12.72 4H10a1 1 0 0 0-1 1v.116A4.22 4.22 0 0 0 8 5c-.35 0-.69.04-1 .116z"/>
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-1 0A7 7 0 1 0 1 8a7 7 0 0 0 14 0z"/>
</svg> 운이 좋다면, 많이 벌 수도 있습니다.</b><br>
최근 <span class="recent30">10일간</span>
가장 높은 호스트의 수입은 <span class="count_best_host_income"></span>원(₩) 입니다.</div>

<br>

<div class="pride">
<b style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-moon-stars-fill" viewBox="0 0 16 16">
  <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
  <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
</svg> 자면서도 예약을 받을 수 있습니다.</b><br>
더 이상 <span class="recent30">전화로 일일히</span> 손님을 응대하지 않아도 됩니다. </div>

<br>

<div class="pride">
<b style="color:black;"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-hearts" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"/>
</svg> 활발한 교류가 있습니다. </b><br>
최근 10일간 <span class="count_room"></span>건의 예약이 성사되었습니다.
</div>
<br>


<!-- 최근 30일 베스트 숙소 평균 수입(롤링) -->
<div class="contents-box-cap"></div>
<div class="contents-box">
<span class="recent30">(공사중, 후순위) 숙소들 가격+이미지 불러와 캐러셀</span>
<br>이 숙소들의 수입 평균은 <span class="count_rank_room_avg_income"></span>원(₩) 입니다.</div>


<!-- 이제 당신 차례입니다. -->
<div class="contents-box-cap"></div>
<div class="contents-box2">
<div class="host-insert-text">
이제 <span class="recent30"><b>당신</b> </span> 차례입니다.
<br><span class="main-div2" style="font-size:30px !important">tripONplan</span>에 합류해,<br> 다양한 사람들을 맞이해보세요.</div>
<br>
<button class="host-insert-button" type="button" class="host" onclick="location.href='move_to_host_insert.do'">호스트 신청하기</a>

</div>

<% %>
<script>
//호스트 숫자
const counter_host = ($counter_host, max_host) => {
let now_host = max_host;
	  const handle_host = setInterval(() => {
	    $counter_host.innerHTML = Math.ceil(max_host - now_host).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    if (now_host < 1) {
	      clearInterval(handle_host);// 목표수치에 도달하면 정지
	    }
	    const step_host = now_host / 10; // 증가되는 값이 계속하여 작아짐
	    now_host -= step_host; // 값을 적용시키면서 다음 차례에 영향을 끼침
	  }, 50);
	}
	$(document).ready(function() {
	  const $counter_host = document.querySelector(".count_host"); // 카운트 출력 요소
	  const max_host = 154;// 목표 수치	  
	  setTimeout(() => counter_host($counter_host, max_host), 750);
	});

//숙소 숫자
var counter_room = ($counter_room, max_room) => {
	  let now_room = max_room;
	  var handle_room = setInterval(() => {
	    $counter_room.innerHTML = Math.ceil(max_room - now_room).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    if (now_room < 1) {
	      clearInterval(handle_room);// 목표수치에 도달하면 정지
	    }
	    var step_room = now_room / 10; // 증가되는 값이 계속하여 작아짐
	    now_room -= step_room; // 값을 적용시키면서 다음 차례에 영향을 끼침
	  }, 50);
	}
	$(document).ready(function() {
	  var $counter_room = document.querySelector(".count_room"); // 카운트 출력 요소
	  var max_room = 1249;// 목표 수치	  
	  setTimeout(() => counter_room($counter_room, max_room), 1250);
	});

//숙소당 평균 매출액 (만원 단위) HERE
var counter = ($counter, max) => {
	let now = max;
		var handle = setInterval(() => {
		$counter.innerHTML = Math.ceil(max - now).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if (now < 1) {
		      clearInterval(handle);// 목표수치에 도달하면 정지
		    }
		var step = now / 10; // 증가되는 값이 계속하여 작아짐
		    now -= step; // 값을 적용시키면서 다음 차례에 영향을 끼침
		  }, 50);
		}
		$(document).ready(function() {
		  var $counter = document.querySelector(".count_money"); // 카운트 출력 요소
		  var max = 3218000;// 목표 수치	  
		  setTimeout(() => counter($counter, max), 1700);
		});



//최근 30일 가장 많은 돈을 번 호스트 수입
const counter_best_income = ($counter_best_income, max_best_income) => {
	let now_best_income = max_best_income;
	const handle_best_income = setInterval(() => {
		$counter_best_income.innerHTML = Math.ceil(max_best_income - now_best_income).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		if (now_best_income < 1) {
			clearInterval(handle_best_income);// 목표수치에 도달하면 정지
		}
		const step_best_income = now_best_income / 10; // 증가되는 값이 계속하여 작아짐
		now_best_income -= step_best_income; // 값을 적용시키면서 다음 차례에 영향을 끼침
	}, 50);
}
	$(document).ready(function() {
		  const $counter_best_income = document.querySelector(".count_best_host_income"); // 카운트 출력 요소
		  const max_best_income = 7495000;// 목표 수치	  
		  setTimeout(() => counter_best_income($counter_best_income, max_best_income), 1250);
		});
		
//상위 랭크 숙소의 평균 수입
const counter_rank_room_avg_income = ($counter_rank_room_avg_income, max_rank_room_avg_income) => {
	let now_rank_room_avg_income = max_rank_room_avg_income;
	const handle_rank_room_avg_income = setInterval(() => {
	$counter_rank_room_avg_income.innerHTML = Math.ceil(max_rank_room_avg_income - now_rank_room_avg_income).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	if (now_rank_room_avg_income < 1) {
		clearInterval(handle_rank_room_avg_income);// 목표수치에 도달하면 정지
	}
	const step_rank_room_avg_income = now_rank_room_avg_income / 10; // 증가되는 값이 계속하여 작아짐
	now_rank_room_avg_income -= step_rank_room_avg_income; // 값을 적용시키면서 다음 차례에 영향을 끼침
	}, 50);
}
$(document).ready(function() {
	const $counter_rank_room_avg_income = document.querySelector(".count_rank_room_avg_income"); // 카운트 출력 요소
	const max_rank_room_avg_income = 4350000;// 목표 수치	  
	setTimeout(() => counter_rank_room_avg_income($counter_rank_room_avg_income, max_rank_room_avg_income), 1250);
});




 
</script>



</body>
</html>