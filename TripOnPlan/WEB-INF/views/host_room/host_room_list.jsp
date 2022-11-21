<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springbook.biz.room.RoomVO"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>업주용 숙소 목록</title>
<%@ include file="../host_header.jsp"%>
<script>
	function f_getRoom(room_id) {
		location.href="getRoom.do?room_id=" + room_id;
	}
	
	function f_moveInsertRoom() {
		location.href="moveInsertRoom.do";
	}

</script>
<style>

@media (min-width: 1300px) {

	body {
		word-break: keep-all;
	}
	
	.wrap {
		margin: 70px auto;
	}
	
	.room_list_div {
		margin-left:130px;
		margin-right:130px;
	}
	
	table {
		margin: 0 auto;
		width: 100%;
    	height: 100%;
    	text-align: left;
    	border-collapse: collapse;
	}
	
	table tr{
		border-top: 1px solid #aaa;
		border-bottom: 1px solid #aaa;
	}
	
	table th, td {
    	padding: 10px;
    	text-align: center;
    	vertical-align: middle;
    	font-weight: 600;
	}
	
	table th {
		height: 100%;
	}
	
	#roomNum {
		width: 50px;
	}
	
	#roomRest {
		width: 33vw;
	}
	
	.roomListHead {
		display: flex;
		justify-content: space-between;
		margin-bottom: 6px;
	}
	
	.roomListTitle {
		width: 53vw;
		display: flex;
		justify-content: space-between;
	}
	
	.roomListTitle h2 {
		margin-left: 0;	
		margin-right: 0;
		text-align: left;
		font-weight: 800;	
	}
	
	.roomMarkDesc {
		padding-top: 15px;
		text-align: center;
		white-space: nowrap;
	}
	.roomMarkDesc mark{
		background-color: #FFF;
		color: #dc3545;
		font-weight: 600;
	}
	
	select {
		width: 7vw;
		border-radius: 5px;
	    border: 1px solid black;
	    padding: 5px;
	}
	
	input {
		width: 13vw;
		border-radius: 5px;
	    border: 1px solid black;
	    padding: 5px;
	}
	
	.roomListSearchFormDiv {
		width: 25vw;
		height: 38px;
		display: flex;
		justify-content: space-around;
	}
	
	.searchBtn {
		margin-bottom: 5px;
	}
	
	.roomInsertBtn {
		display: flex;
		justify-content: flex-end;
	}
	
	tfoot {
		text-align:center;
		border-collapse:collapse;
	}
	
	.tfootContent {
		font-size: 1.2rem;
	}
	
	.tfootAll {
		display: none;
	}
	
	.roomListNoneDiv {
		margin: 30px auto;
		text-align: center;
		font-size: 1.2rem;
		font-weight: 600;
	}
	
	}
	
@media (max-width: 1300px) {
	
	body {
		word-break: keep-all;
	}
	
	.wrap {
		margin-top: 50px;
		margin-bottom: 50px;
		mragin-left: 0;
		mragin-right: 0;
	}
	
	.room_list_div {
		margin-left: 10vw;
		margin-right: 10vw;
	}
	
	.roomListHead {
		text-align: center;
	}
	
	table, th, td {
		text-align: center;
	}
	
	table {
		width: 100%;
		margin: auto;
		table-layout: fixed;
	}
	.roomMarkDesc mark{
		background-color: #FFF;
		color: #dc3545;
		font-weight: 600;
	}
	
	h2 {
		margin: 10px auto;
		text-align: center;
		font-weight: 800;
	}
	
	.table thead, .table tbody, .table th, .table .js-load.active td, .table .js-load.active tr{
		display: block;
		
	}
		
	.table thead tr {
		display: none;
	}
	
	.table .js-load.active tr {
		margin: 0 0 1rem 0;
		border: 1px solid #ccc;
	}
	
	.table tr:nth-child(odd) {
		background: #F8f8ff;
	}
	
	.table .js-load.active td {
		width: 80vw;
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}
	
	.table td {
		width: 80vw;
	}
	
	.table img {
		width: 35vw;
		height: 25vh;
	}
	
	select, input {
		border-radius: 5px;
	    border: 1px solid black;
	    padding: 5px;
	}
	
	.roomInsertBtn {
		margin-top: 10px;
		display: flex;
		justify-content: center;
	}
	
	.tfootAll {
		display: none;
	}
	
	.table .js-load.active td:before {
		position: absolute;
		top: 50%;
		left: 25%;
		transform: translate(-50%, -50%);
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
	}
	
	.table .js-load.active td:nth-of-type(1):before {content: "번호"}
	.table .js-load.active td:nth-of-type(2):before {content: "숙박시설\A대표 이미지"; white-space: pre;}
	.table .js-load.active td:nth-of-type(3):before {content: "${roomListHeadMap.RoomName}"}
	.table .js-load.active td:nth-of-type(4):before {content: "${roomListHeadMap.RoomAddr}"}
	
	}
	
	.js-load {
    	visibility: collapse;
	}
	.js-load.active {
    	visibility: visible;
	}
	.js-load:after {
    	visibility: collapse;
	}
	.btn-wrap {
    	display: block;
	}
	.btn-wrap {
    	text-align: center;
	}
	
	.roomListHead, .roomListTitle, .roomListSearchFormDiv {
		margin-bottom: 10px;
	}
	
</style>

<script>

$(document).ready(function () {
    load('#js-load', '2');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '2', '#js-btn-wrap');
    })
});

 
function load(id, cnt) {
    var rooms_list = id + " .js-load:not(.active)";
    var rooms_length = $(rooms_list).length;
    var rooms_total_cnt;
    if (cnt < rooms_length) {
        rooms_total_cnt = cnt;
    } else {
        rooms_total_cnt = rooms_length;
        $('.button').hide();
        $('.tfootAll').show();
    }
    $(rooms_list + ":lt(" + rooms_total_cnt + ")").addClass("active");
}

</script>


</head>
<body>

<% ArrayList<RoomVO> roomList = (ArrayList<RoomVO>)request.getAttribute("roomList"); %>

<div class="wrap">
		
		<div class="room_list_div">
		
		<div class="roomListHead">
		<div class="roomListTitle">
		<div>
		<h2>숙박시설 목록</h2>
		</div>
		<div class="roomMarkDesc">
		<mark>(숙박시설이 담긴 행을 누르면 자동으로 해당 숙박시설 상세페이지로 이동합니다)</mark>
		</div>
		</div>
		<div class="roomListSearchFormDiv">
		<form action="getRoomList.do" method="post">
		<select name="searchCondition">
			<option value="RoomName" selected>이름</option>
			<option value="RoomAddr">기본 주소</option>
		</select>
		<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요"/>
		<button type="submit" class="btn btn-outline-dark searchBtn">검색</button>
		</form>
		</div>
		</div>


<div>
	<%if(roomList.size() != 0) { %>
	<table class="table">
	<thead>
	<tr>
			<th id="roomNum">번호</th>
			<th id="roomRest">숙박시설 대표 이미지(썸네일)</th>
			<th id="roomRest">${roomListHeadMap.RoomName}</th>
			<th id="roomRest">${roomListHeadMap.RoomAddr}</th>
	</tr>
	</thead>
	
	<tfoot class="tfootAll">
		<tr>
			<td colspan="4" class="tfootContent">${host_id}님의 이름으로 조회된 숙박시설 갯수: <%=roomList.size()%>개</td>
		</tr>
	</tfoot>
	
	<tbody id="js-load">
		<c:forEach items="${roomList}" var="room" varStatus="status">
			<tr onclick="f_getRoom('${room.room_id}')" style="cursor:pointer;" class="js-load">
				<td id="roomNum">${status.index+1}</td>
				<td id="roomRest"><img src="resources/room_img/${room.room_img_no1}" width="300" height="200" alt="${room.room_name} 대표 이미지" title="${room.room_name} 대표 이미지"/></td>
				<td id="roomRest">${room.room_name}</td>
				<td id="roomRest">${room.room_addr}&nbsp;&nbsp;${room.room_addr_detail}</td>			
			</tr>
		</c:forEach>
	</tbody>
	
	</table>
	
	<br>
	
	<div id="js-btn-wrap" class="btn-wrap" style="text-align: center;"><button onclick="location.href='javascript:;'" class="button btn btn-outline-dark">더보기</button> </div>
	
</div>

	<% } else { %>
		<div class="roomListNoneDiv">${host_id}님으로 등록된 숙박시설이 없습니다.</div>
	<% } %>

<div class="roomInsertBtn">
		<button onclick="f_moveInsertRoom()" class="btn btn-outline-dark">${host_id}님 이름으로 숙소 등록하기</button>
</div>

</div>
</div>
</body>
</html>