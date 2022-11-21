<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.springbook.biz.planner.tourSearchVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
</head>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
.number{
    color: black;
    text-decoration: none;
}

.placeimg{
	border-radius:10px;
    margin-right:15px;
    /* margin-top:15px; */
	width:80px;
    height:85px;
}
.input {
  width: 70%;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  resize: none;
  height: 40px;
  font-size: 18px;
  padding-top: 4px;
  border: solid #facd9e;
}
.span{
	font-weight: 600;
    color: #444;
    cursor: pointer;
}

.span2{
	font-size: 18px;
	color: #424345;
	font-weight: 549;
}

.dele:hover{
 color:black;
}

.dele{
color:#808080;
}

input#\31 2 , input#\31 4 , input#\31 5 , input#\33 8 , input#\33 9{
   border-radius: 20px;
}
.btn:focus {box-shadow: none; }
input#\31 2:hover {
background-color: #eef1f4;
}
input#\31 4:hover {
background-color: #eef1f4;
}
input#\31 5:hover {
background-color: #eef1f4;
}
input#\33 8:hover {
background-color: #eef1f4;
}
input#\33 9:hover {
background-color: #eef1f4;
}

.search-bar {
  width: 220px;
  height: 35px;
  border-radius: 15px;
  border: solid 1px rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: left;
  z-index: 1;
  opacity: 1;
  padding-bottom: 2px;
  display: inline-block;
}

input#key {
    border: none;
     height: 25px;
     width:180px; 
     display: inline; 
     box-shadow: none; 
     margin-left:8px;
     margin-top: 2px
}
input#key:focus {
   outline: none;
}
</style>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<div style="margin-left: 5%; margin-right: 5%;">

 <form action="testValue.do" id="testValue" method="post">  
<div class="container-fluid" style="margin-top: 3%;">
<div class="row">
<div class="col-sm-6" >
<div id="map" style="width:100%;height:250px;"></div>
<div>
			
          	<div id="div">
<input type="hidden" id="areaNumber">
       <div id="buttons" style="margin-top:2%;">
     <div class="btn-group">
	<select name="areaNum" onchange="area()" id="areaNum" class="form-select form-select-sm" aria-label=".form-select-sm example" style="box-shadow: none;">  
			<option>지역변경</option>
			<c:forEach items="${AreaList}" var="area" >
			<option value="${area.area_num}">${area.area_name}</option>
			</c:forEach>
			</select>
			</div>
		<div class="search-bar">
      <input type="text" class="search-bar__input" type="text" placeholder="검색" id="key" value="">
      <span class="material-symbols-outlined" style="vertical-align: middle; cursor:pointer; " onclick="test00(0)">search</span></div>
        
         <input type="button" id="12" onclick="test00(12)" value="관광지" class="btn btn-sm test" style="border-color: #4d4d4d;color: #4d4d4d; margin-left:3%">
			<input type="button" id="14" onclick="test00(14)" value="문화시설" class="btn btn-sm" style="border-color: #4d4d4d;color: #4d4d4d;">
			<input type="button" id="15" onclick="test00(15)" value="행사/공연/축제" class="btn btn-sm" style="border-color: #4d4d4d;color: #4d4d4d;">
			<input type="button" id="38" onclick="test00(38)" value="쇼핑" class="btn btn-sm" style="border-color: #4d4d4d;color: #4d4d4d;">
			<input type="button" id="39" onclick="test00(39)" value="음식점" class="btn btn-sm" style="border-color: #4d4d4d;color: #4d4d4d;">
		    <button id="kate" onclick="test00(12)" value="12" style="display:none">카테고리</button>
		     </div>
          <div class="row">
      <div class="col col2" style="height:500px;">
      <div class="offcanvas offcanvas-start show" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasLabel">TIP</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
 		 </div>
  		<div class="offcanvas-body">
   			<p><img src="${pageContext.request.contextPath}/resources/img/icon1.png">&nbsp; 검색버튼을 눌러 다양한 관광정보를 확인해보세요</p><br>
   			<p><img src="${pageContext.request.contextPath}/resources/img/icon3.png">&nbsp; 다른 지역의 관광정보까지 플래너에 담아 볼 수 있습니다</p><br>
   			<p><img src="${pageContext.request.contextPath}/resources/img/icon5.png">&nbsp; 장소선택을 클릭하여 플래너에 직접 장소등록을 해보세요(최대 8개까지)</p><br>
   			<p><img src="${pageContext.request.contextPath}/resources/img/icon4.png">&nbsp; 메모버튼을 눌러 일자별로 메모작성이 가능합니다</p><br>
   			<p><img src="${pageContext.request.contextPath}/resources/img/icon2.png">&nbsp; 플래너를 다른사람과 공유하고 싶다면 전체공개로 바꿔주세요</p>
 		 </div>
	</div>
                  <div class="wrap-loading" style="text-align-last: right ; margin-top: 120px; display:none">
                  
<div class="spinner-grow " role="status" style="background-color: #19558c;">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow " role="status" style="background-color: #416a8f;">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow " role="status" style="background-color: #758fa8;">
<span class="visually-hidden"></span>
</div>
</div>
      </div>
      <div class="col col1" style="height:80%">
           <div class="wrap-loading" style="margin-top: 120px; display:none">
<div class="spinner-grow " role="status" style="background-color: #bfe3b2;">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow " role="status" style="background-color: #a1cf91;">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow " role="status" style="background-color: #80c469;">
<span class="visually-hidden"></span>
</div>
</div></div>
    </div>
          	</div>
          	<div style="text-align-last: center;">
          	<input type="hidden" id="be" value="1" >
          	<input type="button" value="이전" onclick="test00(1)" style="display:none" class="butt btn btn-link">
          	<input type="hidden" id="af" value="1"> 
          	<input type="button" onclick="test00(2)" value="다음" style="display:none" class="butt btn btn-link"> 
			</div>
</div>
			</div>
<div class="col-sm-6">

<!-- <form action="testValue.do" method="post"> -->
	<div style="padding-left:30px;">
			<div>
			<div class="form-check form-switch" style="margin-top:10px">
  			<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" onclick="show()">
  			<input type="hidden" value="N" name="planner_show" id="show_c" onclick="show()">
  			<label class="form-check-label" for="flexSwitchCheckDefault" id="test">비공개</label>
			</div>
	<textarea onkeydown="return captureReturnKey(event);" id="title"  placeholder="여행 제목을 정해주세요 (최대 40자)" name="planner_title" class="input" maxlength="40" required></textarea><br>
	<a id="h2" style="display: inline-block; margin-bottom:10px"><%= session.getAttribute("areaname") %></a>
	<a><%= session.getAttribute("start") %> ~ <%= session.getAttribute("end") %></a>
	<% for(int i=1; i<=Integer.parseInt((String)session.getAttribute("date")) + 1; i ++){ %>
				<div style="height:70px;"><h5 id='p<%= i %>' class="cn"><span class="memo<%= i %>">DAY-<%= i %></span>
			 <i class="bi bi-journal-text zoom bo<%= i %>" onclick="memo('<%= i %>')" style=" cursor: pointer; font-size' : '22px">
				<i class="bi bi-plus bo<%= i %> bo2<%= i %>" style="font-size' : '22px"></i></i>
				 </h5>
					<input type="hidden" value=" " name="content" id="val<%= i %>">
					</div>	
			<% } %>
				<div>
			<p id="plus"></p>
			</div>
			<a class="number" style="display:none">중복방지용 태그</a>
			<div id="date">
			</div>
			</div>
			<div class="form-group">
			<div id="memo" style="font-size:20px; width:200px; height:40px"><span>DAY-</span></div>
  <textarea class="form-control" rows="5" id="content" style="resize: none; box-shadow: none;" placeholder="메모 아이콘을 클릭하여 일자별로 메모기능을 사용해보세요!"></textarea>
  			<div style="text-align: center; margin-top: 2%;">
  			<input type="submit" value="임시저장" class="btn" style="background-color: #ff8e15; color: white;">
			<input type="button" value="숙소 둘러보기" onclick="room()" class="btn" style="background-color: #ff8e15; color: white;">
			</div>
</div>
			</div>
			</div>
			</form> 
<script>
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

function captureReturnKey(e) { 
	if(e.keyCode==13 && e.srcElement.type != $("#title")) 
	return false; 
	}


function submits(num){
	//애니메이션 추가 글 등록시
	 $(".bo"+num).animate({
		'font-size' : '30px' 
	});  
	  $(".bo"+num).animate({
			'font-size' : '22px' 
		}); 
	$(".bo2"+num).css("background-color" , "bisque")
	$("#val"+num).val($("#content").val());
}

function memo(num){
  var memo = $(".memo" + num).html();
  $("#memo").html(memo);
  $("#memo").append("&nbsp<i class='bi bi-journal-text zoom' onclick='submits("+num+")' style=' cursor: pointer; font-size' : '22px'><i class='bi bi-plus' style='font-size : 22px'></i></i>");
  $("#content").val($("#val"+num).val());
}
function area(){
	var areanum = $("#areaNum").val();
	$.ajax({
		url:"areaNum.do",
		type: "GET",
		cache: false,
		dataType: "json",
		data:{"areaNum" : areanum} ,
		success:function(data){
			$("#h2").html(data.area_name);
			$("#areaNumber").val(data.area_num);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(data.area_mapy, data.area_mapx), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
		    };
			var map = new kakao.maps.Map(mapContainer, mapOption);
		},
		error : function(e){
			alert(e);
		}
	});
}
var inRun = '';
function test00(tval) {
		
		if(inRun == true){
			return;
		}
		
		isRun = true;
	    var page = "";
		var pageNum = 1;
		var keyword = "";
		var kate = 12;
		var areanum = $("#areaNumber").val();
		
		if(tval != null){
			if(tval == 0){
				kate = 0;
			}
			if(tval == 1){
				page = "이전";
				pageNum = $("#be").val();
			}
			if(tval == 2) {
				page = "다음";
				pageNum = $("#be").val();
			}
			if(tval >= 12){
				kate = tval;
				$(".btn").css({
					'border-color': '#4d4d4d' , 
					'border': 'solid 1px' ,
			    	'font-weight': ''
				})
				$("#"+kate).css({
					'border': 'solid 2px' ,
			    	'font-weight': '700'
				})
			}else if($("#kate").length > 0){
				kate = $("#kate").val();
			}
		
		} 
	 	if(areanum == ""){
	 		areanum = ${Area.area_num};
	 	}
	 	keyword = $('#key').val();
		
 		$.ajax({
 		url : "test.do",
 		method : "GET",
 		datatype : "json",
 		data : {"page" : page , "pageNum" : pageNum , "keyword" : keyword , "kate" : kate , "areaNum" : areanum} ,
 		success : function(data) {
 			inRun = false;
 			var num = 0;
 			var str = "";
 			var str2 = "";
			var img = "";
				for(var i = 1; i <= data[0].date+1; i++){
 					str += "<option id='o"+i+"' value='"+i+"'>"+i+"일차</option>";
 				}
 			
			$(".butt").css("display" , "");
				
 			$(data).each(function(){
				var className = 'col1'; 
				
				if(num < 4){
					className = 'col2';
				}
				
 				if(this.firstimage == ""){
 					img = "${pageContext.request.contextPath}/resources/img/map.png";
 				}else{
 				 	img = this.firstimage
 				}
 			console.log(this.mapx);

 			$("." + className).append("<div class='delete' style='margin-top:15px'>  <img src='"+img+"' style='width:90px;height:90px; float: left;' class='delete placeimg'>"+
 					"<span onclick='test("+num+")' id='"+num+"' class='delete span' style='vertical-align:top;'>"+this.title+"</span><br class='delete'> <small id='add"+num+"' class='delete' style='vertical-align:buttom;'>"+this.addr1+"</small><select class='delete form-select form-select-sm' aria-label='.form-select-sm example' id='select' onchange='test("+num+" , value)' style='width: 101px; box-shadow: none;'> <option>장소선택</option>"+str+"</select></div><br class='delete'>" + 
 					"<input  type='hidden' class='areaData"+num+" delete' value='"+this.title +"==="+ this.addr1 +"==="+ this.mapx +"==="+ this.mapy+"==="+img+"'>"+
 					"<a href='#' onclick='test()' id='x"+num+"' style='display:none;' class='delete'>"+this.mapx+"</a>" + 
 					"<a href='#' onclick='test()' id='y"+num+"' style='display:none;' class='delete'>"+this.mapy+"</a>")
 			num += 1;
 			});
 			$("#be").attr("value" , data[0].pageNum);
 			$("#key").attr("value" , data[0].keyword);
 			$("#kate").attr("value", data[0].kate);
 			var kate = data[0].kate;
 		},
 	   beforeSend:function(){
 		    inRun = true;
 	        $('.wrap-loading').css('display', '');
 	    }

 	    ,complete:function(){
 	        $('.wrap-loading').css('display', 'none');
 	    }
 	    ,
 		error : function() {
 			inRun = false;
 			alert("실패");
 		}
 }); 
	
	$(".delete").remove();
	
}

function room(){
	$("#testValue").append("<input type='hidden' value='ok' name='roomPage'>");
	$("#testValue").submit();
}
</script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b96ec8a7c96b4f5663ea3d19a4bbc885"></script>

<script>
//마커를 표시할 위치와 title 객체 배열입니다 
var mapContainer = document.getElementById('map') // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${Area.area_mapy},${Area.area_mapx}), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>

<script>

function test(num , value) {
	  var title = $('#' + num).text();
      var addr = $('#add' + num).text();
	  var mapy = $('#y' + num).text();
	  var mapx = $('#x' + num).text();
	  var arrNumber = new Array();
	  arrNumber[0] = "start";
	  if(!($("#p" + value).text().includes(title))){ // 장소 중복 등록 방지
			 if($("#p" + value).children(".number").length < 8 ){
				$("#p" + value).append("<span class='number "+$('.number').length+" span2'> " +title + "</span> <i onclick='button("+$('.number').length+")' class='"+$('.number').length+" bi bi-x-lg dele'></i> " + 
				"<i class='bi bi-arrow-right "+$('.number').length+"'></i><input class='"+$('.number').length+"' type='hidden' value='"+value+"==="+$(".areaData"+num).val()+"' name='placeTab' >");
			 }else alert("장소 등록은 8개까지 가능합니다")
			 }else alert("중복된 장소가 존재합니다")  
     mapOption = { 
    	        center: new kakao.maps.LatLng(mapy,mapx), // 지도의 중심좌표
    	        level: 3 // 지도의 확대 레벨
    	    };
     var map = new kakao.maps.Map(mapContainer, mapOption); // 새로운 중심좌표 생성
     var positions = [
    	   {
    	        title: '카카오', 
    	        latlng: new kakao.maps.LatLng(mapy, mapx)
    	    } 
    	]; 
     
     var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
     
     for (var i = 0; i < positions.length; i ++) {
         
         // 마커 이미지의 이미지 크기 입니다
         var imageSize = new kakao.maps.Size(24, 35); 
         
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
     
};

function button(num){
	 if($('.number').length >= 0){
		 	
		   $("." + num).remove();   
	  }
}

function show(){
	if($("#test").html() == "비공개"){
		$("#test").html('전체공개');
		$("#show_c").val('Y');
	}else if($("#test").html() == "전체공개"){
		$("#test").html('비공개');
		$("#show_c").val('N');
	}
}

function room(){
	$("#testValue").append("<input type='hidden' value='ok' name='roomPage'>");
	$("#testValue").submit();
}

</script>
</div>	
<%@ include file="../footer.jsp"%>	
</body>
</html>