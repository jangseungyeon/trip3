<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.springbook.biz.planner.tourSearchVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import= "org.apache.commons.io.IOUtils" %>
<%@ page import= "org.json.simple.parser.JSONParser" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<body>
<div id="map" style="width:600px;height:300px;"></div>
<script>

function test00(test) {
		var page = "";
		var pageNum = 1;
		var keyword = "";
		
	 	if(test != null){
			if(test == 1){
				page = "이전";
				pageNum = $("#be").val();
			}
			if(test == 2) {
				page = "다음";
				pageNum = $("#be").val();
			}
			keyword = $('#key').val();
		} 
	 	
		
		$.ajax({
		url : "test.do",
		method : "GET",
		datatype : "json",
		data : {"page" : page , "pageNum" : pageNum , "keyword" : keyword } ,
		success : function(data) {
			var num = 0;
			$(data).each(function(){
			
			console.log(this.mapx);
			
			 $("#div").append("<div> <img src='"+this.firstimage+"' style='width:50px;height:50px; float: left;' class='delete'>"+
					"<a href='#' onclick='test("+num+")' id='"+num+"' class='delete' style='vertical-align:top;'>"+this.title+"</a><br> <small id='add"+num+"' class='delete' style='vertical-align:buttom;'>"+this.addr1+"</small></div><br>" + 
					"<a href='#' onclick='test()' id='x"+num+"' style='display:none;' class='delete'>"+this.mapx+"</a>" + 
					"<a href='#' onclick='test()' id='y"+num+"' style='display:none;' class='delete'>"+this.mapy+"</a>") 
			num += 1;
			});
			$("#be").attr("value" , data[0].pageNum);
			$("#key").attr("value" , date[0].keyword);
		},
		error : function() {
			//태그 추가
		}
});
	
	$(".delete").remove();
	
}

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b96ec8a7c96b4f5663ea3d19a4bbc885"></script>

<script>
//마커를 표시할 위치와 title 객체 배열입니다 
var mapContainer = document.getElementById('map') // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.52750352439024, 126.54425244664849), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>

<script>
function test(num) {
// 지도를 생성합니다
      var title = $('#' + num).text();
      var addr = $('#add' + num).text();
	  var mapy = $('#y' + num).text();
	  var mapx = $('#x' + num).text();
	  
	  if(!($('.number').text().includes(title))){ // 장소 중복 등록 방지
			 if($('.number').length < 4 ){
				$("#plus").append("<a class='number "+$('.number').length+"'> " +title + "<a> <button onclick='button("+$('.number').length+")' class='"+$('.number').length+"'>빼기</button>");  
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

</script>
			<input type="text" id="search"> <button onclick="jsp()">jsp에서 데이터 확인</button>

<form action="tourApiHouseSearch.do">
<input type="text" name="title"  placeholder="소제목 입력 창"><br>
<input type="text" placeholder="검색" id="key" value="">
<input type="button" value="데이터 확인" onclick="test00(0)">
</form>
          	<div id="div">
          	</div>
          	<button id="be" onclick="test00(1)" value="1">이전</button>
          	<button id="af" onclick="test00(2)" value="1">다음</button> 
			
			<div>
			<p id="plus"></p>
			
			<a class="number" style="display:none">중복방지용 태그</a>
			</div>
			<select>
			<option>장소등록</option>
			<option>1일차</option>
			<option>2일차</option>
			<option>3일차</option>
			</select>

</body>
</html>