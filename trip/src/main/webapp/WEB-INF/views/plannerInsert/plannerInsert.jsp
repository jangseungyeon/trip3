<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input.btn.btn-lg.button{
 border: solid 1px #ff8e15;
}
input.btn.btn-lg.button:hover{
  background-color: #ff9a2d;
    color: white;
}
.TEXT:hover {
	font-size:25px;
	font-weight:600;
}

.land:hover {
	fill: rgb(235, 210, 122);
}

.con {
  padding-top: 40px;
  padding-bottom: 120px;
}

.input {
    padding: 30px 15px !important;
    border: 1px solid lightgrey !important;
    border-radius: 10px;
    box-sizing: border-box;
    background-color: #fff !important;
    font-size: 18px !important;
    letter-spacing: 1px;
    position: relative;
    font-weight: bold !important;
}

.input1 {
  text-align: left !important;
}

.input2 {
  text-align: right !important;
}

.input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #512DA8;
    outline-width: 0;
}

::placeholder {
    color: #BDBDBD;
    opacity: 1;
}

:-ms-.input-placeholder {
    color: #BDBDBD;
}

::-ms-.input-placeholder {
    color: #BDBDBD;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

.datepicker {
  background-color: #fff;
  border-radius: 0 !important;
  padding: 15px 20px !important;
  align-content: center !important;
}

.datepicker-dropdown {
  top: 0;
  left: calc(50% - 161px) !important;
}

.datepicker-dropdown.datepicker-orient-left:before {
  left: calc(50% - 6px) !important;
}

.datepicker-dropdown.datepicker-orient-left:after {
  left: calc(50% - 5px) !important;
}

.datepicker table tr td.today, span.focused {
  border-radius: 50% !important;
  background-image: linear-gradient(#FFF3E0, #FFE0B2);
}

.datepicker table tr td.today.range {
  background-image: linear-gradient(#eeeeee, #eeeeee) !important;
  border-radius: 0 !important;
}

/*Weekday title*/
thead tr:nth-child(3) th {
  font-weight: bold !important;
  padding-top: 10px;
  padding-bottom: 10px;
}

.old, .day, .new {
  width: 40px !important;
  height: 40px !important;
  border-radius: 0px !important;
  border: 1px solid lightgrey !important;
}

.day.old, .day.new {
  background-color: #F5F5F5 !important;
  color: #E0E0E0 !important;
}

.day.old:hover, .day.new:hover {
  border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
  border-radius: 50% !important;
  background-color: #eee;
}

.active {
  border-radius: 50% !important;
  background-image: linear-gradient(#90CAF9, #64B5F6) !important;
  color: #fff !important;
}

.range-start, .range-end {
  border-radius: 50% !important;
  background-image: linear-gradient(#ff8e15, #ff8e15) !important;
}

.range {
  color: #474747 !important;
}

.prev, .next, .datepicker-switch {
  border-radius: 0 !important;
  padding: 10px 10px 10px 10px !important;
  font-size: 18px;
  opacity: 0.7;
  color: #474747;
}

.prev:hover, .next:hover, .datepicker-switch:hover {
  background-color: inherit !important;
  opacity: 1;
}

@media screen and (max-width: 500px) {
  .datepicker-dropdown.datepicker-orient-right:before {
    right: calc(50% - 6px) !important;
  }

  .datepicker-dropdown.datepicker-orient-right:after {
    right: calc(50% - 5px) !important;
  }
  .container {
	padding-top: 120px;
	
}

.land:hover {
	fill: rgb(255, 249, 70);
}
.TEXT:hover{
text-decoration:underline;
.land 
}
}


</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script>
$(document).ready(function(){
	
	$("#hr1").css({
		"width" : "33%" , 
		"border" : "solid 2px #ff8e15"
	});
	
	$('.input-daterange').datepicker({
		startDate: 'd',
	    format: 'yyyy-mm-dd',
	    autoclose: true
	});
	
	if($( window ).width() <= 450){
		$("#dateCh").html("&nbsp&nbsp여행 날짜 선택");
		$("#areaCh").html("&nbsp&nbsp지역 선택");
		$("#peopleCh").html("&nbsp&nbsp인원수 선택");
		$("#area").css("margin-left" , "0");
		$("#buttonCh").css("margin-left" , "0");
		$(".brDelete").remove();
	}
	
	});
	
	function check() {
		if($(".input").val() == ""){
			alert("날짜를 선택해주세요");
			return false;
		}
		return true;
	}
	
	function back(){
		histroy.go(-1);
	}
	function areaName(id){
		if($(".end").val() != ""){
		if(!($(".start").val() == $(".end").val())){
		var value = $("#ex").val() + $("#LCD"+id).text()
		if($(".num").length > 0){
			$(".land").css({
				"fill" : "#CCCCCC"
			});
			$(".num").remove();
		}
		$("#area").append("<a class='num "+id+"'>#"+$("#LCD"+id).text()+"</a>");
		$("#ex").attr('value' , $("#LCD"+id).text());
		
		const offset = $(".3").offset();
		$('html, body').animate({scrollTop: offset.top}, 700);
		$(".LCD" + id).css({
			"fill" : "rgb(233, 194, 53)"
		});
		$("#hr3").css({
		"width" : "33%" , 
		"border" : "solid 2px #ff8e15"
	});
			
		}else {
			alert("종료일을 선택해주세요");
			const offset = $(".1").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
			
		}else {
			alert("날짜를 선택해주세요");
			const offset = $(".1").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
		}
	}

	function change(){
		  const date1 = new Date($(".start").val());
		  const date2 = new Date($(".end").val());
		  
		  const diffDate = date1.getTime() - date2.getTime();
		  
		 if(Math.abs(diffDate / (1000 * 60 * 60 * 24)) > 6){
			 alert("일수가 최대 7일을 넘었습니다");
			 $(".end").val('');
		 }else if($(".start").val() != $(".end").val()){
			const offset = $(".2").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
			$("#hr2").css({
			"width" : "33%" , 
			"border" : "solid 2px #ff8e15"
		});
			$("#date").val(Math.abs(diffDate / (1000 * 60 * 60 * 24)));
		}
		
	}
	
	function last(num){
		
	if($(".end").val() == ""){
			alert("날짜를 선택해주세요");
			$('#numP').val('0');
			const offset = $(".1").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
			return false;
		}else if(($(".start").val() == $(".end").val())){
			alert("종료일을 선택해주세요");
			$('#numP').val('0');
			$(".end").val('');
			const offset = $(".1").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
			return false;
		}else if(!($(".start").val() < $(".end").val())){
			alert("종료일을 다시 선택해주세요");
			$('#numP').val('0');
			const offset = $(".1").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
			return false;
		}else if($(".num").length == 0){
			alert("지역을 선택해주세요");
			$('#numP').val('0');
			const offset = $(".2").offset();
			$('html, body').animate({scrollTop: offset.top}, 500);
			return false;
		}else if($("#numP").val() == '0' && num == 20){
			alert("인원수를 선택해주세요");
			return false;
		}

	}

function old(){
	$(".disabled").addClass("old");
}

  
</script>
<body>
<form action="start.do" onsubmit="return last(20)">
<p class="1"></p><br>
<div class="container px-1 px-sm-5 mx-auto con" >
<hr id="hr1" style="float:left; transition-property: width; transition-duration: 2s; width:0%">
      <h2 id="dateCh">&nbsp&nbsp여행 날짜를 선택해주세요</h2> <br><br><br><br>
      <input type="hidden" name="date" id="date">
    <div class="flex-row d-flex justify-content-center">
      <div class="col-lg-6 col-11">
        <div class="input-group input-daterange" onclick="old()" onchange="old()">
          <input type="text" class="form-control input1 input start" name="start" placeholder="시작일" readonly>
          <input type="text" class="form-control input2 input end" name="end" placeholder="종료일" readonly onchange="change()"><br>
        </div>
        <small style="color: gray; display: block; text-align: right; padding-top:7px">일수는 최대 7일까지 선택 가능합니다</small>
      </div>
    </div>
</div>
	<p class="2" style="margin-bottom:3%"></p>
	<div class="container px-1 px-sm-5 mx-auto">
		<hr id="hr2" style="float:left; transition-property: width; transition-duration: 2s; width:0%">
		
			<h2 id="areaCh">&nbsp&nbsp지역을 선택해주세요</h2>
			<%@ include file="map.jsp" %>
			 </div>
			<p class="3" style="margin-bottom:3%"></p>
			<div class="container px-1 px-sm-5 mx-auto">
  <hr id="hr3" style="float:left; transition-property: width; transition-duration: 2s; width:0%">
 <h2 id="peopleCh">&nbsp&nbsp인원수를 선택해주세요</h2>
      <br>
      <br class="brDelete">
      <br class="brDelete">
      <input type="number" class="form-control input1 input" name="numPeople" style="width:150px; margin:0 auto; margin-bottom:10%;" value="0" onclick="last()" id="numP" min="0" max="20">
        </div>
<div style="text-align: center; margin-bottom:10%;">
	     <input type="hidden" value="ok" name="check" >
	    <a class="btn btn-light btn-lg"href="javascript:history.go(-1)">이전</a>
       <input type="submit" value="선택" class="btn btn-lg button" id="buttonCh" style="margin-left:250px">
        </div>
        </form>
        <%@ include file="../footer.jsp"%>
</body>
</html>