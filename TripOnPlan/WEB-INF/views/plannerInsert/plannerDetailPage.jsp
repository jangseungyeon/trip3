<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ include file="../header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!DOCTYPE html>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
.main{
margin-bottom: 3%;
}
.day{
border: solid 1px #e0dfde;
border-radius: 8px;
height: 75px;
cursor: pointer;
}

.img{
border-radius: 8px;
height: 73px;
float: left;
width:75px
}

.delete{
 background-color: #dad9d8;
    color: #828282;
}
.delete:hover{
background-color: #cccccc;
    color: 777777;
}
.title{
    display: block;
    margin-top: 12px
}
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
#lnb.fixed{
  position: fixed;
  right: 0;
  top: 0;
}
.comment_reply{
width:100%; 
border: none; 
border-bottom:solid 1px #e9ecef;
resize: none;
outline: none;
}
.userID{
font-size: 19px;
color:#161616;
}
.date{
font-size: small;
color:#303030;
}
.insert{
height: 65px;
width: 95%;
border: solid 1px #c5c5c5;
outline: none;
}

.col-sm-6 {
    height: 800px;
    overflow: overlay;
}
.main{
	border-top:solid 1px #494949; 
	border-bottom:solid 1px #494949;
	padding-top:20px;
	padding-bottom:20px;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
.day:hover{
	background-color:#f4f4f4;
}
.heart{
display: inline-block;
    border: solid 1px;
    padding: 7px;
    border-radius: 100%;
    width: 35px;
    height: 35px;
    text-align: center;
    color: #c6c6c6;
}
.heart:hover{
	background-color:#d9d9d9;
	color:#848484;
}
</style>
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
				$("#reply" + this.comment_no).append("<br><span class='userID'>"+this.user_id+"</span><small class='reg"+this.reply_no+" date'>"+this.reg_date+"</small>");
				if("${userID}" == this.user_id){
					$("#reply" + this.comment_no).append("<button type='button' class='btn btn-light btn-sm REtest"+this.reply_no+"' onclick='REupdate("+this.reply_no+" , "+this.comment_no+")'>수정</button><button type='button' class='btn btn-light btn-sm REtest"+this.reply_no+"' onclick='REdeletes("+this.reply_no+")'>삭제</button>");
				}
				$("#reply" + this.comment_no).append("<br><textarea class='RE"+this.reply_no+" comment_reply' style='width:90%; ' readonly name='reply_content' >"+this.reply_content+"</textarea>" +
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
	
	var number = ${planner.planner_no};
	
	$.ajax({
		 url: "placeSelect.do" ,
		 type: "GET" , 
		 dataType: "json", 
		 data : {
			 "planner_no" : number
		 } , 
		 success : function(data){
			 var i = 1;
			 $(data).each(function(){
			$("#"+this.planner_date).append("<div style='width:450px; overflow: overlay; margin-bottom: 1px;' class='day day"+this.planner_date+"' onclick='area("+i+")'><img src='"+this.img+"' class='img'>"+
		 	"<span style='vertical-align:top;' class='title'>"+ this.place_name+"</span> <small style='vertical-align:buttom;'>"+ this.addr+"</small>"+
		 	"<input type='hidden' value='"+this.mapy+"' class='mapy"+this.planner_date+" y"+i+"'> <input type='hidden' value='"+this.mapx+"' class='mapx"+this.planner_date+" x"+i+"'></div><span class='material-symbols-outlined' style='font-weight: 900;'>more_vert</span>")
		 	 i += 1;
			
			 });
			 
		 } , 
		 error : function(){
			 alert("실패");
		 }
	 });

	  $.ajax({
			 url: "selectMemo.do" ,
			 type: "GET" , 
			 dataType: "json", 
			 data : {
				 "planner_no" : number
			 } , 
			 success : function(data){
				 $(data).each(function(){
					 
					 $("#memoP" + this.memo_day).text(this.memo_content)
					 
				 });
			 
			 } , 
			 error : function(){
				 alert("실패");
			 }
		 });
	  
})();

function update(val){
	$("."+val).attr("readonly" , false);
	$(".test"+val).css("display" , "none");
	$("#update"+val+" .reg"+val).append("<button type='button' class='btn btn-light btn-sm' onclick=\"crud('Cupdate' , "+val+")\">저장</button>")
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
	$("#reply"+test+" .reg"+val).append("<button type='button' class='btn btn-light btn-sm' onclick=\"crud('Rupdate' , "+val+")\">저장</button>")
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
	$('.button' + val).css("display" , "")
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
		content = $("#reply_content"+number).val();
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

function memo(data){
	$(".memo" + data).trigger("click");
	
	var positions = [];
	var mapy = "0";
	var mapx = "0";
	if($("#" + data + " div").length > 0 ){
		for(var i = 0; i < $("#" + data + " div").length ; i ++){
			console.log($(".mapy" + data).eq(i).val()); console.log($(".mapx" + data).eq(i).val())
			mapy = Number(mapy) + Number($(".mapy" + data).eq(i).val());
			mapx = Number(mapx) + Number($(".mapx" + data).eq(i).val());
				positions[i] = {
					   title: '예제', 
					  latlng: new kakao.maps.LatLng($(".mapy" + data).eq(i).val(), $(".mapx" + data).eq(i).val())
			   }
		   }
		mapy = mapy / $("#" + data + " div").length;
		mapx = mapx / $("#" + data + " div").length;
		console.log(mapx)
		mapOption = { 
	 	        center: new kakao.maps.LatLng(mapy , mapx), // 지도의 중심좌표
	 	        level: 11 // 지도의 확대 레벨
	 	    };
	  var map = new kakao.maps.Map(mapContainer, mapOption); // 새로운 중심좌표 생성 
	  
	  for (var i = 0; i < positions.length; i ++) {
		  var imageSrc = "resources/img/mark"+(i+1)+".png";
	      // 마커 이미지의 이미지 크기 입니다
	      var imageSize = new kakao.maps.Size(100, 50); 
	      
	      // 마커 이미지를 생성합니다    
	      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	      
	      // 마커를 생성합니다
	      var marker = new kakao.maps.Marker({
	          map: map, // 마커를 표시할 지도
	          position: positions[i].latlng, // 마커를 표시할 위치
	          title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	          image : markerImage // 마커 이미지 
	      });
	  
	  }	
	}

};

function area(num){
	  mapOption = { 
  	        center: new kakao.maps.LatLng($(".y"+num).val(),$(".x"+num).val()), // 지도의 중심좌표
  	        level: 3 // 지도의 확대 레벨
  	    };
   var map = new kakao.maps.Map(mapContainer, mapOption); // 새로운 중심좌표 생성
   var positions = [
  	   {
  	        title: '', 
  	        latlng: new kakao.maps.LatLng($(".y"+num).val(),$(".x"+num).val())
  	    } 
  	]; 
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
       var imageSize = new kakao.maps.Size(24, 35); 
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
       var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: positions[0].latlng, // 마커를 표시할 위치
           title : positions[0].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
           image : markerImage // 마커 이미지 
       });
}
</script>
<body>
<div class="container" style="border-left: solid 1px #d1d1d1; border-right: solid 1px #dbdbdb; padding-bottom:5%">
<br>
<span style="color:#6a6a6a">${planner.user_id} 님의 여행 플래너</span>
<div  class="main"><h3 style="color:#ff8e15">${planner.planner_title}</h3>
<div class="heart"><i class="bi bi-heart-fill unlike" onclick="like('unlike')" class="unlike"></i>
<i class="bi bi-heart like" onclick="like('like')" class="like"></i></div>
<a>여행 기간 : ${planner.planner_start} ~ ${planner.planner_end} &nbsp </a> <a>&nbsp&nbsp 지역 : ${planner.planner_area}</a>
</div>
<div class="row">
 <div class="col-sm-6">
<c:forEach begin="1" end="${planner.planner_day}" varStatus="status">
<div id="${status.count}" style="text-align: -webkit-center;">
<h4 style="cursor:pointer; text-align: initial; margin-bottom: 3%; color:#ff8e15; font-weight: 900;" onclick="memo(${status.count})">DAY - ${status.count} <span class="material-symbols-outlined">
location_on
</span></h4>
</div>
<br>
</c:forEach> 
</div>
<div class="col-sm-6" id="lnb">
 <div id="map" style="width:100%;height:400px;"></div>	

<div class="accordion accordion-flush" id="accordionFlushExample">
<c:forEach begin="1" end="${planner.planner_day}" varStatus="status">
<c:if test="${status.count eq 1}"><c:set var="number" value="One" /></c:if>
<c:if test="${status.count eq 2}"><c:set var="number" value="Two" /></c:if>
<c:if test="${status.count eq 3}"><c:set var="number" value="Three" /></c:if>
<c:if test="${status.count eq 4}"><c:set var="number" value="Four" /></c:if>
<c:if test="${status.count eq 5}"><c:set var="number" value="Five" /></c:if>
<c:if test="${status.count eq 6}"><c:set var="number" value="Six" /></c:if>
<c:if test="${status.count eq 7}"><c:set var="number" value="Seven" /></c:if>
 
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading${number}">
      <button class="accordion-button collapsed memo${status.count}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${number}" aria-expanded="false" aria-controls="flush-collapse${number}">
        DAY - ${status.count}
      </button>
    </h2>
    <div id="flush-collapse${number}" class="accordion-collapse collapse" aria-labelledby="flush-heading${number}" data-bs-parent="#accordionFlushExample" >
      <div class="accordion-body" id="memoP${status.count}">
      </div>
    </div>
  </div>

</c:forEach> 
</div>
</div>
</div>
<br>
<br>
<i class="bi bi-heart like" class="like"></i>
<span> 추천수 ${planner.planner_like}&nbsp </span> 
<input type="hidden" name="status" id="status">
<i class="bi bi-chat-right-text"></i>
<span> 댓글 ${commentNum}</span> 
<input type="hidden" value="${planner.user_id}" id="like_id"> 
<input type="hidden" value="${planner.planner_no}" id="like_no"> 
<hr>
<p>댓글</p>	
	
	<% if((String)session.getAttribute("user_id") == null){ %>
	<div style="text-align: center; margin-bottom: 15px"> <a href="user.login.do">로그인</a>이 필요합니다</div>
	<% }else{ %>
	<input type="text" id="comment_content" class="insert" value="" > <button type='button' class='btn' onclick="crud('Cinsert' , 0)">등록</button>
	<%} %>

<c:forEach items="${comment}" var="c" varStatus="status">
<div id="update${c.comment_no}">
<span class="userID">${c.user_id}</span><small class="reg${c.comment_no} date">${c.reg_date}</small>
<c:set var="userID" value="${userID}" />
<button type="button" class="btn btn-light btn-sm test${c.comment_no}" onclick="reply(${c.comment_no})">답글</button>
<c:if test="${c.user_id eq userID}">
<button type="button" class="btn btn-light btn-sm test${c.comment_no}" onclick="update(${c.comment_no})">수정</button> 
<button type="button" class="btn btn-light btn-sm test${c.comment_no}" onclick="deletes(${c.comment_no})">삭제</button>
</c:if>
<br>
<textarea class="${c.comment_no} comment_reply" readonly name="content" >${c.comment_content}</textarea>
</div>
	<input class="reply${c.comment_no} insert" type="text" id="reply_content${c.comment_no}" style="display:none">
	<input type="submit" value="등록" style="display:none" class="reply">
	<button type="button" class="btn btn-light btn-sm test${c.comment_no} button${c.comment_no}" onclick="crud('Rinsert' , ${c.comment_no})" style="display:none">등록</button>

	
<p id="reply${c.comment_no}" style="margin-left:4%"></p> 
</c:forEach>
</div>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b96ec8a7c96b4f5663ea3d19a4bbc885"></script>
<script>
//마커를 표시할 위치와 title 객체 배열입니다 
var mapContainer = document.getElementById('map') // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${area.area_mapy},${area.area_mapx}), // 지도의 중심좌표
        level: 12 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>