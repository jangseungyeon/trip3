<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업주용 숙소 등록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script>
	
	$(function(){
		//1박당 가격 인풋창 값 넣었을때 실행되는 함수
		$('#room_price').on('keyup', function(){
			//숫자만, 천단위 자동 콤마 입력
			$(this).val($(this).val().replace(/[^0-9]/g,"").replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			
			var price = parseInt($('#room_price').val() || 0);
			
			//마일리지 1박당 가격에 0.5%로 자동 계산
			var result = Math.floor(price * 0.8);
			
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
	background-image:url("resources/img/mountain.png");
	
}

/* 바다 배경사진 */
.sea {
	background-image:url("resources/img/beach.jpg");
}

/* 산과 바다 배경사진 */
.mountainSea {
	background-image:url("resources/img/mountainSea.jpg");
}

/* 숲 배경사진 */
.forest {
	background-image:url("resources/img/forest.jpg")
}

/* 계곡 배경사진 */
.valley {
	background-image:url("resources/img/valley.jpg");
}

/* 강 배경사진 */
.river {
	background-image:url("resources/img/river.jpg");
}

/* 도시 배경사진 */
.city {
	background-image:url("resources/img/city.jpg");
}

/* 호텔 배경사진 */
.hotel {
	background-image:url("resources/img/hotel.jpg");
}

/* 모텔 배경사진 */
.motel {
	background-image:url("resources/img/motel.jpg");
}

/* 게스트 하우스 배경사진 */
.guestHouse {
	background-image:url("resources/img/guestHouse.jpg");
}

/* 민박 배경사진 */
.minbak {
	background-image:url("resources/img/minbak.jpg");
}

/*펜션 배경사진 */
.pension {
	background-image:url("resources/img/pension.jpg");
}

/*여기서부터 숙박 시설 산/바다/산과바다, 호텔/모텔/게스트하우스/민박/펜션 css 애니메이션 설정 */
#room_theme_box input, #room_cat_box input {
	margin: 0;
	padding: 0;
	appearence: none;
	/*appearence => 요소들의 기본 속성을 조절 가능, none으로 하면 요소 기본 속성 제거, 앞으로 변형을 위해서 적용*/
	display: none;
}

#room_theme_box input:active + .room_theme_label, room_cat_box input:active + .room_cat_label {
	opacity: 0.9;
}

#room_theme_box input:checked + .room_theme_label, #room_cat_box input:checked + .room_cat_label{
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

#room_theme_box #room_theme_div, #room_cat_box .room_cat_div, #room_conditions_box .room_conditions_div {
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
<div id="room_name_box">
<div id="room_name_q">등록하시려는 숙박시설 이름은 어떻게 되시나요?</div>
<br>
<div><input name="room_name" type="text" id="room_name"/></div>
</div>

<br>
<br>

<!-- 숙박 시설 주소 등록 -->
<div id="room_addr_box">
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

<!-- 업주 아이디는 DB에서 혹은 세션에서 불러와서 아래 해당 input에 값으로만 세팅해놓고 안보이게 처리할것임 (hidden이라도 form 데이터 전송할때 값은 전송됨) -->
<div id="host_id_box">
<input name="host_id" type="hidden" id="host_id" value="${host_id}"/>
</div>

<!-- 숙박 시설 1박당 가격 등록 -->
<div id="room_price_box">
<div id="room_price_q">1박당 가격은 어떻게 되세요?</div>
<br>
<div>
<input name="room_price" type="text" id="room_price" />&nbsp;원
</div>
</div>

<br>
<br>

<!-- 숙박 시설 대표 이미지 등록 -->
<div id="room_img_box">
<div id="room_img_q">숙박시설을 잘 보여주는 대표 이미지를 등록하세요.</div>
<br>
<div>
<img id="room_img_preview" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="250" height="250"/>
</div>
<br>
<div>
<input name="uploadFile" type="file" id="room_img" onchange="readThisImg(this);" />
</div>
</div>

<br>
<br>

<!-- 숙박 시설 소개글 & 자세한 설명 등록 -->

<div id="room_desc_box">
<div id="room_desc_q">등록하시려는 숙박시설의 소개글 및 자세한 설명을 아래에 적어주세요.</div>

<textarea name="room_desc" id="room_desc" placeholder="여기에 설명을 적어주세요"></textarea>
</div>

<br>
<br>

<!-- 숙박 시설 마일리지 등록 -->
<div id="room_points_box">
<div id="room_points_q">저희 사이트에 등록시 숙박시설 마일리지는 다음과 같습니다. (숙박 1박당 가격의 8%)</div>
<br>
<div>
<input name="room_points" type="text" id="room_points" readonly/>&nbsp;포인트
</div>
</div>

<br>
<br>

<!-- 숙박 시설 최대 수용 인원 등록 -->
<div id="room_max_box">
<div id="room_max_q">숙박시설의 최대 수용 인원은 어떻게 되세요?</div>
<div>
<input name="room_max" type="text" id="room_max" />&nbsp;명
</div>
</div>

<br>
<br>

<!-- 숙박 시설 테마 (산/바다/산과 바다/숲/계곡/강/도시) -->
<div id="room_theme_box">

	<div id="room_theme_q">숙박시설이 위치한 곳의 특징을 아래 사진들에서 골라 결정해주세요. (중복선택 가능)</div>
	
	<br>
	
	<div class="room_theme_div">
	
	<input type="checkbox" name="room_theme" id="room_theme_mountain" value="mountain"/>
	<label class="room_theme_label mountain" for="room_theme_mountain"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_sea" value="sea"/>
	<label class="room_theme_label sea" for="room_theme_sea"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_mountainSea" value="mountainSea"/>
	<label class="room_theme_label mountainSea" for="room_theme_mountainSea"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_forest" value="forest"/>
	<label class="room_theme_label forest" for="room_theme_forest"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_valley" value="valley"/>
	<label class="room_theme_label valley" for="room_theme_valley"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_river" value="river" />
	<label class="room_theme_label river" for="room_theme_river"></label>
	
	<input type="checkbox" name="room_theme" id="room_theme_city" value="city" />
	<label class="room_theme_label city" for="room_theme_city"></label>
	
	</div>
	
</div>

<br>
<br>

<!-- 숙박 시설 유형 등록 -->
<div id="room_cat_box">

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

<div id="room_conditions_box">

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