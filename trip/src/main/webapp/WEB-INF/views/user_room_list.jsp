<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springbook.biz.room.RoomVO" %>
<%@ include file="header.jsp" %>
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
			
			room_themes_arr = room_themes.split(",");
			
			var room_themes_arr = new Array();
			
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

</style>

</head>
<body>
	<form name="searchRoomfrm" action="u_searchRoomList.do" method="post" id="u_searchfrm">
		<input class="search_room" type="text" placeholder="숙소 이름 검색창" name="room_name" value="${rvo.room_name}">
		<br> 
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
		<br> 
		<label for="room_min_price">최소금액</label>
<!-- 		<input type="range" name="room_min_price" id="room_min_price" min="0" max="500" step="10" oninput="document.getElementById('min_price').innerHTML=(this.value % 10000)+'만원'" value="0"><span id="min_price"></span><br> -->
		<input type="text" name="room_min_price" value="${rvo.room_min_price}"/>
		<label for="room_max_price">최대금액</label>
<!-- 		<input type="range" name="room_max_price" id="room_min_price" min="0" max="500" step="10" oninput="document.getElementById('max_price').innerHTML=(this.value % 10000) +'만원'" value="5000000"><span id="max_price"></span><br> -->
		<input type="text" name="room_max_price" value="${rvo.room_max_price}"/>
		 <input type="text" name="room_max" id="room_max" placeholder="최대인원" value="${rvo.room_max}">
		 <br>
		 <input type="checkbox" id="room_wifi" name="room_wifi" value="Y">
		 <label for="room_wifi">와이파이</label>
		 <br>
		 <input type="checkbox" id="room_pet" name="room_pet" value="Y">
		 <label for="room_pet">애완동물동반</label>
		 <br>
		<input type="checkbox" id="room_meal" name="room_meal" value="Y">
		<label for="room_meal">조식포함</label>
		<br>
		<input type="checkbox" id="room_parking" name="room_parking" value="Y">
		<label for="room_parking">주차장여부</label>
		<br>
		<input type="checkbox" id="room_swpool" name="room_swpool" value="Y">
		<label for="room_swpool">수영장포함</label>
		<br>
		 <input type="checkbox" name="room_theme" value="mountain" id="room_theme_mountain">산
		 <input type="checkbox" name="room_theme" value="sea" id="room_theme_sea">바다
		 <input type="checkbox" name="room_theme" value="forest" id="room_theme_forest">숲
		 <input type="checkbox" name="room_theme" value="valley" id="room_theme_valley">계곡
		 <input type="checkbox" name="room_theme" value="river" id="room_theme_river">강
		 <input type="checkbox" name="room_theme" value="city" id="room_theme_city">도시
		<br>
		<button type="submit">검색</button>
	</form>
	
	<%if(u.size() != 0) { %>
	<h1>숙소</h1>
	<table>
	<c:forEach var="i" begin="0" end="${u_roomList.size()-1}" step="1">
		<tr onclick="f_getRoom('${u_roomList[i].room_id}')" style="cursor: pointer;">
			<td>
			<div class="head">
			<div class="heart" style="height: 10px; width: 10px;">${u_roomList[i].room_likes}</div>
			</div>
			</td>
			<td>${u_roomList[i].room_stars}</td>
			<td>${u_roomList[i].room_name}</td>
<%-- 			<td>${fn:split(${u_roomList[i].room_addr},' ')}</td> --%>
			<td><input type="hidden" name="status" value=""></td>
			<td>${u_roomList[i].room_price}원</td>
			<td><img src="resources/room_img/${u_roomList[i].room_img_no1}" width="200" height="200" /></td>
		</tr>
	</c:forEach>
	</table>
	<% } else { %>
		<p>설정하신 조건으로 검색된 숙박시설이 없습니다.</p>
	<% } %>
</body>
</html>