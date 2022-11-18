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
	margin-bottom: 30px;
	margin-left:3%;
	margin-right:3%;
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
    text-align: right;
}

.left{
text-align: left;
display: block;
margin-bottom:5px;
}

.title{
color : #3d3d3d;
}

.comment{
color : #525252;
}

#container{
	height:5000px;
}

#log{
	position:fixed;
	top:0;
	left:0;
	width:100px;
	height:50px;
	background-color:rgba(0,0,0,0.7);
	color:white;
	text-align:center;
	line-height:50px;
}

html { overflow: scroll !imporatant;  overflow-y: scroll !imporatant; }
body { overflow: scroll !imporatant;  overflow-y: scroll !imporatant; }
</style>
</head>
<script>
function submit(num){
	$(".list" + num).children("form").submit();
}

  var page = 2;
  var count = 8;
  
 $(window).scroll(function(){
	 var scroll = $(window).scrollTop();
	 var filter = "win16|win32|win64|macintel|mac|"; // PC일 경우 가능한 값
	 if( navigator.platform){
	 	if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
	 		scroll = Number(scroll) + 149 
	 	} }
	 
	 if($(window).scrollTop()  >= $(document).height() - $(window).height()){
			var f = (count * page) - (count * (page-1) +1);
			var m = count * (page-1) +1;
			if($(".list").length > count * (page-1) +1){
				$("#spinner").css("display" , "")
				 setTimeout(function() {
					 $("#spinner").css("display" , "none")
					 for(var i = 0; i <= f; i ++){
						 $(".list" + m ).css("display" , "");
						 m += 1;
					 }
					}, 1000);	
			}
			page +=  1;
			}
	 
	});
	
</script>
<body>
<div class="row">
<div class="col-sm-2">
<div></div>
</div>
<div class="col-sm-8" style="text-align: -webkit-center;">
<h1 style="margin-top:8%; margin-bottom:4%;" class="left">다양한 여행일정을 체크해보세요 <i class="bi bi-check-lg"></i></h1>
<div style="text-align: right;">
<form action="selectPlanner.do" style="margin-right:150px">
<select class='delete form-select form-select-sm' aria-label='.form-select-sm example' style='width: 100px; box-shadow: none; display: inline-block;' name="select" onchange="this.form.submit()">
 <option value="new">최신순</option>
 <option value="popul" 
 <c:if test="${check eq 2}">
 
  selected
 
</c:if>
 >인기순</option>
 </select>
 </form>
 </div>
 <input type="hidden" value="" id="count">
<c:forEach items="${plannerList}" var="planner" varStatus="status">
<div class="list list${status.index}" onclick="submit(${status.index})"
<c:if test="${status.count >= '9'}">
style="display:none"
</c:if>
>
<form action="plannerDP.do">
<input type="hidden" name="planner_no" value="${planner.planner_no}">
<input type="hidden" name="user_id" value="${planner.user_id}">
<img src="${pageContext.request.contextPath}/resources/img/${planner.planner_areaNum}.jpg" style="width:200px; height:210px; float: left;" class="listImg"> 
<div style=" padding-top: 28px;">
<span style="font-size:18px" class="title left">${planner.planner_area}</span>
<span style="font-size:18px; font-weight:550; color:#fa8100" class="title main left">${planner.planner_title}</span>
<span style="font-size:15px" class="comment left">${planner.planner_start}~${planner.planner_end}</span>
<span style="font-size:15px" class="comment left">${planner.planner_day}일 여행</span>
<span style="font-size:15px" class="comment left">작성자 ${planner.user_id} <i class="bi bi-heart-fill like" style="color:black; margin-left:20%"></i> ${planner.planner_like}&nbsp;</span>
</div>
</form>
</div>
</c:forEach>
<div style="text-align-last: center; margin-top:5%; margin-bottom:3%; display:none" id="spinner">
<div class="spinner-border" role="status">
  <span class="visually-hidden">Loading...</span>
</div>
</div>
</div>
<div class="col-sm-2">
<div></div>
</div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>