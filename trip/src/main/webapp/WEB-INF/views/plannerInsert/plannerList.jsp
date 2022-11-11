<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style>
.list:hover{
background-color : #f0f0f0;
}

.list{
	height: 210px;
	width: 450px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 10%;
	margin-bottom: 30px;
	position: relative;
	overflow: hidden;
	border: solid 1px  #e1e1e1;
	border-radius: 15px;
	box-shadow: 2px 1.5px 2px 2px #f2f2f2
}

.listImg{
    border-radius: 15px;
    margin-right: 3%;
}

.like{
	margin-left: 85px;
    text-align: right;
}

.title{
color : #3d3d3d;
}

.comment{
color : #525252;
}
</style>
</head>
<body>
<div style="margin-top:2%; margin-left:15%; margin-right:15%;">
<h1 style="margin-top:8%; margin-bottom:4%;">다양한 여행일정을 체크해보세요 <i class="bi bi-check-lg"></i></h1>
<div style="text-align: right;">
<select class='delete form-select form-select-sm' aria-label='.form-select-sm example' style='width: 100px; box-shadow: none; display: inline-block; margin-right:10%'>
 <option>인기순</option>
 <option>최신순</option>
 </select>
 </div>
<c:forEach items="${plannerList}" var="planner">
<div class="list">
<form action="plannerDP.do">
<input type="hidden" name="planner_no" value="${planner.planner_no}">
<input type="hidden" name="user_id" value="${planner.user_id}">
 <img src="resources/img/city-7085073_960_720.jpg" style="width:200px; height:210px; float: left;" class="listImg"> 
<%-- <p>${planner.planner_title} 작성자 : ${planner.user_id} <input type="submit" value="상세보기"></p> --%>
<div style=" padding-top: 28px;">
<span style="font-size:18px" class="title">강원도</span> <br>
<span style="font-size:18px; font-weight:550; color:#fa8100" class="title main">신나는 강원도 여행 하하</span>
<span style="font-size:15px" class="comment">2099.12.12~2099.12.31</span><br>
<span style="font-size:15px" class="comment">작성자 kimkim</span><br>
<span style="font-size:15px" class="comment">comment : 3</span><span class="like"><i class="bi bi-heart-fill" style="color:black;"></i> 8&nbsp;</span>
</div>
</form>
</div>
</c:forEach>
</div>
</body>
</html>