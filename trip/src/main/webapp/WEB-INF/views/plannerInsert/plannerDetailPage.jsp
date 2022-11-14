<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script>
function like(num){ // num = like (좋아요 누름)  num = unlike (좋아요 해제)   
	var id = '<%=(String)session.getAttribute("user_id")%>';
	if(id == 'null'){
		alert("로그인이 필요합니다");
		location.href = "user.login.do";
		return;
	}
	
	var like = $("#like_id").val();
	var like_no = $("#like_no").val();
	$.ajax({
		url:"Like.do",
		type: "GET",
		cache: false,
		data:{"type" : 1 , "status" : num  , "like_id" : like , "like_no" : like_no , "planner_no" : ${planner.planner_no}} , // 플래너 = 1 , 숙소 = 2
		success:function(){
			if(num == 'like'){
				$('.unlike').css('display', '');
				$('.like').css('display', 'none');
				$('#status').attr('value' , 'like');
			}else if(num == 'unlike'){
				$('.like').css('display', '');
				$('.unlike').css('display', 'none');
				$('#status').attr('value' , 'unlike');
			}
		},
		error : function(){
			alert("실패");
		}
	});	
}
(function () {
	var num = ${planner.planner_no};
	var id = "${planner.user_id}";
	var id = '<%=(String)session.getAttribute("user_id")%>';
	$.ajax({
		url:"plannerRE.do",
		type: "GET",
		cache: false,
		dataType: "json",
		data:{"num" : num , "id" : id } ,
		success:function(data){
			$(data).each(function(){
				$("#reply" + this.comment_no).append("<a>"+this.user_id+"</a><a class='reg"+this.reply_no+"'>"+this.reg_date+"</a>");
				if("${userID}" == this.user_id){
					$("#reply" + this.comment_no).append("<a onclick='REupdate("+this.reply_no+" , "+this.comment_no+")' class='REtest"+this.reply_no+"'>수정 / </a><a onclick='REdeletes("+this.reply_no+")' class='REtest"+this.reply_no+"'>삭제 / </a><br>");
				}
				$("#reply" + this.comment_no).append(" ㄴRE:<textarea style='width:600px; height:50px' class='RE"+this.reply_no+"' readonly name='reply_content' >"+this.reply_content+"</textarea>" +
				"<input type='hidden' value='"+this.reply_no+"' name='reply_no'>");
			});
			},
		error : function(e){
			alert(e);
		}
	});
	
	$.ajax({
		url:"selectLike.do",
		type: "GET",
		cache: false,
		dataType: "json",
		data:{"like_no" : ${planner.planner_no}} ,
		success:function(data){
			if (data > 0){
				$(".like").css("display" , "none");
			}else if(data == 0){
				$(".unlike").css("display" , "none");
			}
			},
		error : function(e){
			alert(e);
		}
	});
	
})();

function update(val){
	$("."+val).attr("readonly" , false);
	$(".test"+val).css("display" , "none");
	$("#update"+val+" .reg"+val).append("<button onclick=\"crud('Cupdate' , "+val+")\">저장하기</button>")
}
function deletes(val){
	var v = val;
	$.ajax({
		url:"commentdelete.do",
		type: "POST",
		cache: false,
		dataType: "json",
		data:{"comment_no" : v} ,
		success:function(){
			history.go(0);
			}
			,
		error : function(){
			alert("다시시도해주세요");
		}
	});
}
function REupdate(val , test){
	$(".RE"+val).attr("readonly" , false);
	$(".REtest"+val).css("display" , "none");
	$("#reply"+test+" .reg"+val).append("<button onclick=\"crud('Rupdate' , "+val+")\">저장하기</button>")
}
function REdeletes(val){
	var v = val;
	var v = val;
	$.ajax({
		url:"replydelete.do",
		type: "POST",
		cache: false,
		dataType: "json",
		data:{"reply_no" : v} ,
		success:function(){
			history.go(0);
			}
			,
		error : function(){
			alert("다시시도해주세요");
		}
	});
}
function reply(val){
	$('.reply' + val).css("display" , "")
}

function crud(num , number){

	var url = "";
	var no = number
	var planner_no = ${planner.planner_no};
	var content ="";
	var comment_no = "";
	
	if(num == 'Cinsert') {
		url = "comment.do";
		comment_no = 0;
		content = $("#comment_content").val();
	}
	if(num == 'Rinsert') {
		url = "reply.do";
		content = $("#reply_content").val();
		comment_no = number;
	}
	if(num == 'Cupdate'){
		url = "commentupdate.do";
		content = $("."+number).val();
		comment_no = number;
	}
	if(num == 'Rupdate'){
		url = "replyupdate.do";
		content = $(".RE"+number).val();
		comment_no = number;
	}
	alert(content)
	alert(comment_no)
	$.ajax({
		url:url,
		type: "POST",
		cache: false,
		dataType: "json",
		data:{"no" : no , "planner" : planner_no , "content" : content , "comment_no" : comment_no} ,
		success:function(){
			history.go(0);
			}
			,
		error : function(){
			alert("다시시도해주세요");
		}
	});
}

</script>
<body>
<h1>${planner.planner_title}</h1>
<small>${planner.planner_like}</small>
<input type="hidden" value="${planner.user_id}" id="like_id"> 
<input type="hidden" value="${planner.planner_no}" id="like_no"> 

<c:forEach items="${place}" var="place" >
<p>day - ${place.planner_date}</p>
<img <%-- src="${place.img}" --%> style='width:50px;height:50px; float: left;'>
<a style='vertical-align:top;'>${place.place_name}</a><br><small style='vertical-align:buttom;'>${place.addr}</small><br>
<p style="display:none">${place.planner_no}</p>
<p style="display:none">${place.mapy}</p>
<p style="display:none">${place.mapx}</p>
</c:forEach>



<h1>댓글</h1>
	댓글달기 : 
	<% if((String)session.getAttribute("user_id") == null){ %>
	<div style="display:inline-block"> <a href="user.login.do">로그인</a>이 필요합니다</div>
	<% }else{ %>
	<input type="text" id="comment_content" value="" > <button onclick="crud('Cinsert' , 0)">등록</button>
	<%} %>

<%-- 	<input type="hidden" value="${planner.planner_no}" name="planner_no">
	<input type="hidden" value=<%= (String)session.getAttribute("user_id") %> name="user_id">
	<input type="hidden" value="${planner.user_id}" name="id">  --%>
	
	
<c:forEach items="${comment}" var="c" varStatus="status">
<span id="update${c.comment_no}">
<a>${c.user_id}</a><a class="reg${c.comment_no}">${c.reg_date}</a>
<a onclick="reply(${c.comment_no})" class="test${c.comment_no}">답글 / </a>
<c:set var="userID" value="${userID}" />
<c:if test="${c.user_id eq userID}">
<a onclick="update(${c.comment_no})" class="test${c.comment_no}">수정 / </a><a onclick="deletes(${c.comment_no})" class="test${c.comment_no}">삭제 / </a>
</c:if>
<br>
<textarea style="width:600px; height:50px" class="${c.comment_no}" readonly name="content" >${c.comment_content}</textarea>
<%-- <input type="hidden" value="${c.comment_no}" name="comment_no">
<input type="hidden" value="${planner.user_id}" name="id">  --%>
</span>
	<!-- <form action="reply.do" method="post"> -->
	답글달기 : <input class="reply${c.comment_no}" type="text" id="reply_content" style="display:none">
	<input type="submit" value="등록" style="display:none" class="reply">
	<button onclick="crud('Rinsert' , ${c.comment_no})">등록</button>
<%-- 	<input type="hidden" value="${planner.planner_no}" name="planner_no">
	<input type="hidden" value="${c.comment_no}" name="comment_no">
	<input type="hidden" value=<%= (String)session.getAttribute("user_id") %> name="user_id">
	<input type="hidden" value="${planner.user_id}" name="id">  --%>
	<!-- </form> -->
	
<p id="reply${c.comment_no}">
</p> 
</c:forEach>
<i class="bi bi-heart-fill unlike" onclick="like('unlike')" class="unlike"></i>
<i class="bi bi-heart like" onclick="like('like')" class="like"></i>
<input type="hidden" name="status" id="status">

</body>
</html>