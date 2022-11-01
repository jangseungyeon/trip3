<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springbook.biz.room.RoomVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소리스트</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script>


</script>

</head>
<body>
	<form action="u_searchRoomList.do" method="post">
		<input class="search_room" type="text" placeholder="검색창"
			name="room_name"><br> <label for="room_addr">지역</label>
		<select name="room_addr" id="room_addr">
			<option value="">전국</option>
			<option>서울</option>
			<option>경기</option>
			<option>인천</option>
			<option>충북</option>
			<option>충남</option>
			<option>경남</option>
			<option>경북</option>
			<option>대구</option>
			<option>전북</option>
			<option>전남</option>
			<option>강원</option>
			<option>제주특별자치도</option>
		</select><br> <label for="room_cat">카테고리</label> <select name="room_cat"
			id="room_cat">
			<option value="">전체</option>
			<option value="hotel">호텔</option>
			<option value="motel">모텔</option>
			<option value="guestHouse">게스트하우스</option>
			<option value="minbak">민박</option>
			<option value="pension">펜션</option>

		</select><br> 
		<label for="room_min_price">최소금액</label>
		<input type="range" name="room_min_price" id="room_min_price" min="0" max="500" step="10" oninput="document.getElementById('min_price').innerHTML=this.value+'만원'" value="0"><span id="min_price"></span><br>
		<label for="room_max_price">최대금액</label>
		<input type="range" name="room_max_price" id="room_min_price" min="0" max="500" step="10" oninput="document.getElementById('max_price').innerHTML=this.value+'만원'" value="500"><span id="max_price"></span><br>
		 <input
			type="text" name="room_max" placeholder="최대인원"><br> <input
			type="checkbox" id="room_wifi" name="room_wifi" value="Y"><label
			for="room_wifi">와이파이</label><br> <input type="checkbox"
			id="room_pet" name="room_pet" value="Y"><label for="room_pet">애완동물동반</label><br>
		<input type="checkbox" id="room_meal" name="room_meal" value="Y"><label
			for="room_meal">조식포함</label><br> <input type="checkbox"
			id="room_parking" name="room_parking" value="Y"><label
			for="room_parking">주차장여부</label><br> <input type="checkbox"
			id="room_swpool" name="room_swpool" value="Y"><label
			for="room_swpool">수영장포함</label><br>

 <input type="checkbox" name="room_theme_m" value="mountain">산
 <input type="checkbox" name="room_theme_s" value="sea">바다
 <input type="checkbox" name="room_theme_f" value="forest">숲
 <input type="checkbox" name="room_theme_v" value="valley">계곡
 <input type="checkbox" name="room_theme_r" value="river">강
 <input type="checkbox" name="room_theme_c" value="city">도시
		<br>


		<button>검색</button>
	</form>
	<h1>숙소</h1>
	<table>
	<c:forEach var="i" begin="0" end="${u_roomList.size()-1}" step="1">
		<tr>
			<td>${u_roomList[i].room_name}</td>
<%-- 			<td>${fn:split(${u_roomList[i].room_addr},' ')}</td> --%>
			<td>${u_roomList[i].room_price}원</td>
			<td><img src="/resources/room_img/${u_roomList[i].room_img}" width="200" height="200" /></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>