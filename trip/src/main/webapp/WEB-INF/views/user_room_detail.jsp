<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 상세 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>

$(document).ready(function(){
	
});

function f_searchAddr(addr) {
	
	var addr_spt = [];
	
	addr_spt = addr.split(" ");
	
	var searchAddr = addr_spt[0];
	
	location.href="u_searchRoomList.do?room_addr=" + searchAddr;
}

function f_moveInsertRes() {
	
	var checkIn = document.getElementById("u_room_checkin");
	
	var checkOut = document.getElementById("u_room_checkout");
	
	var people = document.getElementById("res_num");
	
	var oneNightPrice = "${u_room.room_price}";
	
	checkInValue = $(checkIn).val();
	
	checkOutValue = $(checkOut).val();
	
	var checkInValue_arr = checkInValue.split("-");
	
	var checkOutValue_arr = checkOutValue.split("-");
	
	checkInValue = new Date(checkInValue_arr[0], checkInValue_arr[1], checkInValue_arr[2]);
	
	checkOutValue = new Date(checkOutValue_arr[0], checkOutValue_arr[1], checkOutValue_arr[2]);
	
	var period = ( checkOutValue.getTime() - checkInValue.getTime() ) / (1000*60*60*24);
	
	peopleValue = $(people).val();
	
	oneNightPrice = parseInt(oneNightPrice);
	
	console.log(oneNightPrice);
	
	if(peopleValue <= 2) {
		
		var price_result = oneNightPrice * period;
		
	} else {
		
		var price_result = (oneNightPrice * period) + 10000 * (peopleValue - 2);
	}
	
	checkInValue = $(checkIn).val();
	
	checkOutValue = $(checkOut).val();
	
	location.href = "pay.do?room_id=" + "${u_room.room_id}" + "&res_checkin=" 
			+ checkInValue + "&res_checkout=" + checkOutValue + "&res_num=" + peopleValue + "&pay_amount=" + price_result;
}

</script>

<style>
	#u_room_img_main {
		float: left;
	}
	
	#u_room_sml_desc {
		clear: both;
	}
</style>
</head>
<body>
	<div id="u_room_img_box">
	
	<div id="u_room_img_main">
	<img src="resources/room_img/${u_room.room_img_no1}" alt="숙소 대표 이미지" title="숙소 대표 이미지" width="350" height="400" />
	</div>
	
	<div id="u_room_img_subs">
	<div id="u_room_img_subs1">
	<img src="resources/room_img/${u_room.room_img_no2}" alt="숙소 서브1 이미지" title="숙소 서브1 이미지" width="200" height="250" />
	<img src="resources/room_img/${u_room.room_img_no3}" alt="숙소 서브2 이미지" title="숙소 서브2 이미지" width="200" height="250" />
	</div>
	
	<div id="u_room_img_subs2">
	<img src="resources/room_img/${u_room.room_img_no4}" alt="숙소 서브3 이미지" title="숙소 서브3 이미지" width="200" height="250" />
	<img src="resources/room_img/${u_room.room_img_no5}" alt="숙소 서브4 이미지" title="숙소 서브4 이미지" width="200" height="250" />
	</div>
	</div>
	
	</div>
	
	<div id="u_room_infos&paybtn">
	<div id="u_room_sml_desc">
	<span>${u_room.room_name}/<a href="#" onclick="f_searchAddr('${u_room.room_addr}')">${u_room.room_addr}</a>/${u_room.room_max}/${u_room.room_likes}</span>
	</div>
	
	<div id="u_room_price_div">
	<span>${u_room.room_price}&nbsp;<small>(1박당 가격 2인 기준)</small></span>
	</div>
	
	<button onclick="f_moveInsertRes()">예약하기</button>
	</div>
	
	<div id="u_room_numbers">
	
	<div id="u_room_calander_box">
	<input id="u_room_checkin" type="date" name="res_checkin" />
	<input id="u_room_checkout" type="date" name="res_checkout" />
	</div>
	
	<div id="res_num_box">
	<input id="res_num" type="number" name="res_num" />
	</div>
	
	<div id="u_room_results">
	<div>체크인 날짜</div>
	<div>체크아웃 날짜</div>
	<div>총 인원</div>
	<div>최종 결제 금액</div>
	</div>
	
	</div>
	
	<div id="u_room_conditions">
	
	<!-- https://iconmonstr.com/ -->
	
	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 2c5.514 0 10 4.486 10 10s-4.486 10-10 10-10-4.486-10-10 4.486-10 
	10-10zm0-2c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.894 14.992c.485-.514 1.154-.832 1.894-.832s1.408.318 1.894.832l-1.894 
	2.008-1.894-2.008zm-.874-.927c.709-.751 1.688-1.215 2.768-1.215s2.059.465 2.768 1.216l1.164-1.236c-1.006-1.067-2.396-1.727-3.932-1.727s-2.926.66-3.932 1.727l1.164 1.235zm-2.038-2.163c1.23-1.304 
	2.929-2.11 4.806-2.11s3.576.807 4.806 2.111l1.194-1.267c-1.535-1.629-3.656-2.636-6-2.636s-4.465 1.007-6 2.636l1.194 1.266z"/></svg>
	
	<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M14.872 17.711c-.29.54-1.002.918-1.729.918-.447 
	0-.849-.147-1.15-.416-.301.269-.704.416-1.149.416-.729 0-1.44-.378-1.73-.918-.309-.576.536-1.14.94-.424.102.181.432.375.761.375.692 0 .631-.738.631-1.3-.423-.211-.717-.63-.717-1.006 
	0-.527.57-.762 1.271-.762s1.271.235 1.271.762c0 .38-.299.805-.73 1.014 0 .587-.056 1.254.599 1.254.341 0 .729-.208.863-.393.45-.624 1.185-.106.869.48zm.128-6.211c-.459 0-.833.374-.833.834 
	0 .459.374.833.833.833.459 0 .833-.374.833-.833 0-.46-.374-.834-.833-.834zm0 2.667c-1.011 0-1.833-.822-1.833-1.833 0-1.012.822-1.834 1.833-1.834 1.011 0 1.833.822 1.833 1.834 0 1.011-.822 1.833-1.833 1.833zm-6-2.667c-.46 
	0-.834.374-.834.834 0 .459.374.833.834.833.459 0 .833-.374.833-.833 0-.46-.374-.834-.833-.834zm0 2.667c-1.011 0-1.834-.822-1.834-1.833 0-1.012.823-1.834 1.834-1.834 1.011 0 1.833.822 1.833 1.834 0 1.011-.822 1.833-1.833 1.833zm12.113 
	3.986c-.78-7.61-2.462-11.289-4.568-13.869-1.21 1.055-2.044 1.769-3.321 3.667-.74-.121-1.769-.119-2.486.006-1.538-1.838-2.574-2.676-3.813-3.654-2.037 2.484-3.503 6.137-4.117 13.723-1.14-1.732-1.808-3.801-1.808-6.026 0-6.065 4.934-11 11-11 6.065 0 11 4.935 11 11 
	0 2.277-.696 4.396-1.887 6.153zm-9.113 4.847c-3.298 0-6.254-1.466-8.272-3.772.304-4.521 1.094-10.361 3.357-13.517 1.728 1.421 2.717 2.682 3.276 3.359.748-.19 1.823-.358 3.316.007.96-1.452 1.508-2.222 2.74-3.347 1.989 2.717 3.26 7.267 3.8 13.558-2.017 2.271-4.949 3.712-8.217 
	3.712zm0-23c-6.623 0-12 5.377-12 12 0 6.627 5.4 12 12 12 6.559 0 12-5.33 12-12 0-6.623-5.377-12-12-12z"/></svg>
	
	<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm6.997 20.486c2.444-2.019 
	4.003-5.072 4.003-8.486 0-6.071-4.929-11-11-11s-11 4.929-11 11c0 4.27 2.439 7.975 5.998 9.798v-3.228c0-.691-.441-.917-1.384-1.673-.698-.56-1.177-1.433-1.089-2.322.252-2.537.862-7.575.862-7.575l.909.003-.597 
	5.997h1.291l.005-6h1l-.002 6h1.003l-.001-6h1l.004 6 1.34.002-.675-6.002h.887c.002.011.675 5.008.951 7.55.098.902-.409 1.792-1.121 2.356-.95.751-1.382.967-1.382 1.669v4.243c.649.12 1.318.182 2.001.182 1.409 0 
	2.756-.265 3.994-.749l.001-3.251h-2.467c.802-6.996 3.103-12 4.66-12 .447 0 .804.357.807.851.008 1.164.004 6.814.002 12.635zm-7.563-6.486h-5.845c-.067.642-.26 1.387.651 2.117.938.754 1.758 1.231 1.758 2.453v3.678c.326.128.66.24 
	1.001.337v-4.01c0-1.237.811-1.7 1.761-2.453.944-.747.75-1.464.674-2.122zm6.561 7.222l.002-13.029c-1.14 1.352-2.563 4.206-3.31 9.809h2.308l-.001 3.8c.345-.176.679-.37 1.001-.58z"/></svg>
	
	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19.688 5.176c0 .82-.603 1.109-1.423 1.109h-.509v-2.178h.704c.775 0 1.228.283 1.228 1.069zm4.312-1.884v6.417c0 1.265-1.026 2.291-2.292 2.291h-6.417c-1.265 0-2.291-1.026-2.291-2.292v-6.416c0-1.266 
	1.026-2.292 2.292-2.292h6.417c1.265 0 2.291 1.026 2.291 2.292zm-2.75 1.829c0-.759-.231-1.33-.691-1.713-.461-.383-1.134-.574-2.019-.574h-2.331v7.333h1.547v-2.609h.664c.905 0 1.603-.209 2.094-.627.49-.418.736-1.021.736-1.81zm-4.25 11.378c0 .828.672 1.5 1.5 1.5s1.5-.672 1.5-1.5-.672-1.5-1.5-1.5-1.5.671-1.5 1.5zm-8.5.501c-.276 
	0-.5.223-.5.499s.224.5.5.5h7c.276 0 .5-.224.5-.5s-.224-.499-.5-.499h-7zm-4.5-.501c0 .828.672 1.5 1.5 1.5s1.5-.672 1.5-1.5-.672-1.5-1.5-1.5-1.5.671-1.5 1.5zm-1.298-6.5h-2.202c-.276 0-.5.224-.5.5v.511c0 .793.926.989 1.616.989l1.086-2zm19.006 4.001h-1.511c.474.89.803 1.655.803 2.972 0 1.673-1.355 3.028-3.026 3.028h-11.948c-1.671 
	0-3.026-1.355-3.026-3.028 0-1.641.506-2.421 1.184-3.678 1.041.206 3.967.705 7.816.705.877 0 1.728-.029 2.532-.076-1.203-.217-2.227-.933-2.859-1.929-2.895-.023-5.237-.339-6.478-.55.382-.686.779-1.386 1.184-2.061.67-1.117.852-1.149 1.39-1.246 1.011-.181 1.984-.272 3.231-.302v-2.002c-1.382.031-2.451.132-3.585.335-1.381.248-1.965.875-2.751 
	2.187-.981 1.637-1.913 3.382-2.684 4.812-.687 1.273-.98 2.411-.98 3.805 0 1.318.42 2.415 1 3.817v2.209c0 .553.448 1.002 1 1.002h1.5c.552 0 1-.449 1-1.001v-1h13v1c0 .552.448 1.001 1 1.001h1.5c.552 0 1-.449 1-1.001v-2.209c.58-1.403 1-2.499 1-3.817 0-1.109-.196-2.058-.618-3.041-.221.035-.443.068-.674.068z"/></svg>
	
	<!-- https://iconify.design/ -->
	
	<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path fill="currentColor" d="M2 18c2.22-1 4.44-2 6.67-2c2.22 0 4.44 2 6.66 2c2.23 0 4.45-2 
	6.67-2v3c-2.22 0-4.44 2-6.67 2c-2.22 0-4.44-2-6.66-2c-2.23 0-4.45 1-6.67 2v-3m6.67-5c-.78 0-1.55.12-2.32.32l4.92-3.44l-1.04-1.24c-.14-.17-.23-.4-.23-.64c0-.34.17-.65.44-.83l5.72-4l1.15 1.63l-4.84 3.39l5.23 
	6.23c-.79.33-1.58.58-2.37.58c-2.22 0-4.44-2-6.66-2M18 7a2 2 0 0 1 2 2a2 2 0 0 1-2 2a2 2 0 0 1-2-2a2 2 0 0 1 2-2Z"/></svg>
	
	</div>
	
	<div id="u_room_review">
		<div id="u_room_stars"><span>후기</span></div>
		
<%-- 		<c:forEach> --%>
<!-- 			<div id="u_room_review"></div> -->
<%-- 		</c:forEach> --%>
		
		<button onclick="">리뷰 등록하기</button>
	</div>
</body>
</html>