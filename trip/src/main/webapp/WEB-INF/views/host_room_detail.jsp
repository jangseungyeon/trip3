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

function f_roomDelete() {
	
	var deleteYnF = confirm("${room.room_name}" + " 을/를 삭제하시겠습니까?");
	
	if(deleteYnF == true) {
		
		location.href="deleteRoom.do?room_id=" + "${room.room_id}" + "&host_id=" + "${room.host_id}"; 
		
	}
	else {
		alert("삭제를 취소하셨습니다.");
		return;
	}
}

function f_roomUpdateFinal() {
	var updateYnF = confirm("${room.room_name}" + " 을/를 수정하시겠습니까?");
	
	if(updateYnF == true) {
		
		document.getElementById("hostRoomDetailfrm").submit();
	}
	else {
		alert("수정을 취소하셨습니다.");
		return;
	}
}


function f_roomUpdateGo(){
	
	$('input').attr("disabled", false);
	
	document.getElementById("updateRoom").innerText = "수정하기 제출";
	
	document.getElementById("updateRoom").removeAttribute("onclick");
	
	document.getElementById("updateRoom").setAttribute("onclick", "f_roomUpdateFinal()");
	
}


$(function(){
	
	$('input').attr("disabled", true);
	
	var room_theme_arr = new Array();
	
	room_theme_arr = '${room.room_theme}'.split(",");
	
	console.log(room_theme_arr);
	
	for(var i=0; i < room_theme_arr.length; i++) {
		
		if(room_theme_arr[i] == 'mountain') {
			$("#room_theme_mountain").prop("checked", true);
		}
		
		if(room_theme_arr[i] == 'sea') {
			$("#room_theme_sea").prop("checked", true);
		}
		
		if(room_theme_arr[i] == "mountainSea") {
			$("#room_theme_mountainSea").prop("checked", true);
		}
		
		if(room_theme_arr[i] == "forest") {
			$("#room_theme_forest").prop("checked", true);		
		}
		
		if(room_theme_arr[i] == "valley") {
			$("#room_theme_valley").prop("checked", true);
		}
		
		if(room_theme_arr[i] == "river") {
			$("#room_theme_river").prop("checked", true);
		}
		
		if(room_theme_arr[i] == "city") {
			$("#room_theme_city").prop("checked", true);
		}
	}
	
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
				document.getElementById('room_img_preview').src = "/resources/room_img/${room.room_img}";
			}
		}
		
		
</script>

<style>

</style>
</head>
<body>
	
	<div id="hostRoomDetailfrmDiv">
		<form id="hostRoomDetailfrm" action="updateRoom.do" method="post" enctype="multipart/form-data">
			
			<div id="room_name_box">
			<label id="room_name_label" for="room_name">숙박시설 이름</label>
			<input name="room_name" type="text" id="room_name" value="${room.room_name}" />
			</div>
			
			<br>
			<br>
			
			<div id="room_addr_box">
			<label id="room_addr_label" for="room_addr">숙박시설 주소</label>
			<input name="room_addr" type="text" id="room_addr" value="${room.room_addr}" />&nbsp;
			<input name="room_addr_detail" type="text" id="room_addr_detail" value="${room.room_addr_detail}" />&nbsp;
			<button type="button" id="room_addr_search">검색</button>
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
			
			<div id="host_id_box">
				<input name="host_id" type="hidden" id="host_id" value="${room.host_id}"/>
			</div>
			
			<div id="room_id_box">
				<input name="room_id" type="hidden" id="room_id" value="${room.room_id}" />
			</div>
			
			<br>
			<br>
			
			<div id="room_price_box">
				<label id="room_price_label" for="room_price">숙박시설 1박당 가격</label>
				<input name="room_price" type="text" id="room_price" value="${room.room_price}" />&nbsp;원
			</div>
			
			<br>
			<br>
			
			<div id="room_points_box">
			<label id="room_points_box" for="room_points">숙박 마일리지 (숙박 1박당 가격의 8%로 자동 계산)</label>
			<input name="room_points" type="text" id="room_points" readonly value="${room.room_points}" />&nbsp;포인트
			</div>
			
			<br>
			<br>
			
			<div id="room_img_box">
				<img src="/resources/room_img/${room.room_img}" id="room_img_preview" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="250" height="250" />
				<br>
				<div id="room_desc_box">
				<input name="uploadFile" type="file" id="room_img" onchange="readThisImg(this);"/>
				</div>
			</div>
			
			<br>
			<br>
			
			<div id="room_desc_box">
			<textarea name="room_desc" id="room_desc" placeholder="여기에 설명을 적어주세요">${room.room_desc}</textarea>
			</div>
			
			<br>
			<br>
			
			<div id="room_max_box">
			<label id="room_max_label" for="room_max">숙박 시설 최대 인원</label>
			<input name="room_max" type="text" id="room_max" value="${room.room_max}"/>&nbsp;명
			</div>
			
			<div class="room_theme_div">
	
				<input type="checkbox" name="room_theme" id="room_theme_mountain" value="mountain"/>
				<label class="room_theme_label mountain" for="room_theme_mountain">산</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_sea" value="sea"/>
				<label class="room_theme_label sea" for="room_theme_sea">바다</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_mountainSea" value="mountainSea"/>
				<label class="room_theme_label mountainSea" for="room_theme_mountainSea">산과 바다</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_forest" value="forest"/>
				<label class="room_theme_label forest" for="room_theme_forest">숲</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_valley" value="valley"/>
				<label class="room_theme_label valley" for="room_theme_valley">계곡</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_river" value="river" />
				<label class="room_theme_label river" for="room_theme_river">강</label>
				
				<input type="checkbox" name="room_theme" id="room_theme_city" value="city" />
				<label class="room_theme_label city" for="room_theme_city">도시</label>
	
			</div>
	
		</form>
	</div>
	<div id="roomModifyButtons">
		<button id="deleteRoom" onclick="f_roomDelete()">삭제하기</button>
		<button id="updateRoom" onclick="f_roomUpdateGo()">수정하기 시작</button>
	</div>
</body>
</html>