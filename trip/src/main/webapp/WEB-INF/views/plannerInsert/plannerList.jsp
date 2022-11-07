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
<c:forEach items="${plannerList}" var="planner" >
<form action="plannerDP.do">
<input type="hidden" name="planner_no" value="${planner.planner_no}">
<input type="hidden" name="user_id" value="${planner.user_id}">
<p>플레너 제목 : ${planner.planner_title} 작성자 : ${planner.user_id} <input type="submit" value="상세보기"></p>
</form>
</c:forEach>
</body>
</html>