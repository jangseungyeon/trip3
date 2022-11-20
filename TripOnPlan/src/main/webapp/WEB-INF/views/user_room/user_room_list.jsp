<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springbook.biz.room.RoomVO" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소리스트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<% ArrayList<RoomVO> u = (ArrayList<RoomVO>)request.getAttribute("u_roomList"); %>
<script>

var page = 2;
var count = 10;

$(window).scroll(function(){
	 var scroll = $(window).scrollTop();
	 var filter = "win16|win32|win64|macintel|mac|"; // PC일 경우 가능한 값
	 if( navigator.platform){
	 	if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
	 		scroll = Number(scroll) + 149 
	 	} }
	 
	 if($(window).scrollTop()  >= $(document).height() - $(window).height()){
			var f = (count * page) - (count * (page-1) +1);
			var m = count * (page-1) +1;
			if($(".roomCardAllDiv").length > count * (page-1) +1){
				$("#spinner").css("display" , "block");
				 setTimeout(function() {
					 $("#spinner").css("display" , "none")
					 for(var i = 0; i <= f; i++){
						 $("#roomCardAllDiv" + m ).css("display" , "block");
						 m += 1;
					 }
					}, 1000);	
			}
			page +=  1;
			}
	 
	});


	function f_getRoom(room_id) {
		
		location.href="u_getRoom.do?room_id=" + room_id;
	}
	
	$(function(){
		
		<% for(int i = 0; i < u.size(); i++) { %>
		
		var roomCardAmount = $("#roomCardAmount<%=i%>").text();
		
		roomCardAmount = roomCardAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$("#roomCardAmount<%=i%>").text(roomCardAmount + "원");
		
		<% } %>
		
		<% String room_area = request.getParameter("room_area");
		
		if(room_area != null) { %>
		
		$("#room_area").val(room_area);
		
		<% } %>
		
		<% String moveCards = (String) request.getAttribute("moveCards");
		
		String moveNone = (String) request.getAttribute("moveNone");
		
		if(moveCards != null) {
			
			if(moveCards.equals("Y")){ %>
				
				var cardLocation = document.querySelector("#roomCards").offsetTop - 120;
				
				window.scrollTo({top:cardLocation});
				
			<% } } %>
			
			<% if(moveNone != null) {
				
				if(moveNone.equals("Y")){ %>
				
				
				let currentHeight = 0; // 이것 함수 안에 있으면 제대로 작동 안함!!
				var scrollInterval = setInterval(function() {
				  let pageBottom = document.documentElement.scrollHeight;
				  if(currentHeight < pageBottom) {
				    document.documentElement.scrollTop = document.documentElement.scrollHeight;
				    currentHeight = pageBottom;
				    console.log(`스크롤 중 현재 바닥 위치 : ${currentHeight}`);
				  } else {
				    clearInterval(scrollInterval);
				    console.log(`스크롤을 끝냈습니다. currentHeight 값 ${currentHeight}, pageBottom 값 ${pageBottom}`)
				  }
				}, 100);
					
			<% }  } %>
		
		$("#room_area").val("${rvo.room_area}");
		$("#room_cat").val("${rvo.room_cat}");
		$("#room_min_price").val("${rvo.room_min_price}");
		$("#room_max_price").val("${rvo.room_max_price}");
		
		var room_themes = '${rvo.room_theme}';
		
		if(room_themes.includes(",")){
			
			var room_themes_arr = room_themes.split(",");
			
			for (var i = 0; i < room_themes_arr.length; i++) {
				
				if (room_themes_arr[i] == 'mountain') {
					
					$("#room_theme_mountain").prop("checked", true);
				}

				if (room_themes_arr[i] == 'sea') {
					$("#room_theme_sea").prop("checked", true);
				}

				if (room_themes_arr[i] == "forest") {
					$("#room_theme_forest").prop("checked", true);
				}

				if (room_themes_arr[i] == "valley") {
					$("#room_theme_valley").prop("checked", true);
				}

				if (room_themes_arr[i] == "river") {
					$("#room_theme_river").prop("checked", true);
				}

				if (room_themes_arr[i] == "city") {
					$("#room_theme_city").prop("checked", true);
				}
			}
			
		} else {
			
			var room_theme = '${rvo.room_theme}';
			
			if (room_theme == 'mountain') {
				$("#room_theme_mountain").prop("checked", true);
			}

			if (room_theme == 'sea') {
				$("#room_theme_sea").prop("checked", true);
			}

			if (room_theme == "forest") {
				$("#room_theme_forest").prop("checked", true);
			}

			if (room_theme == "valley") {
				$("#room_theme_valley").prop("checked", true);
			}

			if (room_theme == "river") {
				$("#room_theme_river").prop("checked", true);
			}

			if (room_theme == "city") {
				$("#room_theme_city").prop("checked", true);
			}
			
		}
		
		var room_conditions_wifi = '${rvo.room_wifi}';
		
		var room_conditions_pet = '${rvo.room_pet}';
		
		var room_conditions_meal = '${rvo.room_meal}';
		
		var room_conditions_parking = '${rvo.room_parking}';
		
		var room_conditions_swpool = '${rvo.room_swpool}';
		
		if(room_conditions_wifi == "Y") {
			$("#room_wifi").prop("checked", true);
		}
		
		if(room_conditions_pet == "Y") {
			$("#room_pet").prop("checked", true);
		}
		
		if(room_conditions_meal == "Y") {
			$("#room_meal").prop("checked", true);
		}
		
		if(room_conditions_parking == "Y") {
			$("#room_parking").prop("checked", true);
		}
		
		if(room_conditions_swpool == "Y") {
			$("#room_swpool").prop("checked", true);
		}
	});

</script>

<style>

@media (min-width: 1450px) {

.wrap {
	margin: 0 auto;
}

.searchRoomfrmDiv {
	margin: 0 auto;
	background-color: #19558c;
	padding-bottom: 40px;
}

#u_roomListTitle {
	padding-top: 50px;
	color: #ff8e15;
	font-weight: 600;
} 

form {
	width: 95vw;
	margin: 1.5vh auto;
	color: #fff;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv label {
	font-size: 1.1rem;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv {
	text-align: center;
	margin-left: 2vw;
	margin-right: 2vw;
}

::placeholder {
	text-align: center;
}

.roomBasicCheck {
	width: 60vw;
	height: 35vh;
	margin-top: 0;
	margin-bottom: 1.5vh;
	margin-left: auto;
	margin-right: auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
	background-color: #ff8e15;
	border-radius: 15px;
	font-weight: 700;
}

.roomListIptAll {
	display: flex;
	flex-direction: row;
	align-items: flex-end;
}

.roomBasicCheck select, input {
	border-radius: 15px;
	margin-bottom: 10px;
    border: 1px solid #aaa;
    text-align: center;
}

#roomCheckBoxesTitle {
	margin-bottom: 10px;
	margin-right: 10px;
	font-size: 1.2rem;
	font-weight: 700;
}  

input[type="checkbox"] {
	appearance: none;
	position: relative;
	width: 16px;
	height: 16px;
	cursor: pointer;
	outline: none !important;
	border: 1px solid #eeeeee;
	border-radius: 2px;
	background: #fbfbfb;
}
 
input[type="checkbox"]::before {
	content: "\2713";
	position: absolute;
	top: 50%;
	left: 50%;
	overflow: hidden;
	transform: scale(0) translate(-50%, -50%);
 	line-height: 1;
}
 
    input[type="checkbox"]:hover {
	border-color: rgba(170, 170, 170, 0.5);
}
 
    input[type="checkbox"]:checked {
	background-color: #19558c;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}
 
    input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

.roomThemeDiv {

display:flex;

width: 45vw;

flex-direction: row;

align-items: center;

margin-top: 1vh;

justify-content: space-evenly;

}

.roomConditionDiv {

display:flex;

width: 50vw;

margin-top: 1vh;

align-items: center;

flex-direction: row;

justify-content: space-evenly;
	
}

.roomThemeDiv input {
	
	vertical-align: bottom;
	
	margin-bottom: 13px;
}

.roomConditionDiv input {

	vertical-align: bottom;
	
	margin-bottom: 13px;
}

#roomSearchBtn {
	background-color: #ff8e15;
	color: white;
	border: 1px solid #ff8e15;
	border-radius: 7px;
	width: 100px;
	height: 40px;
	font-weight: bold;
}

#roomSearchBtn:hover {
    background-color: #ff9a2d;
    color: white;
}

.uRoomListDiv {
	margin-left: 5vw;
	margin-right: 5vw;
	display: flex;
	flex-direction: column;
	margin-top: 30px;
}

#roomListImgDiv {
	text-align: center;
	position: relative;
	height:205px;
}

#roomListImgDiv img {
	position: absolute;
	border-radius: 15px;
	top:50%;
	left:50%;
	width: 95%;
	height: 90%;
	margin-left: 5px;
	transform: translate(-50%, -50%);
}

#moveTopBtn {
	margin-left: 95%; 
	text-align: right; 
	width: 70px; 
	position:fixed; 
	bottom: 0;
	z-index: 100;
}

select {
	width: 205px;
}

#roomCardBody {
	display: flex;
	flex-direction: row;
	margin-right: 10px;
	align-items: center;
	height: 100%;
}

#roomCardNameStarsLikes {
	width: 50%;
}

#roomCardsConditionOutDiv {
	display: flex;
	flex-direction: row;
	margin-left: 20px;
	margin-right: 20px;
	width: 40%;
	text-align: center;
	align-items: center;
}

#roomCardsConditionOutDiv div {
	margin-bottom: 10px;
}

#roomCardsConditionInDiv {
	display: flex;
	flex-direction: column;
	margin-left: 30px;
	margin-right: 30px;
	text-align: center; 
	width: 50%;
}

#roomCardsConditionInDiv div {
	margin-left: 6px;
	margin-right: 6px;
}

#roomCardsPriceDiv {
	width: 20%;
	text-align: center;
}

.roomCardAllDiv {
	background-color: #f9fcff;
	border: 1px solid #aaa;
	height: 265px;
	cursor: pointer;
}

#roomCardsPriceDiv div {

	margin-bottom: 10px;
}

#roomCardsDesc {
	font-weight: 600;
}


}

@media (max-width: 1450px) {
	.wrap {
	margin: 0 auto;
	word-break: keep-all;
	position: relative;
}

.searchRoomfrmDiv {
	text-align: center;
	margin: 0 auto;
	background-color: #19558c;
	padding-bottom: 40px;
}

#u_roomListTitle {
	word-break: keep-all;
	padding-top: 50px;
	color: #ff8e15;
	font-weight: 600;
} 

form {
	width: 95vw;
	margin: 1.5vh auto;
	color: #fff;
}

.roomListAreaCatDiv  label , .roomListAmountDiv  label , .roomListNameMaxDiv  label , .roomThemeDiv  label , .roomConditionDiv  label {
	font-size: 1.1rem;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv, .roomThemeDiv, .roomConditionDiv {
	margin-left: 2vw;
	margin-right: 2vw;
	text-align: center;
}

::placeholder {
	text-align: center;
}

.roomBasicCheck {
	height: 100%;
	margin: 10px auto;
	width: 72vw;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
	background-color: #ff8e15;
	border-radius: 15px;
	font-weight: 700;
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 3px;
	padding-right: 3px;
}

.roomBasicCheck select, input {
	width: 100%;
	border-radius: 15px;
    border: 1px solid #aaa;
    text-align: center;
}

#roomCheckBoxesTitle {
	margin-bottom: 10px;
	margin-right: 10px;
	font-size: 1.2rem;
	font-weight: 700;
}  

input[type="checkbox"] {
	appearance: none;
	position: relative;
	width: 16px;
	height: 16px;
	cursor: pointer;
	outline: none !important;
	border: 1px solid #eeeeee;
	border-radius: 2px;
	background: #fbfbfb;
}
 
input[type="checkbox"]::before {
	content: "\2713";
	position: absolute;
	top: 50%;
	left: 50%;
	overflow: hidden;
	transform: scale(0) translate(-50%, -50%);
 	line-height: 1;
}
 
    input[type="checkbox"]:hover {
	border-color: rgba(170, 170, 170, 0.5);
}
 
    input[type="checkbox"]:checked {
	background-color: #19558c;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}
 
    input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

.roomThemeDiv {

display:flex;

width: 30vw;

flex-direction: row;

flex-wrap: wrap;

align-items: center;

margin-top: 1vh;

justify-content: space-evenly;

}

.roomConditionDiv {

display:flex;

width: 50vw;

margin-top: 1vh;

flex-wrap: wrap;

align-items: center;

flex-direction: row;

justify-content: space-evenly;
	
}

.roomThemeDiv input {
	
	vertical-align: bottom;
	
	margin-bottom: 13px;
}

.roomConditionDiv input {

	vertical-align: bottom;
	
	margin-bottom: 13px;
}

#roomSearchBtn {
	margin-top: 60px;
	background-color: #ff8e15;
	color: white;
	border: 1px solid #ff8e15;
	border-radius: 7px;
	width: 100px;
	height: 40px;
	font-weight: bold;
}

#roomSearchBtn:hover {
    background-color: #ff9a2d;
    color: white;
}

.uRoomListDiv {
	margin-left: 5vw;
	margin-right: 5vw;
	display: flex;
	flex-direction: column;
	margin-top: 30px;
}

#roomListImgDiv {
	text-align: center;
	position: relative;
	height:200px;
}

#roomListImgDiv img {
	position: absolute;
	border-radius: 15px;
	top:50%;
	left:50%;
	width: 85%;
	height: 95%;
	transform: translate(-50%, -50%);
}

span.material-symbols-outlined.upward {
	color: white;
	font-size: 44px;
	
}

#moveTopBtn {
	width: 80px;
	text-align: right;
	position:fixed; 
	bottom: 0; 
	z-index: 100;
	left:0;
}

#roomCardBody {
	text-align: center;
}

#roomCardBody div {
	margin-top: 10px;
}

#roomCardsDesc {
	font-weight: 600;
}

.roomCardAllDiv {
	background-color: #f9fcff;
	border: 1px solid #aaa;
}

}

button.main-icon-div1:hover span:nth-child(1) {
    display: none;
}
button.main-icon-div1:hover span:nth-child(2) {
    display: block;
}

.main-icon-span1 {
	font-weight: 700;
}

.main-icon-div1 {
	margin: 10px;
	width: 64px;
	height: 64px;
}

.stars {
	font-size: 2rem;
	color: yellow;
}

</style>

</head>
<body id="top">

<div class="wrap">

<div id="moveTopBtn">
	<a href="#top">
	<button class="main-icon-div1">
	<span class="material-symbols-outlined upward">arrow_upward</span>
	<span class="main-icon-span1">위로<br>아동</span>
	</button>
	</a>
</div>

	<div class="searchRoomfrmDiv">
	
		<h1 id="u_roomListTitle" style="text-align: center;">여행, 떠나세요? 어디로 가실 예정이신가요?</h1>
		<br>
		
		<form name="searchRoomfrm" action="u_searchRoomList.do" method="get" id="u_searchfrm">
			
			<div class="roomBasicCheck">
				
				<div class="roomListIptAll">
			
			<div class="roomListAreaCatDiv">
			<label for="room_area">지역</label><br>
			<select name="room_area" id="room_area">
				<option value="">전국</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="충북">충북</option>
				<option value="충남">충남</option>
				<option value="경북">경북</option>
				<option value="경남">경남</option>
				<option value="부산">부산</option>
				<option value="광주">광주</option>
				<option value="대전">대전</option>
				<option value="울산">울산</option>
				<option value="대구">대구</option>
				<option value="전북">전북</option>
				<option value="전남">전남</option>
				<option value="강원">강원</option>
				<option value="세종특별자치시">세종특별자치시</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select>
			<br>
			<label for="room_cat">카테고리</label><br>
			<select name="room_cat" id="room_cat">
				<option value="">전체</option>
				<option value="hotel">호텔</option>
				<option value="motel">모텔</option>
				<option value="guestHouse">게스트하우스</option>
				<option value="minbak">민박</option>
				<option value="pension">펜션</option>
			</select>
			</div>
			
			<div class="roomListAmountDiv">
			
			<label for="room_min_price">최소금액</label><br>
			<select name="room_min_price" id="room_min_price">
			<option value="" selected>제한 없음</option>
			<option value="30000">3만원</option>
			<option value="40000">4만원</option>
			<option value="50000">5만원</option>
			<option value="60000">6만원</option>
			<option value="70000">7만원</option>
			<option value="80000">8만원</option>
			<option value="90000">9만원</option>
			<option value="100000">10만원</option>
			<option value="150000">15만원</option>
			<option value="200000">20만원</option>
			<option value="250000">25만원</option>
			<option value="300000">30만원</option>
			<option value="350000">35만원</option>
			<option value="400000">40만원</option>
			<option value="450000">45만원</option>
			<option value="500000">50만원</option>
			</select>
			<br>
			<label for="room_max_price">최대금액</label><br>
			<select name="room_max_price" id="room_max_price">
			<option value="" selected>제한 없음</option>
			<option value="30000">3만원</option>
			<option value="40000">4만원</option>
			<option value="50000" >5만원</option>
			<option value="60000">6만원</option>
			<option value="70000">7만원</option>
			<option value="80000">8만원</option>
			<option value="90000">9만원</option>
			<option value="100000">10만원</option>
			<option value="150000">15만원</option>
			<option value="200000">20만원</option>
			<option value="250000">25만원</option>
			<option value="300000">30만원</option>
			<option value="350000">35만원</option>
			<option value="400000">40만원</option>
			<option value="450000">45만원</option>
			<option value="500000">50만원</option>
			</select>
			</div>
			
			<div class="roomListNameMaxDiv">
			<label for="room_name">숙소 이름</label><br>
			<input id="room_name" class="search_room" type="text" placeholder="숙소 이름 검색" name="room_name" value="${rvo.room_name}">
			<br>
			<label for="room_max">숙소 최대 수용가능 인원</label><br>
			<input type="text" name="room_max" id="room_max" placeholder="최대인원" value="${rvo.room_max}">
			</div>
			
			</div>
			
			<div class="roomThemeDiv">
			
			<div id="roomCheckBoxesTitle"><span>숙소 테마</span></div>
			
			<div>
			<input type="checkbox" name="room_theme" value="mountain" id="room_theme_mountain">
			<label for="room_theme_mountain">산</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="sea" id="room_theme_sea">
			<label for="room_theme_sea">바다</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="forest" id="room_theme_forest">
			<label for="room_theme_forest">숲</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="valley" id="room_theme_valley">
			<label for="room_theme_valley">계곡</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="river" id="room_theme_river">
			<label for="room_theme_river">강</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="city" id="room_theme_city">
			<label for="room_theme_city">도시</label>
			</div>
			
			</div>
			
			<div class="roomConditionDiv">
			
				<div id="roomCheckBoxesTitle"><span>숙소 기본 제공 조건</span></div>
				
				<div>
				<input type="checkbox" id="room_wifi" name="room_wifi" value="Y">
				<label for="room_wifi">무료 와이파이</label>
				</div>
				
				<div>
				<input type="checkbox" id="room_pet" name="room_pet" value="Y">
				<label for="room_pet">애완동물 동반</label>
				</div>
				
				<div>
				<input type="checkbox" id="room_meal" name="room_meal" value="Y">
				<label for="room_meal">조식 포함</label>
				</div>
				
				<div>
				<input type="checkbox" id="room_parking" name="room_parking" value="Y">
				<label for="room_parking">주차장 보유</label>
				</div>
				
				<div>
				<input type="checkbox" id="room_swpool" name="room_swpool" value="Y">
				<label for="room_swpool">수영장 보유</label>
				</div>
			
				</div>
				
			</div>
			
		<div style="text-align: center;">
			<button type="submit" id="roomSearchBtn">검색</button>
		</div>
		
		<input id="nowPageBtn" type="hidden" name="nowPageBtn" value="">
			
		</form>
		
	</div>
	
	<%if(u.size() != 0) { %>
	<div class="uRoomListDiv" id="roomCards">

	<c:forEach var="i" begin="0" end="${u_roomList.size()-1}" step="1" varStatus="status">
	
		<div class="roomCardAllDiv card mb-3" id="roomCardAllDiv${status.index}" onclick="f_getRoom('${u_roomList[i].room_id}')" <c:if test="${status.count >= '12'}"> style="display:none;"</c:if> >
  			<div class="row no-gutters">
	    		<div class="col-md-3" id="roomListImgDiv">
	      			<img src="resources/room_img/${u_roomList[i].room_img_no1}" alt="${u_roomList[i].room_name} 대표 이미지" title="${u_roomList[i].room_name} 대표 이미지">
	    		</div>
		    	<div class="col-md-9" style="margin-top: 10px;">
		      	<div class="card-body" id="roomCardBody">
		      	
		      		<div id="roomCardNameStarsLikes">
		      		
		      		<div>
		        	<h3 class="card-title" style="font-weight: 700;">${u_roomList[i].room_name}</h3>
		        	</div>
		        	
		        	<div>
		        	<span class="stars">★</span>
		        	&nbsp;&nbsp;
		        	<span class="card-text room_stars" style="font-weight: 600;">${u_roomList[i].room_stars}</span>
		        	&nbsp;&nbsp;&nbsp;
		        	<span style="color: red; font-size: 2rem;">♥</span>
		        	&nbsp;&nbsp;
		        	<span class="card-text room_likes" style="font-weight: 600;">${u_roomList[i].room_likes}</span>
		        	</div>
		        	
		        	<div style="margin-top: 20px; font-size: 1.2rem; font-weight: 600;">
		        	<% %>
		        		<span>${u_roomList[i].room_addr}</span>
		        	</div>
		        	
		        	</div>
		        		
		        		<div id="roomCardsConditionOutDiv">
		        	
		        		<c:if test="${u_roomList[i].room_cat eq 'hotel'}"><div> <div><div id="roomCardsDesc">숙박 유형</div> 호텔</div> <div>최대 수용인원</div> ${u_roomList[i].room_max}명</div></c:if>
		        		
		        		<c:if test="${u_roomList[i].room_cat eq 'motel'}"><div> <div><div id="roomCardsDesc">숙박 유형</div> 모텔</div> <div>최대 수용인원</div> ${u_roomList[i].room_max}명</div></c:if>
		        		
		        		<c:if test="${u_roomList[i].room_cat eq 'guestHouse'}"><div> <div><div id="roomCardsDesc">숙박 유형</div> 게스트 하우스</div> <div>최대 수용인원</div> ${u_roomList[i].room_max}명</div></c:if>
		        		
		        		<c:if test="${u_roomList[i].room_cat eq 'minbak'}"><div> <div><div id="roomCardsDesc">숙박 유형</div> 민박</div> <div>최대 수용인원</div> ${u_roomList[i].room_max}명</div></c:if>
		        		
		        		<c:if test="${u_roomList[i].room_cat eq 'pension'}"><div> <div><div id="roomCardsDesc">숙박 유형</div> 펜션</div> <div>최대 수용인원</div> ${u_roomList[i].room_max}명</div></c:if>
		        		
		        		<div id="roomCardsConditionInDiv">
		        		
		        		<div id="roomCardsDesc">숙박 기본 제공</div>
		        		
		        		<c:if test="${u_roomList[i].room_wifi eq 'Y'}">
		        		
		        		<div>
		        		
		        		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
		        		<path d="M12 2c5.514 0 10 4.486 10 10s-4.486 
		        		10-10 10-10-4.486-10-10 4.486-10 
						10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 
						12-5.373 12-12-5.373-12-12-12zm-1.894 14.992c.485-.514
						1.154-.832 1.894-.832s1.408.318 1.894.832l-1.894 
						2.008-1.894-2.008zm-.874-.927c.709-.751 1.688-1.215
						2.768-1.215s2.059.465 2.768 1.216l1.164-1.236c-1.006-1.067-2.396-1.727-3.932-1.727s-2.926.66-3.932
						 1.727l1.164 1.235zm-2.038-2.163c1.23-1.304 
						2.929-2.11 4.806-2.11s3.576.807 4.806 2.111l1.194-1.267c-1.535-1.629-3.656-2.636-6-2.636s-4.465
						 1.007-6 2.636l1.194 1.266z"/></svg>
						무료 와이파이
						
						</div>
						
						</c:if>
		        		
		        		<c:if test="${u_roomList[i].room_pet eq 'Y'}">
		        		
		        		<div>
		        		
		        		<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
		        		<path d="M14.872 17.711c-.29.54-1.002.918-1.729.918-.447 
						0-.849-.147-1.15-.416-.301.269-.704.416-1.149.416-.729
						 0-1.44-.378-1.73-.918-.309-.576.536-1.14.94-.424.102.181.432.375.761.375.692 
						 0 .631-.738.631-1.3-.423-.211-.717-.63-.717-1.006 
						0-.527.57-.762 1.271-.762s1.271.235 1.271.762c0 
						.38-.299.805-.73 1.014 0 .587-.056 1.254.599 1.254.341 0 
						.729-.208.863-.393.45-.624 1.185-.106.869.48zm.128-6.211c-.459 0-.833.374-.833.834 
						0 .459.374.833.833.833.459 0 .833-.374.833-.833 
						0-.46-.374-.834-.833-.834zm0 2.667c-1.011 0-1.833-.822-1.833-1.833 0-1.012.822-1.834 1.833-1.834 1.011 0 1.833.822 1.833 1.834 0 1.011-.822 1.833-1.833 1.833zm-6-2.667c-.46 
						0-.834.374-.834.834 0 .459.374.833.834.833.459 
						0 .833-.374.833-.833 0-.46-.374-.834-.833-.834zm0 
						2.667c-1.011 0-1.834-.822-1.834-1.833 0-1.012.823-1.834 1.834-1.834 1.011 0 1.833.822 1.833 1.834 0 1.011-.822 1.833-1.833 1.833zm12.113 
						3.986c-.78-7.61-2.462-11.289-4.568-13.869-1.21 1.055-2.044 
						1.769-3.321 3.667-.74-.121-1.769-.119-2.486.006-1.538-1.838-2.574-2.676-3.813-3.654-2.037 
						2.484-3.503 6.137-4.117 13.723-1.14-1.732-1.808-3.801-1.808-6.026 
						0-6.065 4.934-11 11-11 6.065 0 11 4.935 11 11 
						0 2.277-.696 4.396-1.887 6.153zm-9.113 4.847c-3.298 0-6.254-1.466-8.272-3.772.304-4.521 
						1.094-10.361 3.357-13.517 1.728 1.421 2.717 2.682 3.276 3.359.748-.19 
						1.823-.358 3.316.007.96-1.452 1.508-2.222 2.74-3.347 1.989 2.717 3.26 
						7.267 3.8 13.558-2.017 2.271-4.949 3.712-8.217 
						3.712zm0-23c-6.623 0-12 5.377-12 12 0 6.627 5.4 12 12 12 6.559 0 
						12-5.33 12-12 0-6.623-5.377-12-12-12z"/></svg>
		        		애완견 동반 가능
		        		
		        		</div>
		        		
		        		</c:if>

		        		<c:if test="${u_roomList[i].room_meal eq 'Y'}">
		        		
		        		<div>
		        		
		        		<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
		        		<path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm6.997 
		        		20.486c2.444-2.019 4.003-5.072 4.003-8.486 0-6.071-4.929-11-11-11s-11 4.929-11 11c0 4.27 2.439 7.975 
		        		5.998 9.798v-3.228c0-.691-.441-.917-1.384-1.673-.698-.56-1.177-1.433-1.089-2.322.252-2.537.862-7.575.862-7.575l.909.003-.597 
						5.997h1.291l.005-6h1l-.002 6h1.003l-.001-6h1l.004 6 1.34.002-.675-6.002h.887c.002.011.675 5.008.951 7.55.098.902-.409 1.792-1.121 
						2.356-.95.751-1.382.967-1.382 1.669v4.243c.649.12 1.318.182 2.001.182 1.409 0 
						2.756-.265 3.994-.749l.001-3.251h-2.467c.802-6.996 3.103-12 4.66-12 .447 0 .804.357.807.851.008 1.164.004 6.814.002 12.635zm-7.563-6.486h-5.845c-.067.642-.26 
						1.387.651 2.117.938.754 1.758 1.231 1.758 2.453v3.678c.326.128.66.24 
						1.001.337v-4.01c0-1.237.811-1.7 1.761-2.453.944-.747.75-1.464.674-2.122zm6.561 7.222l.002-13.029c-1.14 1.352-2.563 4.206-3.31 
						9.809h2.308l-.001 3.8c.345-.176.679-.37 1.001-.58z"/></svg>
						조식 포함
						
						</div>
						
		        		</c:if>
		     
		        		<c:if test="${u_roomList[i].room_parking eq 'Y'}">
		        		
		        		<div>
		        		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.688 5.176c0 .82-.603 1.109-1.423 1.109h-.509v-2.178h.704c.775 0 1.228.283 1.228 1.069zm4.312-1.884v6.417c0 1.265-1.026 2.291-2.292 2.291h-6.417c-1.265 0-2.291-1.026-2.291-2.292v-6.416c0-1.266 
						1.026-2.292 2.292-2.292h6.417c1.265 0 2.291 1.026 2.291 2.292zm-2.75 1.829c0-.759-.231-1.33-.691-1.713-.461-.383-1.134-.574-2.019-.574h-2.331v7.333h1.547v-2.609h.664c.905 0 1.603-.209 2.094-.627.49-.418.736-1.021.736-1.81zm-4.25 11.378c0 .828.672 1.5 1.5 1.5s1.5-.672 1.5-1.5-.672-1.5-1.5-1.5-1.5.671-1.5 1.5zm-8.5.501c-.276 
						0-.5.223-.5.499s.224.5.5.5h7c.276 0 .5-.224.5-.5s-.224-.499-.5-.499h-7zm-4.5-.501c0 .828.672 1.5 1.5 1.5s1.5-.672 1.5-1.5-.672-1.5-1.5-1.5-1.5.671-1.5 1.5zm-1.298-6.5h-2.202c-.276 0-.5.224-.5.5v.511c0 .793.926.989 1.616.989l1.086-2zm19.006 4.001h-1.511c.474.89.803 1.655.803 2.972 0 1.673-1.355 3.028-3.026 3.028h-11.948c-1.671 
						0-3.026-1.355-3.026-3.028 0-1.641.506-2.421 1.184-3.678 1.041.206 3.967.705 7.816.705.877 0 1.728-.029 2.532-.076-1.203-.217-2.227-.933-2.859-1.929-2.895-.023-5.237-.339-6.478-.55.382-.686.779-1.386 1.184-2.061.67-1.117.852-1.149 1.39-1.246 1.011-.181 1.984-.272 3.231-.302v-2.002c-1.382.031-2.451.132-3.585.335-1.381.248-1.965.875-2.751 
						2.187-.981 1.637-1.913 3.382-2.684 4.812-.687 1.273-.98 2.411-.98 3.805 0 1.318.42 2.415 1 3.817v2.209c0 .553.448 1.002 1 1.002h1.5c.552 0 1-.449 1-1.001v-1h13v1c0 .552.448 1.001 1 1.001h1.5c.552 0 1-.449 1-1.001v-2.209c.58-1.403 1-2.499 1-3.817 0-1.109-.196-2.058-.618-3.041-.221.035-.443.068-.674.068z"/></svg>
						주차장 보유
						</div>
						
						</c:if>
		        
		        		<c:if test="${u_roomList[i].room_swpool eq 'Y'}">
		        		
		        		<div>
		        		
		        		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 13c.5.5 2.13-.112 3.262-.5c1.46-.5 3.238 0 
						2.738-.5l-2-2s-4.5 2.5-4 3Zm-9 7c2 0 3-1 5-1s3 1 5 1s3-1 5-1s3 1 5 
						1M2 16c2 0 3-1 5-1s3 1 5 1s3-1 5-1s3 1 5 1M17.5 4l-5.278 3l3.278 3.5L12 12m7.222-2a1 1 0 1 0 0-2a1 1 0 0 0 0 2Z"/></svg>
		        		수영장 보유
		        		
		        		</div>
		        		
		        		</c:if>
					
						</div>
						
						</div>
						
						<div id="roomCardsPriceDiv">
							<div id="roomCardsDesc">1박당 숙박 가격</div>
							<div id="roomCardAmount${status.index}" style="font-size: 1.75rem; font-weight: 700;">${u_roomList[i].room_price}</div>
						</div>
				
				</div>
			
			</div>
		
		</div>
	
	</div>
		
	</c:forEach>
	
	<div style="text-align-last: center; margin-top:5%; margin-bottom:3%; display:none" id="spinner">
		<div class="spinner-border" role="status">
		  <span class="visually-hidden"></span>
		</div>
	</div>
	
	<% } else { %>
		<h4 id="roomListNoneContents" style="text-align: center; font-weight: 600; margin-top: 50px;">설정하신 조건으로 검색된 숙박시설이 없습니다.</h4>
	<% } %>
	
</div>

</div>

<br>

<br>

<%@ include file="../footer.jsp" %>
</body>
</html>