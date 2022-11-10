<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소 상세 페이지</title>

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

	$(function(){
		
		//페이지 로딩 되자마자 모든 input 창 disabled 활성화

		$('input').attr("disabled", true);
		
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
			} else {
				document.getElementById('room_img_sub4_preview').src = "";
			}
		}


</script>

<style>

#room_img_main_div, #room_img_sub1_div, #room_img_sub2_div, #room_img_sub3_div, #room_img_sub4_div {
	float: left;
}

#room_desc_box {
	clear: both;
}

#room_img_preview_box {
	display: flex;
	justify-content: center;
}


</style>
</head>
<body>

	<div id="hostRoomDetailfrmDiv">
		<form id="hostRoomDetailfrm" action="updateRoom.do" method="post"
			enctype="multipart/form-data">

			<div id="room_name_box">
				<label id="room_name_label" for="room_name">${roomListHeadMap.RoomName}</label>
				<input name="room_name" type="text" id="room_name"
					value="${room.room_name}" />
			</div>

			<div id="room_addr_box">
				<label id="room_addr_label" for="room_addr">${roomListHeadMap.RoomAddr}</label>
				<input name="room_addr" type="text" id="room_addr"
					value="${room.room_addr}" />&nbsp; <input name="room_addr_detail"
					type="text" id="room_addr_detail" value="${room.room_addr_detail}" />&nbsp;
				<button type="button" id="room_addr_search">검색</button>
			</div>

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

			<script>
				document
						.getElementById("room_addr_search")
						.addEventListener(
								"click",
								function() {
									//주소 입력칸을 클릭하면 주소 검색창 팝업
									new daum.Postcode(
											{
												oncomplete : function(data) {
													document
															.getElementById("room_addr").value = data.address;
													document
															.querySelector(
																	"#room_addr_detail")
															.focus();
												}
											}).open();
								})
			</script>

			<div id="host_id_box">
				<input name="host_id" type="hidden" id="host_id"
					value="${room.host_id}" />
			</div>

			<div id="room_id_box">
				<input name="room_id" type="hidden" id="room_id"
					value="${room.room_id}" />
			</div>

			<div id="room_price_box">
				<label id="room_price_label" for="room_price">${roomListHeadMap.RoomPrice}</label>
				<input name="room_price" type="text" id="room_price"
					value="${room.room_price}" />&nbsp;원
			</div>

			<div id="room_points_box">
				<label id="room_points_box" for="room_points">${roomListHeadMap.RoomPoints}</label>
				<input name="room_points" type="text" id="room_points" readonly
					value="${room.room_points}" />&nbsp;포인트
			</div>

			<div id="room_img_preview_box">
				
				<div id="room_img_main_div">
				<img id="room_img_main_preview" src="resources/room_img/${room.room_img_no1}" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="250" height="250"/>
				<div>숙소 대표 이미지</div>
				<div>
				<input name="room_img_no1_multi" type="file" id="room_img" onchange="readThisMainImg(this);" />
				</div>
				</div>
				
				<div id="room_img_sub1_div">
				<img id="room_img_sub1_preview" src="resources/room_img/${room.room_img_no2}" alt="숙소 서브1 이미지 미리보기" title="숙소 서브1 이미지" width="250" height="250"/>
				<div>숙소 서브1 이미지</div>
				<div>
				<input name="room_img_no2_multi" type="file" id="room_img" onchange="readThisSub1Img(this);" />
				</div>
				</div>

				<div id="room_img_sub2_div">
				<img id="room_img_sub2_preview" src="resources/room_img/${room.room_img_no3}" alt="숙소 서브2 이미지 미리보기" title="숙소 서브2 이미지" width="250" height="250"/>
				<div>숙소 서브2 이미지</div>
				<div>
				<input name="room_img_no3_multi" type="file" id="room_img" onchange="readThisSub2Img(this);" />
				</div>
				</div>

				<div id="room_img_sub3_div">
				<img id="room_img_sub3_preview" src="resources/room_img/${room.room_img_no4}" alt="숙소 서브3 이미지 미리보기" title="숙소 서브3 이미지" width="250" height="250"/>
				<div>숙소 서브3 이미지</div>
				<div>
				<input name="room_img_no4_multi" type="file" id="room_img" onchange="readThisSub3Img(this);" />
				</div>
				</div>

				<div id="room_img_sub4_div">
				<img id="room_img_sub4_preview" src="resources/room_img/${room.room_img_no5}" alt="숙소 서브4 이미지 미리보기" title="숙소 서브4 이미지" width="250" height="250"/>
				<div>숙소 서브4 이미지</div>
				<div>
				<input name="room_img_no5_multi" type="file" id="room_img" onchange="readThisSub4Img(this);" />
				</div>
				</div>

			</div>

			<div id="room_desc_box">
				<textarea name="room_desc" id="room_desc"
					placeholder="${roomListHeadMap.RoomDesc}">${room.room_desc}</textarea>
			</div>

			<div id="room_max_box">
				<label id="room_max_label" for="room_max">${roomListHeadMap.RoomMax}</label>
				<input name="room_max" type="number" id="room_max"
					value="${room.room_max}" />&nbsp;명
			</div>

			<div class="room_theme_div">

				<input type="checkbox" name="room_theme" id="room_theme_mountain" value="mountain" /> 
				<label class="room_theme_label mountain" for="room_theme_mountain">산</label> 
				
				<input type="checkbox" name="room_theme" id="room_theme_sea" value="sea" />
				<label class="room_theme_label sea" for="room_theme_sea">바다</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_forest" value="forest" />
				<label class="room_theme_label forest" for="room_theme_forest">숲</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_valley" value="valley" />
				<label class="room_theme_label valley" for="room_theme_valley">계곡</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_river" value="river" />
				<label class="room_theme_label river" for="room_theme_river">강</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_city" value="city" />
				<label class="room_theme_label city" for="room_theme_city">도시</label>

			</div>

			<div class="room_cat_div">

				<input type="radio" name="room_cat" id="room_cat_hotel" value="hotel" required />
				<label class="room_cat_label hotel" for="room_cat_hotel" id="room_cat_hotel_label">호텔</label>
				
				<input type="radio" name="room_cat" id="room_cat_motel" value="motel" />
				<label class="room_cat_label motel" for="room_cat_motel" id="room_cat_motel_label">모텔</label>
				
				<input type="radio" name="room_cat" id="room_cat_guestHouse" value="guestHouse" />
				<label class="room_cat_label guestHouse" for="room_cat_guestHouse" id="room_cat_guestHouse_label">게스트 하우스</label>
				
				<input type="radio" name="room_cat" id="room_cat_minbak" value="minbak" />
				<label class="room_cat_label minbak" for="room_cat_minbak" id="room_cat_minbak_label">민박</label>
				
				<input type="radio" name="room_cat" id="room_cat_pension" value="pension" />
				<label class="room_cat_label pension" for="room_cat_pension" id="room_cat_pension_label">펜션</label>
			</div>

			<div id="room_conditions_div">

				<input type="checkbox" name="room_wifi" id="room_wifi" value="Y" />
				<label for="room_wifi" id="room_wifi_label">${roomListHeadMap.RoomWIFI}</label>

				<input type="checkbox" name="room_pet" id="room_pet" value="Y" /> <label
					for="room_pet" id="room_pet_label">${roomListHeadMap.RoomPet}</label>

				<input type="checkbox" name="room_meal" id="room_meal" value="Y" />
				<label for="room_meal" id="room_meal_label">${roomListHeadMap.RoomMeal}</label>

				<input type="checkbox" name="room_parking" id="room_parking"
					value="Y" /> <label for="room_parking" id="room_parking_label">${roomListHeadMap.RoomParking}</label>

				<input type="checkbox" name="room_swpool" id="room_swpool" value="Y" />
				<label for="room_swpool" id="room_swpool_label">${roomListHeadMap.RoomSwpool}</label>

			</div>

		</form>
	</div>
	<div id="roomModifyButtons">
		<button id="deleteRoom" onclick="f_roomDelete()">삭제하기</button>
		<button id="updateRoom" onclick="f_roomUpdateGo()">수정하기</button>
	</div>
</body>
</html>