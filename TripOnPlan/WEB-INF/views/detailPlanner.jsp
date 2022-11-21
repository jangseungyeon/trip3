<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!DOCTYPE html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.main{
margin-bottom: 3%;
}
.day{
border: solid 1px #e0dfde;
border-radius: 8px;
height: 75px;
overflow: auto;
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
.col-sm-6 {
    height: 800px;
    overflow: overlay;
}
.day:hover{
	background-color:#f4f4f4;
}
</style>
<script>


(function () {
	var number = ${planner_no};
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

  	function deletes(){
  		
  	      if (!confirm("일정을 삭제하시겠습니까?")) {
             return false;
          } else {
              return true;
          }
  	}
</script>
<body>
<div class="container" style="margin-top:3%">
<div style="text-align: center; border-radius: 50px" class="main"><h3 style="color:#ff8e15">${planner_title}</h3>
<a>여행 기간 : ${planner_start} ~ ${planner_end} &nbsp </a> <a>&nbsp&nbsp 지역 : ${planner_area}</a>
</div>
<div class="row">
 <div class="col-sm-6">
<c:forEach begin="1" end="${planner_day}" varStatus="status">
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
<c:forEach begin="1" end="${planner_day}" varStatus="status">
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
<form action="getAreaList.do" method="post" style="display:inline-block; margin-left:35%; margin-top:10%">
<input type="hidden" value="${user_id}" name="user_id">
<input type="hidden" value="${planner_no}" name="planner_no">
<input type="hidden" value="${planner_area}" name="area">
<button class="btn delete btn-sm">수정하기</button>
</form>
<form action="deletePlanner.do" method="post" style="display:inline-block" onsubmit="return deletes()">
<input type="hidden" value="${user_id}" name="user_id">
<input type="hidden" value="${planner_no}" name="planner_no">
<button class="btn delete btn-sm">일정 지우기</button>
</form>
</div>
</div>
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
<%@ include file="footer.jsp"%>
</body>
</html>