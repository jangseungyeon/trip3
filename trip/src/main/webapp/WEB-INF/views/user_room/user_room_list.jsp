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

<% ArrayList<RoomVO> u = (ArrayList<RoomVO>)request.getAttribute("u_roomList"); %>
<script>

	function f_getRoom(room_id) {
		location.href="u_getRoom.do?room_id=" + room_id;
	}
	
	$(function(){
		
		$("#room_area").val("${rvo.room_area}");
		$("#room_cat").val("${rvo.room_cat}");
		
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

.wrap {
	margin: 0 auto;
}

.searchRoomfrmDiv {
	text-align: center;
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
	width: 90vw;
	margin: 1.5vh auto;
	display: grid;
	color: #fff;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv label {
	font-size: 1.1rem;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv {
	margin-left: 2vw;
	margin-right: 2vw;
}

::placeholder {
	text-align: center;
}

.roomBasicCheck {
	height: 20vh;
	margin: 0 auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: center;
	align-items: center;
	text-align: right;
	background-color: #ff8e15;
	border-radius: 15px;
	font-weight: 700;
}

.roomBasicCheck select, input {
	border-radius: 15px;
    border: 1px solid #aaa;
    text-align: center;
}

.roomCheckboxsCheckDiv {
	display: flex;
	flex-flow: row wrap;
	width: 45vw;
	height: 23vh;
	justify-content: space-around;
	align-items: flex-start;
	margin-top: 2.5vh;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 3vh;
	background-color: #ff8e15;
	border-radius: 15px;
	font-weight: 500;
	padding-top: 5px;
}

.roomCheckboxsCheckDiv div {
	margin-top: 0.5vh;
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
	background-color: #ff8955;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}
 
    input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

.roomThemeDiv {

display:flex;

flex-direction: column;el
	
}

.roomConditionDiv {

display:flex;

flex-direction: column;
	
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
	height:200px;
}

#roomListImgDiv img {
	position: absolute;
	border-radius: 15px;
	top:50%;
	left:50%;
	width: 95%;
	height: 90%;
	transform: translate(-50%, -50%);
}

@media (max-width: 990px) {
	.wrap {
	margin: 0 auto;
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
	width: 90vw;
	margin: 1.5vh auto;
	display: grid;
	color: #fff;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv label {
	font-size: 1.1rem;
}

.roomListAreaCatDiv, .roomListAmountDiv, .roomListNameMaxDiv {
	margin-left: 2vw;
	margin-right: 2vw;
}

::placeholder {
	text-align: center;
}

.roomBasicCheck {
	height: 100%;
	width: 95%;
	margin: 10px auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-evenly;
	align-items: center;
	text-align: right;
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
	border-radius: 15px;
    border: 1px solid #aaa;
    text-align: center;
}

.roomCheckboxsCheckDiv {
	display: flex;
	flex-flow: row wrap;
	height: 100%;
	width: 95%;
	justify-content: space-around;
	align-items: center;
	margin-top: 5vh;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 3vh;
	background-color: #ff8e15;
	border-radius: 15px;
	font-weight: 500;
}

.roomCheckboxsCheckDiv div {
	margin-top: 0.5vh;
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
	background-color: #ff8955;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}
 
    input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

.roomThemeDiv {

display:flex;

flex-direction: column;

flex-wrap: wrap;

	
}

.roomConditionDiv {

display:flex;

flex-direction: column;

flex-wrap: wrap;
	
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
	width: 95%;
	height: 90%;
	transform: translate(-50%, -50%);
}
}


</style>

</head>
<body>

<div class="wrap">

	<div class="searchRoomfrmDiv">
	
		<h1 id="u_roomListTitle">여행, 떠나세요? 어디로 가실 예정이신가요?</h1>
		<br>
		
		<form name="searchRoomfrm" action="u_searchRoomList.do" method="post" id="u_searchfrm">
			
			<div class="roomBasicCheck">
			
			<div class="roomListAreaCatDiv">
			<label for="room_area">지역</label>
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
			<label for="room_cat">카테고리</label>
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
			<label for="room_min_price">최소금액</label>
			<input type="text" name="room_min_price" value="${rvo.room_min_price}"/>
			<br>
			<label for="room_max_price">최대금액</label>
			<input type="text" name="room_max_price" value="${rvo.room_max_price}"/>
			</div>
			
			<div class="roomListNameMaxDiv">
			<label for="room_name">숙소 이름</label>
			<input id="room_name" class="search_room" type="text" placeholder="숙소 이름 검색" name="room_name" value="${rvo.room_name}">
			<br>
			<label for="room_max">숙소 최대 수용가능 인원</label>
			<input type="text" name="room_max" id="room_max" placeholder="최대인원" value="${rvo.room_max}">
			</div>
			
			</div>
			
			<div class="roomCheckboxsCheckDiv">
			 
			<div class="roomConditionDiv">
			
			<div style="margin-bottom: 10px; font-size: 1.2rem; font-weight: 700;"><span>숙소 기본 제공 조건</span></div>
			
			<div>
			<input type="checkbox" id="room_wifi" name="room_wifi" value="Y">
			<label for="room_wifi">와이파이</label>
			
			
			<input type="checkbox" id="room_pet" name="room_pet" value="Y">
			<label for="room_pet">애완동물동반</label>
			</div>
			
			<div>
			<input type="checkbox" id="room_meal" name="room_meal" value="Y">
			<label for="room_meal">조식포함</label>
			</div>
			
			<div>
			<input type="checkbox" id="room_parking" name="room_parking" value="Y">
			<label for="room_parking">주차장여부</label>
			
			<input type="checkbox" id="room_swpool" name="room_swpool" value="Y">
			<label for="room_swpool">수영장포함</label>
			</div>
			
			</div>

			<div class="roomThemeDiv">
			
			<div style="margin-bottom: 10px; font-size: 1.2rem; font-weight: 700;"><span>숙소 테마</span></div>
			
			<div>
			<input type="checkbox" name="room_theme" value="mountain" id="room_theme_mountain">
			<label for="room_theme_mountain">산</label>
			
			<input type="checkbox" name="room_theme" value="sea" id="room_theme_sea">
			<label for="room_theme_sea">바다</label>
			
			<input type="checkbox" name="room_theme" value="forest" id="room_theme_forest">
			<label for="room_theme_forest">숲</label>
			</div>
			
			<div>
			<input type="checkbox" name="room_theme" value="valley" id="room_theme_valley">
			<label for="room_theme_valley">계곡</label>
			
			<input type="checkbox" name="room_theme" value="river" id="room_theme_river">
			<label for="room_theme_river">강</label>
			
			<input type="checkbox" name="room_theme" value="city" id="room_theme_city">
			<label for="room_theme_city">도시</label>
			</div>
			
			</div>
			
			</div>
			
		<div>
			<button type="submit" id="roomSearchBtn">검색</button>
		</div>
			
		</form>
		
	</div>
	
	<%if(u.size() != 0) { %>
	<div class="uRoomListDiv">

	<c:forEach var="i" begin="0" end="${u_roomList.size()-1}" step="1">
	
		<div class="card mb-3" onclick="f_getRoom('${u_roomList[i].room_id}')" style="cursor: pointer;">
  			<div class="row no-gutters">
	    		<div class="col-md-3" id="roomListImgDiv">
	      			<img src="resources/room_img/${u_roomList[i].room_img_no1}" alt="${u_roomList[i].room_name} 대표 이미지" title="${u_roomList[i].room_name} 대표 이미지">
	    		</div>
		    	<div class="col-md-9">
		      	<div class="card-body">
		        	<h5 class="card-title">${u_roomList[i].room_name}</h5>
		        	<p class="card-text">${u_roomList[i].room_price}원</p>
		      	</div>
		    	</div>
  			</div>
		</div>
		
	</c:forEach>
	
	<% } else { %>
		<p>설정하신 조건으로 검색된 숙박시설이 없습니다.</p>
	<% } %>
	
	</div>
</div>


</body>
</html>