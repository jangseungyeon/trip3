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

<title>Host login</title>
</head>

<style>
	*{
		margin:0;
		padding:0;
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
		background:linear-gradient(to right, #ff8e15, #dc3545);
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
		font-size: 15px;
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
		background: liner-gradient(
			70deg,
			white, 35%, lightCyan, skyBlue, deepSkyBlue);
		);
		color:black;
		font-size:30px;
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
	
	.contents-box{
		min-height:250px;
		margin:30px;
		padding:30px;
		color:black;
		font-size:30px;
		padding:30px;	
		border-style:solid;
		border-color:#6c757d;
		position:relative;
	}
	html{
		scroll-behavior:smooth;
	}
	
</style>

<body>


<div class="main-container">
<div class="sub-container-left">
<h1 class="host-insert-text">tripONplan에서<br>&nbsp;&nbsp;호스트로 활동하세요.</h1>
<button class="host-insert-button" type="button" class="host" onclick="location.href='move_to_host_insert.do'">호스트 신청하기</a>
</div>
<div class="sub-container-right">
<h6 class="back-to-index"><a href="index.jsp" style="color:#ff8e15;">go to tripONplan</a></h6>
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

<!-- 홍보 영역 -->
<div class="pride">
Trip에서 <span class="recent30">최근 30일</span> 기간동안<br>
<span class="count_host"></span>
명의 호스트가 
<span class="count_room"></span>
개의 숙소를 통해 평균
<span class="count_money"></span>
원(₩)의 수입을 얻었습니다.
</div>

<!-- div1 위치로 스크롤 -->
<script>
$(document).ready(function($) {
    $(".scroll_move").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 800);
    });
});
</script>




<div style="position:relative;">
<div class="image blinking";><br>
<a href="#div1" class="a" id="scroll_move" style="position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);"><svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="#DC3545" class="bi bi-arrow-down-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
</svg></a> 
</div>
</div>

<!-- div1 위치 -->
<div id="div1"></div>


<!-- 최근 30일 호스트 최고 수익 -->
<div class="contents-box">
그리고 <span class="recent30">최근 30일간</span>
<br>가장 많은 돈을 번 호스트의 단독 수입은 <span class="count_best_host_income"></span>원(₩) 입니다.</div>

<!-- 최근 30일 베스트 숙소 평균 수입(롤링) -->
<div class="contents-box">
아울러 <span class="recent30">최근 30일간</span>
<br>상위에 랭크된 숙소들은 아래와 같으며,
<br>
<br>◀ ====== 케러셀 ====== ▶
<br>
<br>이 숙소들 수입 평균은 <span class="count_rank_room_avg_income"></span>원(₩) 입니다.</div>

<!-- 이제 당신 차례입니다. -->
<div class="contents-box">
이제 <span class="recent30">당신 </span> 차례입니다.
<br>Trip에 합류해 숙소를 등록하고, 돈을 벌어보세요.
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