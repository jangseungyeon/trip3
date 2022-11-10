<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.review.ReviewVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>

<style>
	table, td{
		border: 1px solid;
	}

</style>
</head>
<body>
<br><br>


<c:choose>
<c:when test="${reviewListForHost.size() eq '0'}">${host_id}님 등록된 숙소 리뷰가 없습니다.ㅎㅎ </c:when>
<c:when test="${reviewListForHost.size() ne '0'}">
${host_id}님 숙소의 리뷰 목록입니다.<br>
<table>
<tr><td>리뷰ID</td><td>내 객실명</td><td>객실ID</td><td>호스트ID</td><td>리뷰 내용</td><td>리뷰 사진(선택)</td><td>별점</td><td>작성일</td></tr>
	<c:forEach var="i" begin="0" end="${reviewListForHost.size()-1}" step="1">
		<tr>
			<td>${reviewListForHost[i].review_id}</td>
			<td>${reviewListForHost[i].room_name}</td>
			<td>${reviewListForHost[i].room_id}</td>
			<td>${reviewListForHost[i].host_id}</td>
			<td>${reviewListForHost[i].review_content}</td>
			<td>${reviewListForHost[i].review_img}</td>
			<td>${reviewListForHost[i].star_point}</td>
			<td>${reviewListForHost[i].write_date}</td>
		</tr>
	</c:forEach>
</table>
</c:when>
</c:choose>




</body>
</html>