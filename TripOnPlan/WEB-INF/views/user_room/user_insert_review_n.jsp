<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 등록하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

body {
	margin: 10px auto;
	text-align: center;
}

.title_star {
	font-size: 1.3rem;
	font-weight: 600;
}

.room_name, .room_addr {
	margin-top: 10px;
	font-size: 1.1rem;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}

.cmd{
    margin-top: 20px;
    text-align: right;
}
.cmd input[type="button"]{
    padding: 10px 20px;
 	border: 1px solid #ff8e15; 
  	border-radius: 7px;
    background-color: #ff8e15;
    cursor: pointer;
    color: #fff;
}

.cmd input[type="button"]:hover {
	background-color: #ff9a2d;
    color: white;
}

  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
    margin-bottom: 10px;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: yellow;
    overflow: hidden;
    pointer-events: none;
  }
  
  h1{
    text-align: center;
    background-color: #fff;
    padding: 5px;
    margin: 0;
}

/* 레이아웃 외곽 너비 400px 제한*/
.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
	resize: none;
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
    font-size: 1.2rem;
}

.review_img_preivew img {
	margin: 10px auto;
	border-radius: 10px;
}
</style>
<script>
function drawStar() {
	let star_value = $('#star_range').val();
	
	console.log(star_value);
	
	star_value_s = (star_value * 10) + "%";
	
	console.log(star_value_s);
	
  document.querySelector('.star span').style.width = star_value_s;
  
  let star_value_rate = star_value * 0.5;
  
  $('#star_rate').val(star_value_rate);
}

function readThisImg(img) {
	if(img.files && img.files[0]){
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('review_img').src = e.target.result;
		};
		reader.readAsDataURL(img.files[0]);
		document.getElementById('review_img').style.display = "block";
	} else {
		document.getElementById('review_img').src = "";
	}
}

$(function(){

	$(".review_cancel_btn").on("click", function(e){
		
		window.close();
		
	});

});
	
	function Rating(){};
	
	let rating = new Rating();//별점 인스턴스 생성
	
	Rating.prototype.showMessage = function(type){//경고메시지 표시
	    switch(type){
	        case 'rate':
	            //안내메시지 표시
	            document.querySelector('.review_rating .warning_msg').style.display = 'block';
	            //지정된 시간 후 안내 메시지 감춤
	            setTimeout(function(){
	                document.querySelector('.review_rating .warning_msg').style.display = 'none';
	            },1000);            
	            break;
	        case 'review':
	            //안내메시지 표시
	            document.querySelector('.review_contents .warning_msg').style.display = 'block';
	            //지정된 시간 후 안내 메시지 감춤
	            setTimeout(function(){
	                document.querySelector('.review_contents .warning_msg').style.display = 'none';
	            },1000);    
	            break;
	    }
	}
	
	document.addEventListener('DOMContentLoaded', function(){
	
	document.querySelector('.review_textarea').addEventListener('keydown',function(){
        //리뷰 400자 초과 안되게 자동 자름
        let review = document.querySelector('.review_textarea');
        let lengthCheckEx = /^.{50,}$/;
        if(lengthCheckEx.test(review.value)){
            //400자 초과 컷
            review.value = review.value.substr(0,50);
        }
    });
	
	//저장 전송전 필드 체크 이벤트 리스너
    document.querySelector('#save').addEventListener('click', function(e){
    	
        //별점 선택 안했으면 메시지 표시
        if( ($('#star_rate').val()) == 0){
            rating.showMessage('rate');
            return false;
        }
        //리뷰 5자 미만이면 메시지 표시
        if(document.querySelector('.review_textarea').value.length < 5){
            rating.showMessage('review');
            return false;
        }
        
        let url = $('.reviewform').attr('action');
        let form = $('.reviewform')[0];
        let formData = new FormData(form);
        
        $.ajax({
        	type: "POST",
        	url: url,
        	data: formData,
        	success: function(){
		//실제로는 서버에 폼을 전송하고 완료 메시지가 표시되지만 저장된 것으로 간주하고 폼을 초기화 함.
		alert("후기 등록 완료!");
		document.querySelector(".review_textarea").value = "";
		opener.location.reload();
		window.close();
		},
		error: function(request, data) {
			alert("후기 등록에 실패하였습니다\n관리자에게 문의 바랍니다.");
		},
		cache:false,
		contentType: false,
        processData: false
    });
        
    });
    });
</script>
</head>
<body>
<div class="wrap">
        <h1>${u_room.room_name} 예약 후기 등록</h1>
        <form name="reviewform" class="reviewform" method="post" enctype="multipart/form-data" action="insertReview.do">
            <input type="hidden" name="star_point" id="star_rate" value="0"/>
         	<input type="hidden" name="room_name" value='${u_room.room_name}'>
         	<input type="hidden" name="room_id" value='${u_room.room_id}'>
         	<input type="hidden" name="host_id" value='${u_room.host_id}'>
         	<div class="title_star">
            <p>별점과 이용경험을 남겨주세요.</p>
            </div>
            <input type="hidden" name="user_id" value="${user_id}">
            <div class="room_desc">
            <img style="border-radius: 10px;"src="resources/room_img/${u_room.room_img_no1}" alt="숙소 썸네일 이미지" title="숙소 썸네일 이미지" width="180" height="180">
            <div class="room_name"><h4>${u_room.room_name}</h4></div>
            <div class="room_addr"><h4>${u_room.room_addr} ${u_room.room_addr_detail}</h4></div>
            </div>
            <div class="review_rating rating_point">
                <div class="warning_msg">별점을 선택해 주세요.</div>
            </div>
				<span class="star">★★★★★
				<span>★★★★★</span>
				<input id="star_range" type="range" oninput="drawStar()" value="1" step="1" min="0" max="10">
				</span>
				<div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea name="review_content" rows="10" class="review_textarea"></textarea>
            </div>
            <div class="review_img">
            	<h4>후기와 같이 올릴 사진을 여기서 업로드 해주세요</h4>
            	<div class="review_img_preivew">
            	<img id="review_img" src="" alt="리뷰 이미지 미리보기" title="리뷰 이미지" width="100" height="100" onerror="this.style.display='none'" style="border-radius: 5px;"/>
            	<input type="file" name="review_img_uploadFile" class="review_img_ipt" onchange="readThisImg(this);">
            	</div>
            </div>   
            <div class="cmd">
                <input type="button" class="review_insert_btn" name="save" id="save" value="등록">
                <input type="button" class="review_cancel_btn" value="취소"></button>
            </div>
        </form>
    </div>
</body>
</html>