<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>
<style>
	.top{
		width:100%;
		background: linear-gradient(45deg, lightCyan, skyBlue, deepSkyBlue);
		color: white;
	}
</style>
</head>
<body>


<div class="top">
안녕하세요 ${host_bizname}님. 반갑습니다.
</div>
호스트 인덱스입니다.
<br>


</body>
</html>