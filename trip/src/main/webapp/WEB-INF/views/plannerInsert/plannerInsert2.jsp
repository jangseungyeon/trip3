<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.springbook.biz.planner.tourSearchVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<div id="map" style="width:800px;height:200px;"></div>
<script>
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
			var mapContainer = document.getElementById('map') // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(data.area_mapy , data.area_mapx), // 지도의 중심좌표
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
 				
 			$(data).each(function(){
 				console.log(this.firstimage == "undefined")
 				
 				if(this.firstimage == ""){
 					img = "./resources/img/none_img.png";
 				}else{
 				 	img = this.firstimage
 				}
 			console.log(this.mapx);
				
 			 $("#div").append("<div class='delete'> <select class='delete' id='select' onchange='test("+num+" , value)'> <option>장소선택</option>"+str+"</select><br class='delete'> <img src='"+img+"' style='width:50px;height:50px; float: left;' class='delete'>"+
 					"<a href='#' onclick='test("+num+")' id='"+num+"' class='delete' style='vertical-align:top;'>"+this.title+"</a><br class='delete'> <small id='add"+num+"' class='delete' style='vertical-align:buttom;'>"+this.addr1+"</small></div><br class='delete'>" + 
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
 			//태그 추가
 			alert("실패");
 		}
 }); 
	
	$(".delete").remove();
	
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
			 if($("#p" + value).children(".number").length < 3 ){
				$("#p" + value).append("<a class='number "+$('.number').length+"'> " +title + "<i onclick='button("+$('.number').length+")' class='"+$('.number').length+" bi bi-calendar2-x'></i>" + 
				"<input class='"+$('.number').length+"' type='hidden' value='"+value+"==="+$(".areaData"+num).val()+"' name='placeTab' >");
			 }else alert("3개까지")
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

</script>
<form action="testValue.do"> 
<!-- <form action="testValue.do" method="post"> -->
<h2 id="h2"><%= session.getAttribute("areaname") %></h2>
<input type="hidden" id="areaNumber">
<input type="text" id="title"  placeholder="소제목 입력 창" name="planner_title"><br>
<input type="text" placeholder="검색" id="key" value="">
<input type="button" value="검색" onclick="test00(0)">
<br>
			<select name="areaNum" onchange="area()" id="areaNum">  
			<option>지역변경</option>
			<c:forEach items="${AreaList}" var="area" >
			<option value="${area.area_num}">${area.area_name}</option>
			</c:forEach>
			</select>
			<input type="button" id="12" onclick="test00(12)" value="관광지">
			<input type="button" id="14" onclick="test00(14)" value="문화시설">
			<input type="button" id="15" onclick="test00(15)" value="행사/공연/축제">
			<input type="button" id="38" onclick="test00(38)" value="쇼핑">
			<input type="button" id="39" onclick="test00(39)" value="음식점">
		    <button id="kate" onclick="test00(12)" value="12" style="display:none">카테고리</button>
			
          	<div id="div">
          	
<div class="wrap-loading" style="display:none">
<div class="spinner-grow text-secondary" role="status">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow text-success" role="status">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow text-danger" role="status">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow text-warning" role="status">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow text-info" role="status">
<span class="visually-hidden"></span>
</div>
<div class="spinner-grow text-light" role="status">
<span class="visually-hidden"></span>
</div>
</div>
          	</div>
          	<input type="button" id="be" onclick="test00(1)" value="1">이전
          	<input type="button" id="af" onclick="test00(2)" value="1">다음 
			<% for(int i=1; i<=Integer.parseInt((String)session.getAttribute("date")) + 1; i ++){ %>
					<p id='p<%= i %>' class="cn">DAY-<%= i %></p>
			<% } %>
			<div>
			<p id="plus"></p>
			</div>
			<a class="number" style="display:none">중복방지용 태그</a>
			<div id="date">
			</div>
			<input type="submit" value="저장">
			공개설정
			<div class="form-check form-switch">
  			<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
  			<input type="hidden" value="N" name="planner_show" id="show_c">
  			<label class="form-check-label" for="flexSwitchCheckDefault" onclick="show()" id="test">비공개</label>
			</div>
			</form>
		

</body>
</html>