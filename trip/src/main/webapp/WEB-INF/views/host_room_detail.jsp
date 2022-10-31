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

	function f_roomDelete(room_id, host_id) {
		location.href="deleteRoom.do?room_id=" + room_id + "&host_id=" + host_id; 
	}
	
	function f_roomUpdateGo(){
		var dtl = document.getElementById("hostRoomDetail");
		
		dtl.addClass("hide");
		
		var dtlfrm = document.getElementById("hostRoomDetailfrm");
		
		dtl.removeClass("hide");
	}
	
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
		
		$()
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
	#hostRoomDetail .hide {
		display: none;
	}
	
	#hostRoomDetailfrm .hide {
		display: none;
	}
</style>
</head>
<body>
	<div id="hostRoomDetailDiv">
		<img src="/resources/room_img/${room.room_img}" width="300" height="200" alt="${room.room_name} 대표 이미지" title="${room.room_name} 대표 이미지"/>
		
		<div id="hostRoomDetail">
			<p>숙소명: ${room.room_name}</p>
			<p>숙소 주소: ${room.room_addr}&nbsp;&nbsp;${room.room_addr_detail}</p>
			<p>숙소 1박당 가격: ${room.room_price}</p>
			<p>숙소 설명: ${room.room_desc}</p>
			<p>숙소 마일리지: ${room.room_points}</p>
			<p>숙소 최대 인원: ${room_room_max}</p>
			<p>숙소 주변 환경(테마): ${room.room_theme}</p>
			<p>숙소 카테고리 유형: ${room.room_cat}</p> 
			<p>숙소 와이파이 유무: ${room.room_wifi}</p>
			<p>숙소 와이파이 애완견 동반 투숙 가능 여부: ${room.room_pet}</p>
			<p>숙소 조식 포함 여부: ${room.room_meal}</p>
			<p>숙소 주차 가능 여부: ${room.room_parking}</p>
			<p>숙소 수영장 보유 여부: ${room.room_swpool}</p>
			<p>숙소 좋아요 수: ${room.room_likes}</p>
			<p>숙소 별점 평균: ${room.room_stars}</p>
		</div>
		
		<form id="hostRoomDetailfrm" class="hide" action="updateRoom.do" method="post" enctype="multipart/form-data">
			
			<div id="room_name_box">
			<label id="room_name_label" for="room_name">숙박시설 이름</label>
			<input name="room_name" type="text" id="room_name" value="${room.room_name}"/>
			</div>
			
			<br>
			<br>
			
			<div id="room_addr_box">
			<label id="room_addr_label" for="room_addr">숙박시설 주소</label>
			<input name="room_addr" type="text" id="room_addr" readonly value="${room.room_addr}"/>&nbsp;
			<input name="room_addr_detail" type="text" id="room_addr_detail" readonly value="${room.room_addr_detail}"/>&nbsp;
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
				<input name="host_id" type="hidden" id="host_id" value="${host_id}"/>
			</div>
			
			<div id="room_id_box">
				<input name="room_id" type="hidden" id="room_id" value="${room_id}" />
			</div>
			
			<br>
			<br>
			
			<div id="room_price_box">
				<label id="room_price_label" for="room_price">숙박시설 1박당 가격</label>
				<input name="room_price" type="text" id="room_price" value="${room.room_price}"/>&nbsp;원
			</div>
			
			<br>
			<br>
			
			<div id="room_points_box">
			<label id="room_points_box" for="room_points">숙박 마일리지 (숙박 1박당 가격의 8%로 자동 계산)</label>
			<input name="room_points" type="text" id="room_points" readonly value="${room.room_points}"/>&nbsp;포인트
			</div>
			
			<br>
			<br>
			
			<div id="room_img_box">
				<img src="/resources/room_img/${room.room_img}" id="room_img_preview" alt="숙소 대표 이미지 미리보기" title="숙소 대표 이미지" width="250" height="250" />
				<br>
				<div id="room_desc_box">
				<input name="uploadFile" type="file" id="room_img" onchange="readThisImage(this);"/>
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
	
		</form>
	<div id="roomModifyButtons">
		<button id="deleteRoom" onclick="f_roomDelete('${room.room_id}', '${room.host_id}')">${room.room_name} 삭제하기</button>
		<button id="updateRoom" onclick="f_roomUpdateGo()">${room.room_name} 수정하기 시작</button>
	</div>
</body>
</html>