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
		min-height:250px;
		background: linear-gradient(45deg, deepSkyBlue, skyBlue, lightCyan);
		color: white;
		font-size: 30px;
		font-weight: normal;
		vertical-align: center;
		padding: 30px;
		line-height: 180%;
	}
	.red-text{
		color:#DC3545;
		font-size:35px;
	}
	.contents-box{
		min-height:250px;
		margin:30px;
		padding:30px;
		color:black;
		font-size:30px;
		padding:30px;	
		border-style:solid;
		border-color:#6c757d;
		position:relative;
	}
</style>
</head>
<body>


<div class="top">
안녕하세요 <span class="red-text">${host_bizname}</span>님.<br>
오늘도 좋은 하루 보내세요.
</div>
<br>
<!-- 매출현황 -->
<div class="contents-box">
예약 현황<br>
 · 일간: <span class="red-text">1</span>개의 방이 예약,
<span class="red-text">100,000</span>원의 수입 예상<br>
 · 주간: <span class="red-text">7</span>개의 방이 예약,
<span class="red-text">700,000</span>원의 수입 예상<br>
 · 월간: <span class="red-text">28</span>개의 방이 예약,
<span class="red-text">2,800,000</span>원의 수입 예상<br>
</div>


</body>
</html>