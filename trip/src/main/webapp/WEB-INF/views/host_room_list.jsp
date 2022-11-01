<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springbook.biz.room.RoomVO"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업주용 숙소 목록</title>

<script>
	function f_getRoom(room_id, host_id) {
		location.href="getRoom.do?room_id=" + room_id + "&host_id=" + host_id;
	}
	
	function f_moveInsertRoom() {
		location.href="moveInsertRoom.do";
	}

</script>
</head>
<body>

<% ArrayList<RoomVO> roomList = (ArrayList<RoomVO>)request.getAttribute("roomList"); %>

<div id="hostRoomListTableDiv">
	<%if(roomList.size() != 0) { %>
	<table>
	<caption>숙박시설 목록</caption>
	<thead>
	<tr>
			<th>번호</th>
			<th>${roomListHeadMap.RoomTumbnail}</th>
			<th>${roomListHeadMap.RoomName}</th>
			<th>${roomListHeadMap.RoomAddr}</th>
	</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${roomList}" var="room" varStatus="status">
			<tr onclick="f_getRoom('${room.room_id}', '${room.host_id}')" style="cursor:pointer;">
				<td>${status.index+1}</td>
				<td><img src="/resources/room_img/${room.room_img}" width="150" height="150" alt="${room.room_name} 대표 이미지" title="${room.room_name} 대표 이미지"/></td>
				<td>${room.room_name}</td>
				<td>${room.room_addr}&nbsp;&nbsp;${room.room_addr_detail}</td>			
			</tr>
		</c:forEach>
	</tbody>
	
	<tfoot>
		<tr>
			<td>${host_id}님의 이름으로 조회된 숙박시설 갯수: ${paging.totalPageCnt}</td>
		</tr>
	</tfoot>
	</table>
</div>

	<% } else { %>
		<p>${host_id}님으로 등록된 숙박시설이 없습니다.</p>
	<% } %>

<div>

<button onclick="f_moveInsertRoom()">${host_id}님 이름으로 숙소 등록하기</button>

</div>
</body>
</html>