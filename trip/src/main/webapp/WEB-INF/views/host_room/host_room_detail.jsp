<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.springbook.biz.room.RoomVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 상세 페이지</title>

<%@ include file="../host_header.jsp" %>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
	function f_roomDelete() {

		var deleteYnF = confirm("${room.room_name}" + " 을/를 삭제하시겠습니까?");

		if (deleteYnF == true) {

			location.href = "deleteRoom.do?room_id=" + "${room.room_id}"
					+ "&host_id=" + "${room.host_id}";

		} else {
			alert("삭제를 취소하셨습니다.");
			return;
		}
	}

	function f_roomUpdateFinal() {
		var updateYnF = confirm("${room.room_name}" + " 을/를 수정하시겠습니까?");

		if (updateYnF == true) {

			document.getElementById("hostRoomDetailfrm").submit();
		} else {
			
			alert("수정을 취소하셨습니다.");
			
			document.getElementById("updateRoom").innerText = "수정하기";
			
			document.getElementById("updateRoom").removeAttribute("onclick");
			
			document.getElementById("updateRoom").setAttribute("onclick", "f_roomUpdateGo()");
			
			$('input').attr("disabled", true);
			
			return;
		}
	}

	function f_roomUpdateGo() {
		
		//이 함수를 발동시키면 기존에 input들의 disabled 속성을 비활성화 (작성 가능하게 함)

		$('input').attr("disabled", false);

		document.getElementById("updateRoom").innerText = "수정완료";
		
		//기존 버튼 텍스트 "수정하기"에서 "수정완료"로 바꿈

		document.getElementById("updateRoom").removeAttribute("onclick");
		
		//만일의 오류에 대비해 기존 onclick 속성 자체를 지우고

		document.getElementById("updateRoom").setAttribute("onclick", "f_roomUpdateFinal()");
		
		//onclick 속성 새로 부여 + 속성값 사용자 정의 함수 지정 (alert 띄우고 확인 누르면 form 제출)

	}
	
	<% RoomVO room = (RoomVO) request.getAttribute("room");
	
	String room_img_no1 = room.getRoom_img_no1();
	String room_img_no2 = room.getRoom_img_no2();
	String room_img_no3 = room.getRoom_img_no3(); 
	String room_img_no4 = room.getRoom_img_no4();
	String room_img_no5 = room.getRoom_img_no5(); %>
	
	var room_vo_image2 = "<%=room_img_no2%>";
	
	var room_vo_image3 = "<%=room_img_no3%>";
	
	var room_vo_image4 = "<%=room_img_no4%>";
	
	var room_vo_image5 = "<%=room_img_no5%>";

	$(function(){
		
		//페이지 로딩 되자마자 모든 input 창 disabled 활성화

		$('input').attr("disabled", true);
		
		$('#room_img_sub1').hide();
		$('#room_img_sub2').hide();
		$('#room_img_sub3').hide();
		$('#room_img_sub4').hide();
		
		$(".room_img_sub1_btn").click(function(){
			
			$(this).parent().prev().toggle();
			
		});
		
		$(".room_img_sub2_btn").click(function(){
			
			$(this).parent().prev().toggle();
			
		});
		
		$(".room_img_sub3_btn").click(function(){
			
			$(this).parent().prev().toggle();
			
		});
		
		$(".room_img_sub4_btn").click(function(){
			
			$(this).parent().prev().toggle();
			
		});
		
		
		var room_images = ['${room.room_img_no2}', '${room.room_img_no3}', '${room.room_img_no4}', '${room.room_img_no5}'];
		
		for(var i = 0; i < room_images.length; i++) {
			
			var room_image = room_images[i];
			
			if(room_image == room_vo_image2) {
				
				document.getElementById("room_img_sub1").style.display = "block";
				
				document.getElementsByClassName("room_img_sub1_btn")[0].style.display = "none";
				
			} else if(room_image == room_vo_image3) {
				
				document.getElementById("room_img_sub2").style.display = "block";
				
				document.getElementsByClassName("room_img_sub2_btn")[0].style.display = "none";
				
			} else if(room_image == room_vo_image4) {
				
				document.getElementById("room_img_sub3").style.display = "block";
				
				document.getElementsByClassName("room_img_sub3_btn")[0].style.display = "none";
				
			} else if(room_image == room_vo_image5) {
				
				document.getElementById("room_img_sub4").style.display = "block";
				
				document.getElementsByClassName("room_img_sub4_btn")[0].style.display = "none";
			}
		}
			
		
		//숙소 주변 환경 테마 여러개라면 아래 if문 탐 ( ex) sea, valley, moutain...,n 이 모든게 한 문자열로 들어감)
		
		var room_themes = '${room.room_theme}';
		
		if(room_themes.includes(",")){
			
			//일단 빈 배열 만들고
			
			var room_themes_arr = new Array();
			
			//값이 여러개 들어간, ","로 구분된 숙소 테마를 split으로 "," 단위로 끊어 배열로 반환
			
			room_themes_arr = room_themes.split(",");
			
			console.log(room_themes_arr);
			
			for (var i = 0; i < room_themes_arr.length; i++) {
				
				//배열 요소 요소마다 특정값을 가지면 그 값에 따라 정해진 input창을 미리 체크해둠 (입력 미리 됨)

				if (room_themes_arr[i] == 'mountain') {
					$("#room_theme_mountain").prop("checked", true);
				}

				if (room_themes_arr[i] == 'sea') {
					$("#room_theme_sea").prop("checked", true);
				}

				if (room_themes_arr[i] == "forest") {
					$("#room_theme_forest").prop("checked", true);
				}

				if (room_themes_arr[i] == "valley") {
					$("#room_theme_valley").prop("checked", true);
				}

				if (room_themes_arr[i] == "river") {
					$("#room_theme_river").prop("checked", true);
				}

				if (room_themes_arr[i] == "city") {
					$("#room_theme_city").prop("checked", true);
				}
			}
			
		} else {
			
			//숙소 테마 하나인 경우에만 else문 탐
			
			var room_theme = '${room.room_theme}';
			
			console.log(room_theme);
			
			//마찬가지로 값 체크후 맞는거 체크 미리 입력
			
			if (room_theme == 'mountain') {
				$("#room_theme_mountain").prop("checked", true);
			}

			if (room_theme == 'sea') {
				$("#room_theme_sea").prop("checked", true);
			}

			if (room_theme == "forest") {
				$("#room_theme_forest").prop("checked", true);
			}

			if (room_theme == "valley") {
				$("#room_theme_valley").prop("checked", true);
			}

			if (room_theme == "river") {
				$("#room_theme_river").prop("checked", true);
			}

			if (room_theme == "city") {
				$("#room_theme_city").prop("checked", true);
			}
		}
	
		//숙소 기본 조건들 변수에 담음

		var room_conditions_wifi = '${room.room_wifi}';
		
		var room_conditions_pet = '${room.room_pet}';
		
		var room_conditions_meal = '${room.room_meal}';
		
		var room_conditions_parking = '${room.room_parking}';
		
		var room_conditions_swpool = '${room.room_swpool}';

		console.log(room_conditions_wifi, room_conditions_pet, room_conditions_meal, room_conditions_parking, room_conditions_swpool);
		
		//숙소 유형 값 변수로 담음
		
		var room_cat = '${room.room_cat}';
		
		console.log(room_cat);
		
		//변수에 담은 숙소 유형과 조건들 모두 체크후 맞는게 있으면 미리 체크 입력
		
		if(room_cat == 'hotel') {
			$("#room_cat_hotel").prop("checked", true);
		}
		
		if(room_cat == 'motel') {
			$("#room_cat_motel").prop("checked", true);
		}
		
		if(room_cat == 'guestHouse') {
			$("#room_cat_guestHouse").prop("checked", true);
		}
		
		if(room_cat == 'minbak') {
			$("#room_cat_minbak").prop("checked", true);
		}
		
		if(room_cat == 'pension') {
			$("#room_cat_pension").prop("checked", true);
		}
		
		if(room_conditions_wifi == "Y") {
			$("#room_wifi").prop("checked", true);
		}
		
		if(room_conditions_pet == "Y") {
			$("#room_pet").prop("checked", true);
		}
		
		if(room_conditions_meal == "Y") {
			$("#room_meal").prop("checked", true);
		}
		
		if(room_conditions_parking == "Y") {
			$("#room_parking").prop("checked", true);
		}
		
		if(room_conditions_swpool == "Y") {
			$("#room_swpool").prop("checked", true);
		}

		});

		//1박당 가격 인풋창 값 넣었을때 실행되는 함수
		$('#room_price').on(
				'keyup',
				function(){
					//숫자만, 천단위 자동 콤마 입력
					$(this).val(
							$(this).val().replace(/[^0-9]/g, "").replace(
									/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));

					var price = parseInt($('#room_price').val() || 0);

					//마일리지 1박당 가격에 0.5%로 자동 계산
					var result = Math.floor(price * 0.8);

					//마일리지 인풋창에 값 넣기
					$("#room_points").val(result);
		});
		
		//타입 파일 인풋창 사진 올리면 미리보기 뜨게하는 함수
		function readThisMainImg(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_main_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
				document.getElementById('room_img_main_preview').style.display = "block";
			} else {
				document.getElementById('room_img_main_preview').src = "";
			}
		}
		
		function readThisSub1Img(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_sub1_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
				document.getElementById('room_img_sub1_preview').style.display = "block";
			} else {
				document.getElementById('room_img_sub1_preview').src = "";
			}
		}
		
		function readThisSub2Img(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_sub2_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
				document.getElementById('room_img_sub2_preview').style.display = "block";
			} else {
				document.getElementById('room_img_sub2_preview').src = "";
			}
		}
		
		function readThisSub3Img(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_sub3_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
				document.getElementById('room_img_sub3_preview').style.display = "block";
			} else {
				document.getElementById('room_img_sub3_preview').src = "";
			}
		}
		
		function readThisSub4Img(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_sub4_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
				document.getElementById('room_img_sub4_preview').style.display = "block";
			} else {
				document.getElementById('room_img_sub4_preview').src = "";
			}
		}


</script>

<style>

body {
	word-break: keep-all;
}

.wrap {
	margin: 70px auto;
}

.box {
	margin-bottom: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

#hostRoomDetailfrmDiv {
	margin-top: 5px;
}

.custom_ipt {
	border-radius: 15px;
    width: 300px;
    height: 40px;
    border: 1px solid #aaa;
    padding: 12px;
}

#room_price {
	text-align: center;
	border-radius: 15px;
    width: 120px;
    height: 40px;
    border: 1px solid #aaa;
    padding: 12px;
}

#room_max {
	text-align: center;
	border-radius: 15px;
    width: 55px;
    height: 40px;
    border: 1px solid #aaa;
    padding: 12px;
}

textarea {
	border-radius: 15px;
    border: 1px solid #aaa;
    padding: 12px;
}

#room_img_preview_box {
	display: flex;
	justify-content: space-evenly;
}

.room_img_preview {
	border-radius: 20px;
	margin-bottom: 15px;
}

.room_img_ipt {
	display: flex;
	justify-content: flex-start;
}

#room_img_desc {
	text-align: center;
	font-weight: bolder;
	text-decoration:underline;
	text-underline-position:under;
	padding-bottom: 15px;
}

	/*여기서부터 숙박 시설 산/바다/산과바다, 호텔/모텔/게스트하우스/민박/펜션 css 애니메이션 설정 */
	.room_theme_box input, .room_cat_div input, .room_condition_div input {
		margin: 0;
		padding: 0;
		appearence: none;
		/*appearence => 요소들의 기본 속성을 조절 가능, none으로 하면 요소 기본 속성 제거, 앞으로 변형을 위해서 적용*/
		display: none;
	}
	
	.room_theme_div, .room_cat_div, .room_condition_div {
		border-radius: 20px;
		margin: 10px auto;
		height: 200px;
		overflow: hidden;
	}
	
	.room_theme_label figure, .room_cat_div figure .room_condition_label figure {
		width: 100%;
		height: 100%;
	}
	
	.room_theme_div figcaption, .room_cat_div figcaption, .room_condition_label figcaption  {
		width: 100%; 
		height: 100%;
		background-color: rgba(0,0,0,0.3);
		text-align: center;
	 	position: absolute;
		top: 0;
		left: 0;
		color: #fff;
		font-weight: bolder;
		font-size: 1.75rem;
		line-height: 200px;
		opacity: 0.9;
		transition: 0.3s;
		text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	}
	
	.room_theme_div:hover figcaption, .room_theme_div input:checked figcaption, .room_cat_div:hover figcaption, .room_cat_div input:checked figcaption, .room_condition_div:hover figcaption, .room_condition_div input:checked figcaption {
		opacity: 1;
	}
	
	.room_theme_div input:active + .room_theme_label, .room_cat_div input:active + .room_cat_label, .room_condition_div input:active + .room_condition_label {
		opacity: 0.9;
	}
	
	.room_theme_div input:checked + .room_theme_label, .room_cat_div input:checked + .room_cat_label, .room_condition_div input:checked + .room_condition_label {
		filter:none;
		/*찍은 사진에 필터를 적용하듯 이미지에 필터를 적용하는 역할이 이 filter css 속성, input radio가 체크되면 필터가 적용 안되게 하는것*/
	}

	.room_theme_label, .room_cat_label {
		/*label에 커서 포인터 속성 주고 배경 이미지는 꽉 맞게, 반복 없이 블락속성도 보유하게끔 inline-block, 필터에서 회색조+밝기80%증가+투명도30%만 적용, transition으로 천천히 바뀌는 모습 설정*/
		position: relative;
		border-radius: 20px;
		cursor: pointer;
		overflow: hidden;
		text-align: center;
		background-size: 350px 200px;
		background-repeat: no-repeat;
		display: inline-block;
		width: 100%;
		height: 100%;
		transition: all 100ms ease-in;
		filter: brightness(1) grayscale(0.5) opacity(.6);
	}
	
	 .room_condition_label {
	 	position: relative;
		border-radius: 20px;
		cursor: pointer;
		overflow: hidden;
		text-align: center;
		background-size: 50% auto;
		background-repeat: no-repeat;
		background-position: center center;
		display: inline-block;
		width: 100%;
		height: 100%;
		transition: all 100ms ease-in;
		filter: brightness(1) grayscale(0.5) opacity(.6);
	 }

	/*마우스 올렸을때 밝기20%증가로 조정 + 회색조 50% 감소 + 투명도 90프로로 증가*/
	.room_theme_label:hover, .room_cat_label:hover, .room_condition_label:hover {
		filter: brightness(1.2) grayscale(.5) opacity(.9);
		transform: scale(1.1);
	}

	/*여기까지가 숙박 시설 산/바다/산과바다, 호텔/모텔/게스트하우스/민박/펜션 css 애니메이션 설정 끝*/
	
	/* 산 배경사진 */
	.mountain {
		background-image:url("../../resources/img/mountain.png");
		background-image:url("resources/img/mountain.png");
		
	}
	
	/* 바다 배경사진 */
	.sea {
/* 		background-image:url("../../resources/img/beach.jpg"); */
		background-image:url("resources/img/beach.jpg");
	}
	
	/* 숲 배경사진 */
	.forest {
/* 		background-image:url("../../resources/img/forest.jpg"); */
		background-image:url("resources/img/forest.jpg");
	}
	
	/* 계곡 배경사진 */
	.valley {
/* 		background-image:url("../../resources/img/valley.jpg"); */
		background-image:url("resources/img/valley.jpg");
	}
	
	/* 강 배경사진 */
	.river {
/* 		background-image:url("../../resources/img/river.jpg"); */
		background-image:url("resources/img/river.jpg");
	}
	
	/* 도시 배경사진 */
	.city {
/* 		background-image:url("../../resources/img/city.jpg"); */
		background-image:url("resources/img/city.jpg");
	}
	
	/* 호텔 배경사진 */
	.hotel {
/* 		background-image:url("../../resources/img/hotel.jpg"); */
		background-image:url("resources/img/hotel.jpg");
	}
	
	/* 모텔 배경사진 */
	.motel {
/*  		background-image:url("../../resources/img/motel.jpg"); */
 		background-image:url("resources/img/motel.jpg");
	}
	
	/* 게스트 하우스 배경사진 */
	.guestHouse {
/* 		background-image:url("../../resources/img/guestHouse.jpg"); */
		background-image:url("resources/img/guestHouse.jpg");
	}
	
	/* 민박 배경사진 */
	.minbak {
/* 		background-image:url("../../resources/img/minbak.jpg"); */
		background-image:url("resources/img/minbak.jpg");
	}
	
	/*펜션 배경사진 */
	.pension {
/* 		background-image:url("../../resources/img/pension.jpg"); */
		background-image:url("resources/img/pension.jpg");
	}
	
	/*와이파이 배경 사진 */
	.wifi {
/* 		background-image:url("../../resources/img/router-fill.svg"); */
		background-image:url("resources/img/router-fill.svg");
	}
	
	/*애완견 배경 사진 */
	.pet {
/* 		background-image:url("../../resources/img/pet.svg"); */
		background-image:url("resources/img/pet.svg");
	}
	
	/*조식포함 배경 사진*/
	.eat {
/* 		background-image:url("../../resources/img/iconmonstr-eat-7.svg"); */
		background-image:url("resources/img/iconmonstr-eat-7.svg");
	}
	
	/*주차장 배경 사진*/
	.car {
/* 		background-image:url("../../resources/img/iconmonstr-car-22.svg"); */
		background-image:url("resources/img/iconmonstr-car-22.svg");
	}
	
	/*수영장 배경 사진*/
	.swim {
/* 		background-image:url("../../resources/img/swim.svg"); */
		background-image:url("resources/img/swim.svg");
	}
	
</style>
</head>
<body>
<div class="wrap container-sm">

		<h2 style="text-align: left; margin: 20px auto; font-weight: 800;">숙박시설 수정/삭제</h2>
		<hr style="border: 1px solid #aaa;">
		
	<div id="hostRoomDetailfrmDiv">
		
		<br>

		<form id="hostRoomDetailfrm" action="updateRoom.do" method="post"
			enctype="multipart/form-data">

			<div id="room_name_box" class="box">
				<div id="room_name_label_div">
				<label id="room_name_label" for="room_name">${roomListHeadMap.RoomName}</label>
				</div>
				<input name="room_name" type="text" id="room_name" class="custom_ipt" value="${room.room_name}" />
			</div>

			<div id="room_addr_box" class="box">
				<div id="room_addr_label_div">
				<label id="room_addr_label" for="room_addr">${roomListHeadMap.RoomAddr}</label>
				</div>
				<input name="room_addr" type="text" id="room_addr" class="custom_ipt" value="${room.room_addr}" />&nbsp; 
				<input name="room_addr_detail" type="text" id="room_addr_detail" class="custom_ipt" value="${room.room_addr_detail}" />&nbsp;
				<button type="button" id="room_addr_search">검색</button>
			</div>

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

			<script>
				document.getElementById("room_addr_search").addEventListener("click",function() {
				//주소 입력칸을 클릭하면 주소 검색창 팝업
				new daum.Postcode({
					oncomplete : function(data){
					document.getElementById("room_addr").value = data.address;
					document.querySelector("#room_addr_detail").focus();
						}
					}).open();
				
				});
				
				document.getElementById("room_addr").addEventListener("click",function() {
					//주소 입력칸을 클릭하면 주소 검색창 팝업
					new daum.Postcode({
						oncomplete : function(data){
						document.getElementById("room_addr").value = data.address;
						document.querySelector("#room_addr_detail").focus();
						}
					}).open();
					
				});
			</script>

			<div id="host_id_box">
				<input name="host_id" type="hidden" id="host_id" class="custom_ipt" value="${room.host_id}" />
			</div>

			<div id="room_id_box">
				<input name="room_id" type="hidden" id="room_id" class="custom_ipt" value="${room.room_id}" />
			</div>

			<div id="room_price_box" class="box">
				<div id="room_price_lable_div">
				<label id="room_price_label" for="room_price">${roomListHeadMap.RoomPrice}</label>
				</div>
				<input name="room_price" type="text" id="room_price" class="custom_ipt room_right" value="${room.room_price}" />&nbsp;원
			</div>
			
			<div class="room_max_box">
			<br>
			<div id="room_max_label_div">
			<label id="room_max_label" for="room_max">${roomListHeadMap.RoomMax}</label>
			</div>
			<input name="room_max" type="text" class="room_max" id="room_max" value="${room.room_max}"/>&nbsp;명
			</div>
			</div>
			
			<br>
			<br>

			<div id="room_img_preview_box" class="box">
				
				<div id="room_img_main_div" class="col-xs-12 col-lg-2">
				<div id="room_img_desc"><span>숙소 대표 이미지</span></div>
				<%if(room_img_no1 != null) {%> 
				<img id="room_img_main_preview" class="room_img_preview" src="resources/room_img/${room.room_img_no1}" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } else { %>
				<img id="room_img_main_preview" class="room_img_preview" src="" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } %>
				<div class="room_img_ipt">
				<input name="room_img_no1_multi" type="file" id="room_img" onchange="readThisMainImg(this);" />
				</div>
				</div>
				
				<div id="room_img_sub1_div" class="col-xs-12 col-lg-2">
				<div id="room_img_sub1">
				<div id="room_img_desc"><span>숙소 서브1 이미지</span></div>
				<%if(room_img_no2 != null) { %>
				<img id="room_img_sub1_preview" class="room_img_preview" src="resources/room_img/${room.room_img_no2}" alt="숙소 서브1 이미지 미리보기" title="숙소 서브1 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } else { %>
				<img id="room_img_sub1_preview" class="room_img_preview" alt="숙소 서브1 이미지 미리보기" title="숙소 서브1 이미지" src="" width="150" height="150" onerror="this.style.display='none';"/>
				<% } %>
				<div class="room_img_ipt">
				<input name="room_img_no2_multi" type="file" id="room_img" onchange="readThisSub1Img(this);" />
				</div>
				</div>
				<div><button class="room_img_sub1_btn btn btn-outline-dark" type="button">숙소 서브1 이미지 추가하기</button></div>
				</div>

				<div id="room_img_sub2_div" class="col-xs-12 col-lg-2">
				<div id="room_img_sub2">
				<div id="room_img_desc"><span>숙소 서브2 이미지</span></div>
				<%if(room_img_no3 != null) { %>
				<img id="room_img_sub2_preview" class="room_img_preview" src="resources/room_img/${room.room_img_no3}" alt="숙소 서브2 이미지 미리보기" title="숙소 서브2 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } else { %>
				<img id="room_img_sub2_preview" class="room_img_preview" alt="숙소 서브2 이미지 미리보기" title="숙소 서브2 이미지" src="" width="150" height="150" onerror="this.style.display='none';"/>
				<% } %>
				<div class="room_img_ipt">
				<input name="room_img_no3_multi" type="file" id="room_img" onchange="readThisSub2Img(this);" />
				</div>
				</div>
				<div><button class="room_img_sub2_btn btn btn-outline-dark" type="button">숙소 서브2 이미지 추가하기</button></div>
				</div>

				<div id="room_img_sub3_div" class="col-xs-12 col-lg-2">
				<div id="room_img_sub3">
				<div id="room_img_desc"><span>숙소 서브3 이미지</span></div>
				<% if(room_img_no4 != null) { %>
				<img id="room_img_sub3_preview" class="room_img_preview" src="resources/room_img/${room.room_img_no4}" alt="숙소 서브3 이미지 미리보기" title="숙소 서브3 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } else { %>
				<img id="room_img_sub3_preview" class="room_img_preview" src="" alt="숙소 서브3 이미지 미리보기" title="숙소 서브3 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } %>
				<div class="room_img_ipt">
				<input class="room_img_ipt" name="room_img_no4_multi" type="file" id="room_img" onchange="readThisSub3Img(this);" />
				</div>
				</div>
				<div><button class="room_img_sub3_btn btn btn-outline-dark" type="button">숙소 서브3 이미지 추가하기</button></div>
				</div>

				<div id="room_img_sub4_div" class="col-xs-12 col-lg-2">
				<div id="room_img_sub4">
				<div id="room_img_desc"><span>숙소 서브4 이미지</span></div>
				<% if(room_img_no5 != null) { %>
				<img id="room_sub4_main_preview" class="room_img_preview" src="resources/room_img/${room.room_img_no5}" alt="숙소 서브4 이미지 미리보기" title="숙소 서브4 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } else { %>
				<img id="room_sub4_main_preview" class="room_img_preview" src="" alt="숙소 서브4 이미지 미리보기" title="숙소 서브4 이미지" width="150" height="150" onerror="this.style.display='none';"/>
				<% } %>
				<div class="room_img_ipt">
				<input class="room_img_ipt" name="room_img_no5_multi" type="file" id="room_img" onchange="readThisSub4Img(this);" />
				</div>
				</div>
				<div><button class="room_img_sub4_btn btn btn-outline-dark" type="button">숙소 서브4 이미지 추가하기</button></div>
				</div>

			</div>
			
			<br>
			<br>
			
			<div class="room_desc_box">
			<div class="room_desc_label_div">
			<label id="room_desc_label" for="room_desc">${roomListHeadMap.RoomDesc}</label>
			</div>
			<br>
			<textarea id="room_desc" name="room_desc" class="room_desc" placeholder="여기에 설명을 적어주세요" cols="140" rows="5" style="resize: none;">${room.room_desc}</textarea>
			</div>
			
			<br>
			<br>

			<div class="room_theme_box">
		
				<div class="room_themes_div">
				
				<div class="row">
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_mountain" value="mountain"/>
				<label class="room_theme_label mountain" for="room_theme_mountain">
				<figure>
				<figcaption>산</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_sea" value="sea"/>
				<label class="room_theme_label sea" for="room_theme_sea">
				<figure>
				<figcaption>바다</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_forest" value="forest"/>
				<label class="room_theme_label forest" for="room_theme_forest">
				<figure>
				<figcaption>숲</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_valley" value="valley"/>
				<label class="room_theme_label valley" for="room_theme_valley">
				<figure>
				<figcaption>계곡</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_river" value="river" />
				<label class="room_theme_label river" for="room_theme_river">
				<figure>
				<figcaption>강</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_theme_div col-xs-12 col-2">
				<input type="checkbox" name="room_theme" id="room_theme_city" value="city" />
				<label class="room_theme_label city" for="room_theme_city">
				<figure>
				<figcaption>도시</figcaption>
				</figure>
				</label>
				</div>
				
				</div>
				
				</div>
			
			</div>
			
			<br>
			<br>

			<div class="room_cat_box">
				
				<div class="room_cats_div">
				
				<div class="row">
				
				<div id="room_cat_desc"></div>
				
				<div class="room_cat_div col-xs-12 col-2">
				<input type="radio" name="room_cat" id="room_cat_hotel" value="hotel" required/>
				<label class="room_cat_label hotel" for="room_cat_hotel">
				<figure>
				<figcaption>호텔</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-2">
				<input type="radio" name="room_cat" id="room_cat_motel" value="motel"/>
				<label class="room_cat_label motel" for="room_cat_motel">
				<figure>
				<figcaption>모텔</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-2" id="room_cat_GH">
				<input type="radio" name="room_cat" id="room_cat_guestHouse" value="guestHouse"/>
				<label class="room_cat_label guestHouse" for="room_cat_guestHouse">
				<figure>
				<figcaption>게스트 하우스</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_cat_div col-xs-12 col-2">
				<input type="radio" name="room_cat" id="room_cat_minbak" value="minbak"/>
				<label class="room_cat_label minbak" for="room_cat_minbak">
				<figure>
				<figcaption>민박</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-2">
				<input type="radio" name="room_cat" id="room_cat_pension" value="pension"/>
				<label class="room_cat_label pension" for="room_cat_pension">
				<figure>
				<figcaption>펜션</figcaption>
				</figure>
				</label>
				</div>
				
				</div>
				
				</div>
			
			</div>
			
			<br>
			<br>

			<div class="room_conditions_box">
			
				<div class="room_condition_desc">
				<span>${roomListHeadMap.RoomWIFI}</span>
				&nbsp;&nbsp;
				<span>${roomListHeadMap.RoomPet}</span>
				&nbsp;&nbsp;
				<span>${roomListHeadMap.RoomMeal}</span>
				&nbsp;&nbsp;
				<span>${roomListHeadMap.RoomParking}</span>
				&nbsp;&nbsp;
				<span>${roomListHeadMap.RoomSwpool}</span>
				</div>
			
				<div class="row">
				<div class="room_condition_div col-xs-12 col-2">
				<input type="checkbox" name="room_wifi" id="room_wifi" value="Y" />
				<label for="room_wifi" class="room_condition_label wifi">
				<figure>
				<figcaption>와이파이</figcaption>
				</figure>
				</label>
				</div>

				<div class="room_condition_div col-xs-12 col-2">
				<input type="checkbox" name="room_pet" id="room_pet" value="Y" />
				<label for="room_pet" class="room_condition_label pet">
				<figure>
				<figcaption>애완견 동반 투숙 가능</figcaption>
				</figure>
				</label>
				</div>

				<div class="room_condition_div col-xs-12 col-2">
				<input type="checkbox" name="room_meal" id="room_meal" value="Y" />
				<label for="room_meal" class="room_condition_label eat">
				<figure>
				<figcaption>조식 포함</figcaption>
				</figure>
				</label>
				</div>

				<div class="room_condition_div col-xs-12 col-2">
				<input type="checkbox" name="room_parking" id="room_parking" value="Y" />
				<label for="room_parking" class="room_condition_label car">
				<figure>
				<figcaption>주차장</figcaption>
				</figure>
				</label>
				</div>

				<div class="room_condition_div col-xs-12 col-2">
				<input type="checkbox" name="room_swpool" id="room_swpool" value="Y" />
				<label for="room_swpool" class="room_condition_label swim">
				<figure>
				<figcaption>수영장</figcaption>
				</figure>
				</label>
				</div>
				</div>

			</div>

		</form>
	</div>
</div>
		<div id="roomModifyButtons" style="text-align: center; margin: 10px auto;" class="box">
			<button id="deleteRoom" onclick="f_roomDelete()">삭제하기</button>
			<button id="updateRoom" onclick="f_roomUpdateGo()">수정하기</button>
		</div>
	
</body>
</html>