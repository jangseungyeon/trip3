<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 등록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
	
	$(function(){
		//1박당 가격 인풋창 값 넣었을때 실행되는 함수
		$('#room_price').on('keyup', function(){
			//숫자만, 천단위 자동 콤마 입력
			$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			
			var price = parseInt($('#room_price').val() || 0);
			
			//마일리지 1박당 가격에 0.5%로 자동 계산
			var result = Math.floor(price * 0.1);
			
			//마일리지 인풋창에 값 넣기
			$("#room_points").val(result);
		});
		
		$('#room_max').on('keyup', function(){
			//최대 인원 인풋창에 값 넣었을때 숫자만 입력
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	});
		
		//타입 파일 인풋창 사진 올리면 미리보기 뜨게하는 함수
		function readThisImg(img) {
			if(img.files && img.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('room_img_preview').src = e.target.result;
				};
				reader.readAsDataURL(img.files[0]);
			} else {
				document.getElementById('room_img_preview').src = "";
			}
		}
</script>



<style>

/* 산 배경사진 */
.mountain {
	background-image:url(https://pixabay.com/get/g1cc4632e502cdf83da2ef34dd66f1e470e35f53dd4f9266ee9e4fa1d38ce510f5efb620f1b95591b9d01e119a7bb63628a891e9aa4b61b822732cc6d7e6128834257b3f0538e83e740b699b3749ab343_640.png);
	
}

/* 바다 배경사진 */
.sea {
	background-image:url(https://pixabay.com/get/g66b3ee9a3b6a112c7a0d85c4ca24835c53446e3fa6ea8f9e216c69e7338e490762679a3bb68460f61cf1fb63ebec75c69e8742105c430df91108e13dad5b369c9a3e8008b788c8cc2bbc806fbe868435_640.jpg);
}

/* 산과 바다 배경사진 */
.mountainSea {
	background-image:url(https://pixabay.com/get/g319b15efe1b2ffbd74263be9fbf265541b9cf85ae79368651cb456f4d0d50de92a3859ca150b94e0abf30e9b7291ae2f00c13fa30c16367aa4713714db227fcee85905459565c108d503fb24343decc1_640.jpg);
}

/* 호텔 배경사진 */
.hotel {
	background-image:url(https://pixabay.com/get/g74b35837e69d54f8a2207358877b0be81c4dd840c02ccc38c6f097658c1571ae9e726d363137f8f30799cc5855b4a8fe6f825fe66a2c20e1e1e10ec0551f5cf6ea75b5b631620f643c93130b6e8f085e_640.jpg);
}

/* 모텔 배경사진 */
.motel {
	background-image:url(https://pixabay.com/get/gedda6e922ff3184990b9b570078562a0af00f149d0a99a80537dae127854f8cbc142002d49b03e7e91877c74dbfcff298fa6d395d729319f27334331d4b8e230a615bf75435b572bd6ce25794a6b2976_640.jpg);
}

/* 게스트 하우스 배경사진 */
.guestHouse {
	background-image:url(https://pixabay.com/get/g543c3af910c42239259e052adc75ad8d75048220b8fa855bb8b348131f0a35882b8006b65b0c07b9f7ab9f51c0f0e079c1bb27663667b4c8435cd969dc4c307d28305baa739f334bbf815c6284b040e2_640.jpg);
}

/* 민박 배경사진 */
.minbak {
	background-image:url(https://pixabay.com/get/gb15dc6e556bde37d71c0f8fd978fd3f81194baedde97f31d279ce9b65090dff1f7469eddabea525aed45bea5029da09ccc89b2b2320bf913056a1c1c7d1c1a816442be572b879e82954785b1a024d556_640.jpg);
}

/*펜션 배경사진 */
.pension {
	background-image:url(https://pixabay.com/get/ged68364e1fe31213f6bcaea2b260727bdf5313efececba7615239bffeb80edbd7ef6a3dbaf743b351820d808081fd1e96ca21571a64e0818369c1b843bd043ab8c0873f9ba5c5e2ec97d283e6b0d719e_640.jpg);
}

/*여기서부터 숙박 시설 산/바다/산과바다, 호텔/모텔/게스트하우스/민박/펜션 css 애니메이션 설정 */
#room_theme_Box input, #room_cat_Box input {
	margin: 0;
	padding: 0;
	appearence: none;
	/*appearence => 요소들의 기본 속성을 조절 가능, none으로 하면 요소 기본 속성 제거, 앞으로 변형을 위해서 적용*/
	display: none;
}

#room_theme_Box input:active + .room_theme_label, room_cat_Box input:active + .room_cat_label {
	opacity: 0.9;
}

#room_theme_Box input:checked + .room_theme_label, #room_cat_Box input:checked + .room_cat_label{
	filter: none;
	/*찍은 사진에 필터를 적용하듯 이미지에 필터를 적용하는 역할이 이 filter css 속성, input radio가 체크되면 필터가 적용 안되게 하는것*/
}

.room_theme_label, .room_cat_label {
	/*label에 커서 포인터 속성 주고 배경 이미지는 꽉 맞게, 반복 없이 블락속성도 보유하게끔 inline-block, 필터에서 회색조+밝기80%증가+투명도30%만 적용, transition으로 천천히 바뀌는 모습 설정*/
	text-align: center;
	cursor: pointer;
	background-size: contain;
	background-repeat: no-repeat;
	display: inline-block;
	width: 300px;
	height: 300px;
	transition: all 100ms ease-in;
	filter: brightness(1.8) grayscale(1) opacity(.3);
}

	/*마우스 올렸을때 밝기20%증가로 조정 + 회색조 50% 감소 + 투명도 90프로로 증가*/
.room_theme_label:hover, .room_cat_label:hover {
	filter: brightness(1.2) grayscale(.5) opacity(.9);
}
	/*숙박시설 기반 조건들 인풋창 체크박스들 나란히 한줄에 정렬*/
#room_condition div {
	float: left;
}

#room_insert_form_div {
	width: 80%;
	margin: 20px auto;
	text-align: center;
	
}

#room_theme_Box #room_theme_div, #room_cat_Box .room_cat_div, #room_conditions_Box .room_conditions_div {
	display: flex;
	justify-content: center;
}

#insertRoomForm input {
	text-align: center;
}

</style>

</head>
<body>
<div id="room_insert_form_div">

<form action="insertRoom.do" method="post" enctype="multipart/form-data" id="insertRoomForm">

<!-- 숙박 시설 이름 등록 -->
<div id="roomNameBox">
<div id="room_name_q">등록하시려는 숙박시설 이름은 어떻게 되시나요?</div>
<br>
<div><input name="room_name" type="text" id="room_name"/></div>
</div>

<br>
<br>

<!-- 숙박 시설 주소 등록 -->
<div id="roomAddrBox">
<div id="room_addr_q">주소는 어떻게 되시나요?</div>
<br>
<div>
<input name="room_addr" type="text" id="room_addr" readonly />&nbsp;
<input name="room_addr_detail" type="text" id="room_addr_detail" />&nbsp;
<button type="button" id="room_addr_search">검색</button>
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

document.getElementById("room_addr_search").addEventListener("click", function(){
	//주소 입력칸을 클릭하면 주소 검색창 팝업
	 new daum.Postcode({
	        oncomplete: function(data) {
				document.getElementById("room_addr").value = data.address;
				document.querySelector("#room_addr_detail").focus();
	        }
	    }).open();
	})
	
</script>

<br>
<br>

<!-- 호스트 아이디는 DB에서 혹은 세션에서 불러와서 아래 해당 input에 값으로만 세팅해놓고 안보이게 처리할것임 (hidden이라도 form 데이터 전송할때 값은 전송됨) -->
<div id="host_id_Box">
<input name="host_id" type="hidden" id="host_id" value=""/>
</div>

<!-- 숙박 시설 1박당 가격 등록 -->
<div id="room_price_Box">
<div id="room_price_q">1박당 가격은 어떻게 되세요?</div>
<br>
<div>
<input name="room_price" type="text" id="room_price" />&nbsp;원
</div>
</div>

<br>
<br>

<!-- 숙박 시설 대표 이미지 등록 -->
<div id="room_img_Box">
<div id="room_img_q">숙박시설을 잘 보여주는 대표 이미지를 등록하세요.</div>
<br>
<div>
<img id="room_img_preview" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="250" heigth="250"/>
</div>
<br>
<div>
<input name="uploadFile" type="file" id="room_img" onchange="readThisImg(this);" />
</div>
</div>

<br>
<br>

<!-- 숙박 시설 마일리지 등록 -->
<div id="room_points_Box">
<div id="room_points_q">저희 사이트에 등록시 숙박시설 마일리지는 다음과 같습니다.(숙박 1박당 가격의 1%)</div>
<br>
<div>
<input name="room_points" type="text" id="room_points" readonly/>&nbsp;포인트
</div>
</div>

<br>
<br>

<!-- 숙박 시설 최대 인원 등록 -->
<div id="room_max_Box">
<label id="room_max_q">숙박시설의 최대 인원은 어떻게 되세요?</label>
<div>
<input name="room_max" type="text" id="room_max" />&nbsp;명
</div>
</div>

<br>
<br>

<!-- 숙박 시설 테마 (산/바다/산과 바다) -->
<div id="room_theme_Box">

	<div id="room_theme_q">근처에 산과 바다가 있나요? 있다면 아래에서 체크 선택해주세요.</div>
	
	<br>
	
	<div class="room_theme_div">
	<input type="radio" name="room_theme" id="room_theme_mountain" value="mountain"/>
	<label class="room_theme_label mountain" for="room_theme_mountain"></label>
	
	<input type="radio" name="room_theme" id="room_theme_sea" value="sea"/>
	<label class="room_theme_label sea" for="room_theme_sea"></label>
	
	<input type="radio" name="room_theme" id="room_theme_mountainSea" value="mountainSea"/>
	<label class="room_theme_label mountainSea" for="room_theme_mountainSea"></label>
	</div>
	
</div>

<br>
<br>

<!-- 숙박 시설 유형 등록 -->
<div id="room_cat_Box">

<div id="room_cat_q">숙박 시설의 유형은 어떻게 되시나요?</div>

	<br>

<div class="room_cat_div">

<input type="radio" name="room_cat" id="room_cat_hotel" value="hotel" required/>
<label class="room_cat_label hotel" for="room_cat_hotel" id="room_cat_hotel_label"></label>

<input type="radio" name="room_cat" id="room_cat_motel" value="motel"/>
<label class="room_cat_label motel" for="room_cat_motel" id="room_cat_motel_label"></label>

<input type="radio" name="room_cat" id="room_cat_guestHouse" value="guestHouse"/>
<label class="room_cat_label guestHouse" for="room_cat_guestHouse" id="room_cat_guestHouse_label"></label>

<input type="radio" name="room_cat" id="room_cat_minbak" value="minbak" />
<label class="room_cat_label minbak" for="room_cat_minbak" id="room_cat_minbak_label"></label>

<input type="radio" name="room_cat" id="room_cat_pension" value="pension" />
<label class="room_cat_label pension" for="room_cat_pension" id="room_cat_pension_label"></label>
</div>

</div>

<br>
<br>

<!-- 숙박 시설 조건들 체크 -->
<div id="room_condition_q">그 외 숙박시설이 갖추고 있는 것들을 체크해주세요.(여러개 선택 가능)</div>

<br>

<div id="room_conditions_Box">

<div id="room_conditions_div">
<input type="checkbox" name="room_wifi" id="room_wifi" value="Y" />
<label for="room_wifi" id="room_wifi_label">와이파이</label>

<input type="checkbox" name="room_pet" id="room_pet" value="Y" />
<label for="room_pet" id="room_pet_label">애완견 동반 투숙 가능</label>


<input type="checkbox" name="room_meal" id="room_meal" value="Y" />
<label for="room_meal" id="room_meal_label">조식 포함</label>

<input type="checkbox" name="room_parking" id="room_parking" value="Y" />
<label for="room_parking" id="room_meal_label">주차장</label>

<input type="checkbox" name="room_swpool" id="room_swpool" value="Y" />
<label for="room_swpool" id="room_swpool_label">수영장</label>
</div>

</div>

<br>
<br>

<button type="submit">숙소 등록하기</button>

</form>

</div>

</body>
</html>