<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>업주용 숙소 등록</title>

<%@ include file="../host_header.jsp"%>

<style>

	@media(max-width: 1200px) {
	
	body {
		word-break: keep-all;
		text-align: center;
	}
	
	.wrap {
		margin-top: 70px auto;
	}
	
	.ipt_custom input {
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
	    width: 70px;
	    height: 40px;
	    border: 1px solid #aaa;
	    padding: 12px;
	}
	
	.room_price, .room_max {
		text-align: right;
	}
		
	.room_addr_box {
		margin: 10px auto;
		width: 350px;
	}

	#room_addr  {
		border-radius: 15px;
    	width: 300px;
    	height: 40px;
    	border: 1px solid #aaa;
    	padding: 12px;
    	margin-top: 10px;
    	margin-bottom: 10px;
	}
	
	#room_addr_div {
		text-align: center;
		margin: 0 auto;
		height: 50px;
	}
	
	#room_addr_div button {
		width: 43px;
		height: 36px;
		font-size: 15px;
		padding: 0;
	}
	
	#room_addr_detail {
		border-radius: 15px;
    	width: 300px;
    	height: 40px;
    	border: 1px solid #aaa;
    	padding: 12px;
    	margin-top: 10px;
    	margin-bottom: 10px;
	}
	
	#room_addr_detail_div {
		width: 360px;
		margin: 5px auto;
		text-align: left;
	}
	
	#room_addr_div input {
		width: 300px;
		float: left;
	}
	
	#room_addr_search {
		height: 50px;
		width: 350px;
		margin: 0 auto;
		text-align: center;
		vertical-align: baseline;
		padding-top: 11px;
	}
	
	
	#img_btn_toggle {
		display: none;
	}
	
	.room_img_div label {
		text-align: center;
		font-weight: 600;
		text-decoration:underline;
		text-underline-position:under;
		padding: 0;
	}
	
	.room_img_preview {
		border-radius: 20px;
		margin-bottom: 15px;
		margin: 10px auto;
	}
	
	.room_img_div {
		text-align: center;
		margin-top: 50px;
	}
	
	.room_img_ipt {
		width: 225px;
		text-align: center;
		margin: 10px auto;
	}
	
	.room_img_preview_box {
		display: flex;
		justify-content: space-evenly;
		margin-left: 0;
	}
	
	textarea{
		width: 80vw;
		border-radius: 15px;
    	border: 1px solid #aaa;
    	padding: 12px;
	}
	
	.room_q, .room_themes_sentence, .room_cats_sentence, .room_conditions_sentence {
		font-weight: 700;
	}
	
	#room_themes_picked, #room_cats_picked, #room_conditions_picked {
		font-size: 1.3rem;
		color: #dc3545;
	}
	
	#room_cat_GH figcaption {
		visibility: hidden;
		line-height: 0;
		
	}
	
	#room_cat_GH figcaption:after {
		visibility: visible;
		content: "게스트\A하우스";
		white-space: pre;
		display: block;
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
		line-height: 100px;
		opacity: 0.9;
		transition: 0.3s;
		text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
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
	
	.room_theme_div figcaption, .room_cat_div figcaption  {
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
	
	.room_condition_label figcaption {
		width: 130%; 
		height: 100%;
		writing-mode: vertical-lr;
		background-color: rgba(0,0,0,0.3);
		text-align: center;
	 	position: absolute;
		top: 0;
		left: -7px;
		color: #fff;
		font-weight: bolder;
		font-size: 1.75rem;
		opacity: 0.9;
		transition: 0.3s;
		text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	}
	
	#room_condition_pet figcaption {
		visibility: hidden;
		line-height: 0;
		
	}
	
	#room_condition_pet figcaption:after {
		visibility: visible;
		content: "애완견 동반";
		writing-mode: vertical-lr;
		white-space: pre;
		display: block;
		width: 130%; 
		height: 100%;
		background-color: rgba(0,0,0,0.3);
		text-align: center;
	 	position: absolute;
		top: 0;
		left: -27px;
		color: #fff;
		font-weight: bolder;
		font-size: 1.75rem;
		line-height: 100px;
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
		filter: brightness(0.7) grayscale(0.8) opacity(.7);
	}
	
	.room_condition_label {
		position: relative;
		border-radius: 20px;
		cursor: pointer;
		overflow: hidden;
		text-align: center;
		background-size: 80% auto;
		background-repeat: no-repeat;
		background-position: center center;
		display: inline-block;
		width: 100%;
		height: 100%;
		transition: all 100ms ease-in;
		filter: brightness(1) grayscale(0.8) opacity(.7);
	}

	/*마우스 올렸을때 밝기20%증가로 조정 + 회색조 50% 감소 + 투명도 90프로로 증가*/
	.room_theme_label:hover, .room_cat_label:hover, .room_condition_label:hover {
		filter: brightness(1.4) grayscale(.5) opacity(.9);
		transform: scale(1.1);
	}
		
	}
	
	@media(min-width: 1200px) {
	
	body {
		word-break: keep-all;
	}

	.wrap {
		margin: 70px auto;
	}
	
	.ipt_custom input {
		border-radius: 15px;
    	width: 310px;
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
	    width: 70px;
	    height: 40px;
	    border: 1px solid #aaa;
	    padding: 12px;
	}
	
	#room_addr {
		border-radius: 15px;
    	width: 300px;
    	height: 40px;
    	border: 1px solid #aaa;
    	padding: 12px;
    	margin-top: 10px;
    	margin-bottom: 10px;
	}
	
	#room_addr_div {
		width: 370px;
		text-align: center;
		height: 50px;
	}
	
	#room_addr_detail {
		border-radius: 15px;
    	width: 300px;
    	height: 40px;
    	border: 1px solid #aaa;
    	padding: 12px;
    	margin-top: 10px;
    	margin-bottom: 10px;
	}
	
	#room_addr_detail_div {
		width: 360px;
		margin-top: 5px;
		text-align: left;
	}
	
	#room_addr_div input {
		width: 300px;
		float: left;
		margin-right: 5px;
		
	}
	
	#room_addr_search {
		height: 50px;
		text-align: center;
		vertical-align: middle;
		padding-top: 10px;
	}
	
	.room_img_div {
		text-align: center;
		margin-top: 50px;
	}
	
	.room_img_ipt {
		display: flex;
		justify-content: center;
	}
	
	.room_q, .room_themes_sentence, .room_cats_sentence, .room_conditions_sentence {
		font-weight: 700;
	}
	
	#room_themes_picked, #room_cats_picked, #room_conditions_picked {
		font-size: 1.3rem;
		color: #dc3545;
	}
	
	.room_price, .room_max {
		text-align: right;
	}
	
	textarea {
		border-radius: 15px;
    	border: 1px solid #aaa;
    	padding: 12px;
	}
	
	.room_img_preview_box {
		display: flex;
		justify-content: space-evenly;
	}
	
	#img_btn_toggle {
		display: none;
	}
	
	.room_img_div label {
		text-align: center;
		font-weight: 600;
		text-decoration:underline;
		text-underline-position:under;
		padding: 0;
	}
	
	.room_img_preview {
		border-radius: 20px;
		margin-bottom: 15px;
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
	
	.room_theme_div figcaption, .room_cat_div figcaption, .room_condition_label figcaption {
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
		filter: brightness(0.7) grayscale(0.8) opacity(.7);
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
		filter: brightness(1) grayscale(0.8) opacity(.7);
	 }

	/*마우스 올렸을때 밝기20%증가로 조정 + 회색조 50% 감소 + 투명도 90프로로 증가*/
	.room_theme_label:hover, .room_cat_label:hover, .room_condition_label:hover {
		filter: brightness(1.4) grayscale(.5) opacity(.9);
		transform: scale(1.1);
	}
	
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


<script>

$(document).ready(function(){
	
	$('.room_themes_sentence').hide();
	
	$('.room_cats_sentence').hide();
	
	$('.room_conditions_sentence').hide();
	
	//1박당 가격 인풋창 값 넣었을때 실행되는 함수
	$('.room_price').on('keyup', function(){
		//숫자만, 천단위 자동 콤마 입력
		$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
	});
	
	$('.room_max').on('keyup', function(){
		//최대 인원 인풋창에 값 넣었을때 숫자만 입력
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$(".room_img_sub_btn").click(function(){
		
		$(this).parent().prev().toggle();
		
	});
	
	$(".room_img_delete_btn").click(function(){
		
		$(this).parent().prev().prev().children("input").val("");
		
		$(this).parent().prev().prev().prev().attr("src", "");
		
	});
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

function th_getCheckBoxAndRadioValue() {
	
	const query_room_themes = 'input[name="room_theme"]:checked';
	
	const selectedEls = document.querySelectorAll(query_room_themes);
	
	let result = '';
	  
	selectedEls.forEach((el, index, array) => {
		
		if(index != (array.length - 1)) {
			
			if(el.value == "mountain") {
				
				result += "산" + ', ';
				
			}
			
			if(el.value == "sea") {
				
				result += "바다" + ', ';
				
			}
			
			if(el.value == "forest") {
				
				result += "숲" + ', ';
				
			}
			
			if(el.value == "valley") {
				
				result += "계곡" + ', ';
				
			}
			
			if(el.value == "river") {
				
				result += "강" + ', ';
				
			}
			
			if(el.value == "city") {
				
				result += "도시" + ', ';
				
			}
			
		} else {
			
			if(el.value == "mountain") {
				
				result += "산";
				
			}
			
			if(el.value == "sea") {
				
				result += "바다";
				
			}
			
			if(el.value == "forest") {
				
				result += "숲";
				
			}
			
			if(el.value == "valley") {
				
				result += "계곡";
				
			}
			
			if(el.value == "river") {
				
				result += "강";
				
			}
			
			if(el.value == "city") {
				
				result += "도시";
				
			}
		}
		
	});
	
	$('.room_themes_sentence').show();
	
	document.getElementById('room_themes_picked').innerText = result;
	
	if(result == '') {
		
		$('.room_themes_sentence').hide();
	}
}

function ca_getCheckBoxAndRadioValue() {
	
	const query_room_cat = 'input[name="room_cat"]:checked';
	
	const selectedEls = document.querySelectorAll(query_room_cat);
	
	let result = '';
	  
	selectedEls.forEach((el, index, array) => {
		
			if(el.value == "hotel") {
				
				result = "호텔";
				
			}
			
			if(el.value == "motel") {
				
				result = "모텔";
				
			}
			
			if(el.value == "guestHouse") {
				
				result = "게스트 하우스";
				
			}
			
			if(el.value == "minbak") {
				
				result = "민박";
				
			}
			
			if(el.value == "pension") {
				
				result = "펜션";
				
			}
		
	});
	
	$('.room_cats_sentence').show();
	
	document.getElementById('room_cats_picked').innerText = result;
	
	if(result == '') {
		
		$('.room_cats_sentence').hide();
	}
}

function co_getCheckBoxAndRadioValue() {
	
	const query_room_wifi = 'input[name="room_wifi"]:checked';
	
	const query_room_pet = 'input[name="room_pet"]:checked';
	
	const query_room_meal = 'input[name="room_meal"]:checked';
	
	const query_room_parking = 'input[name="room_parking"]:checked';
	
	const query_room_swpool = 'input[name="room_swpool"]:checked';
	
	const selectedEls_wifi = document.querySelectorAll(query_room_wifi);
	
	const selectedEls_pet = document.querySelectorAll(query_room_pet);
	
	const selectedEls_meal = document.querySelectorAll(query_room_meal);
	
	const selectedEls_parking = document.querySelectorAll(query_room_parking);
	
	const selectedEls_swpool = document.querySelectorAll(query_room_swpool);
	
	let result_arr = [];
	
	selectedEls_wifi.forEach((el, index, array) => {
		
		if(el.value == "Y") {
			
			result_arr.push("무료 와이파이");
			
		}
	});
	
	selectedEls_pet.forEach((el, index, array) => {
		
		if(el.value == "Y") {
			
			result_arr.push("애완견 동반 투숙 가능");
			
		}
	});
	
	selectedEls_meal.forEach((el, index, array) => {
		
		if(el.value == "Y") {
			
			result_arr.push("조식 제공");
			
		}
	});
	
	selectedEls_swpool.forEach((el, index, array) => {
		
		if(el.value == "Y") {
			
			result_arr.push("수영장 보유");
			
		}
	});
	
	selectedEls_parking.forEach((el, index, array) => {
		
		if(el.value == "Y") {
			
			result_arr.push("주차장 보유");
			
		}
	});

	let result = '';
	
	result_arr.forEach((el, index, array) => {
		
		if(index != (array.length - 1)) {
			
			if(el == "무료 와이파이") {
				
				result += el + ', ';
				
			}
			
			if(el == "애완견 동반 투숙 가능") {
				
				result += el + ', ';
				
			}
			
			if(el == "조식 제공") {
				
				result += el + ', ';
				
			}
			
			if(el == "수영장 보유") {
				
				result += el + ', ';
				
			}
			
			if(el == "주차장 보유") {
				
				result += el + ', ';
				
			}
			
		} else {
			
			if(el == "무료 와이파이") {
			
				result += el;
				
			}
			
			if(el == "애완견 동반 투숙 가능") {
				
				result += el;
				
			}
			
			if(el == "조식 제공") {
				
				result += el;
				
			}
			
			if(el == "수영장 보유") {
				
				result += el;
				
			}
			
			if(el == "주차장 보유") {
				
				result += el;
				
			}
		}
	});
	
	$('.room_conditions_sentence').show();
	
	document.getElementById('room_conditions_picked').innerText = result;
	
	if(result == '') {
		
		$('.room_conditions_sentence').hide();
	}
}
</script>

</head>
<body>

<div class="wrap">
	
	<div class="room_insert_form_div container-lg">
	
	<h2 style="text-align: left; margin: 20px auto; font-weight: 800;">숙박시설 등록</h2>
	<hr style="border: 1px solid #aaa;">
	<br>
	
	<form action="insertRoom.do" method="post" enctype="multipart/form-data" class="insertRoomForm">
			
			<div class="ipt_custom">
			<!-- 숙박 시설 이름 등록 -->
			<div class="room_name_box">
			<div class="room_q">등록하시려는 숙박시설 이름은 어떻게 되시나요?</div>
			<br>
			<div><input name="room_name" type="text" id="room_name"/></div>
			</div>
		
			<br>
			<br>
		
			<!-- 숙박 시설 주소 등록 -->
			<div class="room_addr_box">
			<div class="room_q">주소는 어떻게 되시나요?</div>
			<br>
			<div class="col-xs-12">
			<div id="room_addr_div">
			<input name="room_addr" type="text" id="room_addr" readonly/>
			<div id="room_addr_search">
			<button type="button" class="btn btn-outline-dark" style="margin-left: 2px;">검색</button>
			</div>
			</div>
			</div>
			<div class="col-xs-12">
			<div id="room_addr_detail_div">
			<input name="room_addr_detail" type="text" id="room_addr_detail" />
			</div>
			</div>
			</div>
		
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			<script>
			
			$(document).ready(function(){
			
			document.getElementById("room_addr_search").addEventListener("click", function(){
				//주소 입력칸을 클릭하면 주소 검색창 팝업
				 new daum.Postcode({
				        oncomplete: function(data) {
							document.getElementById("room_addr").value = data.address;
							document.querySelector("#room_addr_detail").focus();
				        }
				    }).open();
				});
			
			document.getElementById("room_addr").addEventListener("click", function(){
				//주소 입력칸을 클릭하면 주소 검색창 팝업
				 new daum.Postcode({
				        oncomplete: function(data) {
							document.getElementById("room_addr").value = data.address;
							document.querySelector("#room_addr_detail").focus();
				        }
				    }).open();
				})
				
			});
				
			</script>
		
			<br>
			<br>
		
			<!-- 업주 아이디는 DB에서 혹은 세션에서 불러와서 아래 해당 input에 값으로만 세팅해놓고 안보이게 처리할것임 (hidden이라도 form 데이터 전송할때 값은 전송됨) -->
			<div id="host_id_box">
			<input name="host_id" type="hidden" class="host_id" value="${host_id}"/>
			</div>
		
			<!-- 숙박 시설 1박당 가격 등록 -->
			<div id="room_price_box">
			<div class="room_q">1박당 가격은 어떻게 되세요? (2인 기준)</div>
			<br>
			<div>
			<input name="room_price" type="text" class="room_price" id="room_price" />&nbsp;원
			</div>
			</div>
		
			<br>
			<br>
			
			<!-- 숙박 시설 최대 수용 인원 등록 -->
			<div class="room_max_box">
			<div class="room_q">숙박시설의 최대 수용 인원은 어떻게 되세요?</div>
			<br>
			<div>
			<input name="room_max" type="text" class="room_max" id="room_max" />&nbsp;명
			</div>
			</div>
			
			<br>
			<br>
			</div>
		
			<!-- 숙박 시설 대표 이미지 등록 -->
			<div class="room_img_box">
			<div class="room_q">숙박시설을 잘 보여주는 대표 이미지(썸네일)과 서브 이미지들을 등록하세요.</div>
			
			<br>
			
			<div class="room_img_preview_box container row">
			
			<div class="room_img_div col-xs-12 col-lg-2">
			<div><label for="room_img_main">숙소 대표 이미지</label></div>
			<img id="room_img_main_preview" class="room_img_preview" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="150" height="150" src="" onerror="this.style.display='none';"/>
			
			<div class="room_img_ipt">
			<input name="room_img_no1_multi" type="file" id="room_img_main" onchange="readThisMainImg(this);" required/>
			</div>
			</div>
			
			<div class="room_img_div col-xs-12 col-lg-2">
			<div id="img_btn_toggle">
			<div><label for="room_img_sub1">숙소 서브1 이미지</label></div>
			<img id="room_img_sub1_preview" class="room_img_preview" alt="숙소 서브1 이미지 미리보기" title="숙소 서브1 이미지" width="150" height="150" src="" onerror="this.style.display='none'"/>
			
			<div class="room_img_ipt">
			<input name="room_img_no2_multi" type="file" id="room_img_sub1" onchange="readThisSub1Img(this);" /></div><br>
			<div><button class="room_img_delete_btn btn btn-outline-dark" type="button">숙소 서브1 이미지 삭제하기</button></div>
			<br>
			</div>
			<div><button class="room_img_sub_btn btn btn-outline-dark" type="button">숙소 서브1 이미지 추가하기</button></div>
			</div>
			
			<div class="room_img_div col-xs-12 col-lg-2">
			<div id="img_btn_toggle">
			<div><label for="room_img_sub2">숙소 서브2 이미지</label></div>
			<img id="room_img_sub2_preview" class="room_img_preview" alt="숙소 서브2 이미지 미리보기" title="숙소 서브2 이미지" width="150" height="150" src="" onerror="this.style.display='none'"/>
			
			<div class="room_img_ipt">
			<input name="room_img_no3_multi" type="file" id="room_img_sub2" onchange="readThisSub2Img(this);" /></div><br>
			<div><button class="room_img_delete_btn btn btn-outline-dark" type="button">숙소 서브2 이미지 삭제하기</button></div>
			<br>
			</div>
			<div><button class="room_img_sub_btn btn btn-outline-dark" type="button">숙소 서브2 이미지 추가하기</button></div>
			</div>
			
			<div class="room_img_div col-xs-12 col-lg-2">
			<div id="img_btn_toggle">
			<div><label for="room_img_sub3">숙소 서브3 이미지</label></div>
			<img id="room_img_sub3_preview" class="room_img_preview" alt="숙소 서브3 이미지 미리보기" title="숙소 서브3 이미지" width="150" height="150" src="" onerror="this.style.display='none'"/>
			
			<div class="room_img_ipt">
			<input name="room_img_no4_multi" type="file" id="room_img_sub3" onchange="readThisSub3Img(this);" /></div><br>
			<div><button class="room_img_delete_btn btn btn-outline-dark" type="button">숙소 서브3 이미지 삭제하기</button></div>
			<br>
			</div>
			<div><button class="room_img_sub_btn btn btn-outline-dark" type="button">숙소 서브3 이미지 추가하기</button></div>
			</div>
			
			<div class="room_img_div col-xs-12 col-lg-2">
			<div id="img_btn_toggle">
			<div><label for="room_img_sub4">숙소 서브4 이미지</label></div>
			<img id="room_img_sub4_preview" class="room_img_preview" alt="숙소 서브4 이미지 미리보기" title="숙소 서브4 이미지" width="150" height="150" src="" onerror="this.style.display='none'"/>
			
			<div class="room_img_ipt">
			<input name="room_img_no5_multi" type="file" id="room_img_sub4" onchange="readThisSub4Img(this);" /></div><br>
			<div><button class="room_img_delete_btn btn btn-outline-dark" type="button">숙소 서브4 이미지 삭제하기</button></div>
			<br>
			</div>
			<div><button class="room_img_sub_btn btn btn-outline-dark" type="button">숙소 서브4 이미지 추가하기</button></div>
			</div>
			
			</div>
			
			</div>
		
			<br>
			<br>
		
			<!-- 숙박 시설 소개글 & 자세한 설명 등록 -->
			
			<div class="room_desc_box">
			<div class="room_q">등록하시려는 숙박시설의 소개글 및 자세한 설명을 아래에 적어주세요.</div>
			<br>
			<textarea name="room_desc" class="room_desc" placeholder="여기에 설명을 적어주세요" cols="140" rows="5" style="resize: none;"></textarea>
			</div>
			
			<br>
			<br>
		
			<!-- 숙박 시설 테마 (산/바다/산과 바다/숲/계곡/강/도시) -->
			<div class="room_theme_box">
		
				<div class="room_q">숙박시설이 위치한 곳의 특징을 아래 사진들에서 골라 결정해주세요. (중복선택 가능)</div>
				<br>
				<div class="room_themes_sentence">${host_id} 님이 선택하신 숙박 시설 테마 유형은 <span id="room_themes_picked"></span> 입니다.</div>
				
				<br>
				
				<div class="room_themes_div">
				
				<div class="row">
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_mountain" value="mountain" onclick="th_getCheckBoxAndRadioValue()"/>
				<label class="room_theme_label mountain" for="room_theme_mountain">
				<figure>
				<figcaption>산</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_sea" value="sea" onclick="th_getCheckBoxAndRadioValue()"/>
				<label class="room_theme_label sea" for="room_theme_sea">
				<figure>
				<figcaption>바다</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_forest" value="forest" onclick="th_getCheckBoxAndRadioValue()"/>
				<label class="room_theme_label forest" for="room_theme_forest">
				<figure>
				<figcaption>숲</figcaption>
				</figure>
				</label>
				</div>
				
				</div>
				
				<div class="row">
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_valley" value="valley" onclick="th_getCheckBoxAndRadioValue()"/>
				<label class="room_theme_label valley" for="room_theme_valley">
				<figure>
				<figcaption>계곡</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_river" value="river" onclick="th_getCheckBoxAndRadioValue()"/>
				<label class="room_theme_label river" for="room_theme_river">
				<figure>
				<figcaption>강</figcaption>
				</figure>
				</label>
				</div>
				
				
				<div class="room_theme_div col-xs-12 col-4">
				<input type="checkbox" name="room_theme" id="room_theme_city" value="city" onclick="th_getCheckBoxAndRadioValue()"/>
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
		
			<!-- 숙박 시설 유형 등록 -->
			<div class="room_cat_box">
			
				<div class="room_q">숙박 시설의 유형은 어떻게 되시나요?</div>
				<br>
				<div class="room_cats_sentence">${host_id} 님이 선택하신 숙박 시설 유형은 <span id="room_cats_picked"></span> 입니다.</div>
				
					<br>
				
				<div class="room_cats_div">
				
				<div class="row">
				
				<div class="room_cat_div col-xs-12 col-4">
				<input type="radio" name="room_cat" id="room_cat_hotel" value="hotel" onclick="ca_getCheckBoxAndRadioValue()" required/>
				<label class="room_cat_label hotel" for="room_cat_hotel">
				<figure>
				<figcaption>호텔</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-4">
				<input type="radio" name="room_cat" id="room_cat_motel" value="motel" onclick="ca_getCheckBoxAndRadioValue()"/>
				<label class="room_cat_label motel" for="room_cat_motel">
				<figure>
				<figcaption>모텔</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-4" id="room_cat_GH">
				<input type="radio" name="room_cat" id="room_cat_guestHouse" value="guestHouse" onclick="ca_getCheckBoxAndRadioValue()"/>
				<label class="room_cat_label guestHouse" for="room_cat_guestHouse">
				<figure>
				<figcaption>게스트 하우스</figcaption>
				</figure>
				</label>
				</div>
				
				</div>
				
				<div class="row">
				
				<div class="room_cat_div col-xs-12 col-4">
				<input type="radio" name="room_cat" id="room_cat_minbak" value="minbak" onclick="ca_getCheckBoxAndRadioValue()"/>
				<label class="room_cat_label minbak" for="room_cat_minbak">
				<figure>
				<figcaption>민박</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_cat_div col-xs-12 col-4">
				<input type="radio" name="room_cat" id="room_cat_pension" value="pension" onclick="ca_getCheckBoxAndRadioValue()"/>
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
		
			<!-- 숙박 시설 조건들 체크 -->
			<div class="room_q">그 외 숙박시설이 갖추고 있는 것들을 체크해주세요.(여러개 선택 가능)</div>
			<br>
			<div class="room_conditions_sentence">${host_id} 님이 선택하신 숙박 시설 기본 조건은 <span id="room_conditions_picked"></span> 입니다.</div>
			
			<br>
			
			<div class="room_conditions_box">
			
				<div class="row">
				<div class="room_condition_div col-xs-12 col-3">
				<input type="checkbox" name="room_wifi" id="room_wifi" value="Y" onclick="co_getCheckBoxAndRadioValue()"/>
				<label for="room_wifi" class="room_condition_label wifi">
				<figure>
				<figcaption>와이파이</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_condition_div col-xs-12 col-3" id="room_condition_pet">
				<input type="checkbox" name="room_pet" id="room_pet" value="Y" onclick="co_getCheckBoxAndRadioValue()"/>
				<label for="room_pet" class="room_condition_label pet">
				<figure>
				<figcaption>애완견 동반 투숙 가능</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_condition_div col-xs-12 col-3">
				<input type="checkbox" name="room_meal" id="room_meal" value="Y" onclick="co_getCheckBoxAndRadioValue()"/>
				<label for="room_meal" class="room_condition_label eat">
				<figure>
				<figcaption>조식 포함</figcaption>
				</figure>
				</label>
				</div>
				</div>
				
				<div class="row">
				<div class="room_condition_div col-xs-12 col-3">
				<input type="checkbox" name="room_parking" id="room_parking" value="Y" onclick="co_getCheckBoxAndRadioValue()"/>
				<label for="room_parking" class="room_condition_label car">
				<figure>
				<figcaption>주차장</figcaption>
				</figure>
				</label>
				</div>
				
				<div class="room_condition_div col-xs-12 col-3">
				<input type="checkbox" name="room_swpool" id="room_swpool" value="Y" onclick="co_getCheckBoxAndRadioValue()"/>
				<label for="room_swpool" class="room_condition_label swim">
				<figure>
				<figcaption>수영장</figcaption>
				</figure>
				</label>
				</div>
				</div>
				
			</div>
			
			<br>
			<br>
		
			<input type="hidden" name="room_likes" id="room_likes" value="0" />
			<input type="hidden" name="room_stars" id="room_stars" value="0" />
			
			<div style="text-align: center">
			<button class="btn btn-outline-dark" type="submit">숙소 등록하기</button>
			</div>
			
		</form>
		
	</div>
		
</div>
</body>
</html>