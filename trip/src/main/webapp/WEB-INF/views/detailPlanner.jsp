<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원 아이디 : ${user_id} <br><br>
	숙소 아이디 : ${room_id} <br><br>
	숙소명 : ${room_name} <br><br>
	숙소 최대 가능 인원 : ${room_max} <br><br>
	여행 시작일 : ${planner_start} <br><br>
	여행 종료일 : ${planner_end} <br><br>
	여행 지역 : ${planner_area} <br><br>
	플래너 제목 : ${planner_title} <br><br>
	여행 기간 : ${planner_day}일 <br><br>
	
<c:forEach items="${placeList}" var="place" >
<p>day - ${place.planner_date}</p>
<img src="${place.img}" style='width:50px;height:50px; float: left;'>
<a style='vertical-align:top;'>${place.place_name}</a><br><small style='vertical-align:buttom;'>${place.addr}</small><br>
<p style="display:none">${place.planner_no}</p>
<p style="display:none">${place.mapy}</p>
<p style="display:none">${place.mapx}</p>
</c:forEach>

<form action="deletePlanner.do" method="post">
<input type="hidden" value="${user_id}" name="user_id">
<input type="hidden" value="${planner_no}" name="planner_no">
<button>일정 지우기</button>
</form>
</body>
</html>