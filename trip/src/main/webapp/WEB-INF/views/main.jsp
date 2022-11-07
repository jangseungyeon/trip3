<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>main</title>
<%@ include file="header.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

ul, ol {
	list-style: none;
}

a {
	text-decoration: none
}

/* body { */
/* 	display: flex; */
/* 	-ms-flex-align: center; */
/* 	flex-direction: column; */
/* 	align-items: center; */
/* 	background-color: #f5f5f5; */
/* } */

.form-search {
	display: flex;
	margin-top: 40px;
	margin-bottom: 40px;
	width: 50%;
}

.container {
    margin-top: 100px;
    
}

.container-fluid {
	padding: 0;
}

.container-fluid_ss {
    background-color: honeydew;
}

.input-group {
	justify-content: center;
}

div#mainpic {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	margin-bottom: 40px;
	width: 70%;
}

.carousel-inner img {
	width: 100%;
	height: 500px;
}

a.nav-link {
	color: white;
}

.btn btn-outline-light {
	line-height: 2em;
	margin: 0 auto;
}

ul#pills-tab {
	justify-content: center;
}

@import url("https://fonts.googleapis.com/css?family=Open+Sans");

* {
	margin: 0;
	box-sizing: border-box;
	font-family: "Open Sans", sans-serif;
}

.cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	grid-gap: 10px;
	align-items: center;
	justify-items: center;
}

.card {
	display: flex;
	flex-direction: column;
	position: relative;
	border-radius: 10px;
	box-shadow: 1px 1px 4px 1px rgb(193, 193, 193);
	margin-bottom: 20px;
}

.card .head {
	display: flex;
/* 	padding: 15px; */
	border-bottom: 2px solid #efefef;
}

.card .image {
	position: relative;
	display: flex;
	align-items: center;
	justify-items: center;
	overflow: cover;
	/* 	height: 250px; */
}

.card .details {
	position: relative;
}

.card img {
	width: 100%;
	max-width: 300px;
	height: auto;
	display: block;
}

.card .details {
	border-top: 2px solid #efefef;
	padding: 10px 20px;
	display: flex;
}

.card .details .name {
	font-size: 1.1rem;
}

.card .details .description {
	font-size: 0.8rem;
	color: grey;
}

.card .details .price {
	font-size: 1.2rem;
	color: green;
	margin: 0 auto;
}

.heart {
	position: relative;
	width: 20px;
	height: 20px;
	background: #bbb3b3;
	transform: rotate(45deg);
	display: inline-block;
}

.heart::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	background: inherit;
	border-radius: 100%;
	transform: translate(-50%, 0px);
}

.heart::before {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	background: inherit;
	border-radius: 100%;
	transform: translate(0px, -50%);
}

.heart:hover {
	transform: rotate(45deg) scale(1.3);
	background: red;
}

.card .overlay {
	position: absolute;
	height: 100%;
	width: 100%;
	background: #352353;
	z-index: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	display: none;
	opacity: 0.9;
}

.card .overlay .item {
	width: 150px;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	color: white;
	border: 1px solid white;
	margin: 10px;
}

.card:hover .overlay {
	display: flex;
	animation: 0.5s visible;
}

@
keyframes visible { 0%{
	opacity: 0;
}

100

%
{
opacity:1;
}
}

/* 이달의테마 시작 */
.ch-grid {
	margin: 20px 0 0 0;
	padding: 0;
	list-style: none;
	display: block;
	text-align: center;
	width: 100%;
}

.ch-grid:after, .ch-item:before {
	content: '';
	display: table;
}

.ch-grid:after {
	clear: both;
}

.ch-grid li {
	width: 220px;
	height: 220px;
	display: inline-block;
	margin: 20px;
}

.ch-img-1 {
	background-image:
		url("resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png");
}

.ch-img-2 {
	background-image: url("resources/img/Colorful Skywalk.png");
}

.ch-img-3 {
	background-image: url("resources/img/Light of Baekhakbong Peak.png");
}

.ch-img-4 {
	background-image:
		url("resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png");
}

.ch-item {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	position: relative;
	cursor: default;
	box-shadow: inset 0 0 0 0 rgba(200, 95, 66, 0.4), inset 0 0 0 16px
		rgba(255, 255, 255, 0.6), 0 1px 2px rgba(0, 0, 0, 0.1);
	transition: all 0.4s ease-in-out;
}

.ch-info {
	position: absolute;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	opacity: 0;
	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
	-webkit-transform: scale(0);
	-moz-transform: scale(0);
	-o-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
	-webkit-backface-visibility: hidden; /*for a smooth font */
}

.ch-info h3 {
	color: #fff;
	text-transform: uppercase;
	position: relative;
	letter-spacing: 2px;
	font-size: 22px;
	margin: 0 30px;
	padding: 65px 0 0 0;
	font-family: 'Open Sans', Arial, sans-serif;
	text-shadow: 0 0 1px #fff, 0 1px 2px rgba(0, 0, 0, 0.3);
}

.ch-info p {
	color: #fff;
	padding: 10px 5px;
	font-style: italic;
	margin: 0 30px;
	font-size: 12px;
	border-top: 1px solid rgba(255, 255, 255, 0.5);
}

.ch-info p a {
	display: block;
	color: #fff;
	color: rgba(255, 255, 255, 0.7);
	font-style: normal;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 9px;
	letter-spacing: 1px;
	padding-top: 4px;
	font-family: 'Open Sans', Arial, sans-serif;
}

.ch-info p a:hover {
	color: #ddd222;
	color: rgba(255, 242, 34, 0.8);
}

.ch-item:hover {
	box-shadow: inset 0 0 0 110px rgba(70, 65, 217, 0.4), inset 0 0 0 16px
		rgba(255, 255, 255, 0.8), 0 1px 2px rgba(0, 0, 0, 0.1);
}

.ch-item:hover .ch-info {
	opacity: 1;
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);
}

.month-thema {
	margin-top: 50px;
}

/* 이달의테마 끝 */

/* 리뷰 시작 */
.review {
	max-width: 800px;
	margin: 0 auto;
}

.card_review_btn {
	color: #ffffff;
	padding: 0.8rem;
	font-size: 14px;
	text-transform: uppercase;
	border-radius: 4px;
	font-weight: 400;
	display: block;
	width: 100%;
	cursor: pointer;
	border: 1px solid rgba(255, 255, 255, 0.2);
	background: transparent;
}

.card_review_btn:hover {
	background-color: rgba(255, 255, 255, 0.12);
}

.cards_review {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	margin: 0;
	padding: 0;
}

.cards_review_item {
	display: flex;
	padding: 1rem;
}

@media ( min-width : 40rem) {
	.cards_review_item {
		width: 50%;
	}
}

@media ( min-width : 56rem) {
	.cards_review_item {
		width: 33.3333%;
	}
}

.card_review {
	background-color: white;
	border-radius: 0.25rem;
	box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.card_review_content {
	padding: 1rem;
	background: linear-gradient(to bottom left, #EF8D9C 40%, #FFC39E 80%);
}

.card_review_title {
	color: #ffffff;
	font-size: 1.1rem;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: capitalize;
	margin: 0px;
}

.card_review_text {
	color: #ffffff;
	font-size: 0.875rem;
	line-height: 1.5;
	margin-bottom: 1.25rem;
	font-weight: 400;
}

img {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

/* 리뷰 끝 */
</style>

<!-- bxslider -->
<script>
	$(function() {
		$('.bxslider').bxSlider({

			auto : true,
			autoHover:true, 
// 			autoControls : true,
			infiniteLoop : true,
			pager : true,
			captions: true,
			touchEnabled : (navigator.maxTouchPoints > 0),
			slideWidth : 600
		});
	});
	
	   function thema(th){
		var theme = th;
		$.ajax({
			url:"mainRoomThemeList.do",
			type: "POST",
			cache: false,
			dataType: "json",
			data:{"theme" : theme} ,
			success:function(data){
					for(var i = 0; i <= 8; i++){
						if(data.length >= i+1){
							$(".name"+i).html(data[i].room_name);
							$(".img"+i).html(data[i].room_img);
							$(".price"+i).html(data[i].room_price);
							$(".price"+i).append("<div class='card-content-hashtag'>지역위치입니다</div>");
						}else{
							
						$(".name"+i).html("없음");
						$(".img"+i).html("없음");
						$(".price"+i).html("없음");
						$(".price"+i).append("<div class='card-content-hashtag'>지역위치입니다</div>");
						}
					}
			},
			error : function(e){
				alert(e);
			}
		});
	
		};
	
</script>

</head>

<body>
<div style="margin-top:100px">
      <img src="resources/img/KakaoTalk_20221104_005719548.jpg" style="width: 600px; margin-left: 150px;">
     <div style="display:inline-block; margin-left:150px; vertical-align: middle;"> 
     <a style="font-size: 40px;">숙소 예매와 플레너 작성을 한번에</a><br>
     <a style="font-size: 40px;">tripONplan에서 함께 하세요</a><br>
     </div> <br></div>
     
   <h2 style="text-align: center; margin-top:140px"><a href="#page1">아래로</a></h2>

		<!-- 이달의 테마 시작 -->
		<p id="page1"></p><br><br>
		<div class="month-thema">
			<h2 style="text-align: center;">이달의 테마</h2>
			<ul class="ch-grid">
				<li>
					<div class="ch-item ch-img-1" onclick="thema('mountain')">
						<div class="ch-info">
							<h3>산</h3>
							<p>
								<a>산</a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-2" onclick="thema('sea')">
						<div class="ch-info">
							<h3>바다</h3>
							<p>
								<a>바다</a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-3" onclick="thema('valley')">
						<div class="ch-info">
							<h3>계곡</h3>
							<p>
								<a>계곡</a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-4" onclick="thema('city')">
						<div class="ch-info">
							<h3>도시</h3>
							<p>
								<a>도시</a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-4" onclick="thema('river')">
						<div class="ch-info">
							<h3>강</h3>
							<p>
								<a>강</a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-4" onclick="thema('forest')">
						<div class="ch-info">
							<h3>숲</h3>
							<p>
								<a>숲</a>
							</p>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- 이달의 테마 끝 -->

		<!--  테마 시작 -->
		<div class="container-fluid mt-3">
			

			<div class="tab-content" id="pills-tabContent">

				<!-- 테마1 시작 -->
				<div class="tab-pane fade show active" id="pills-thema1"
					role="tabpanel" aria-labelledby="pills-thema1-tab">

					<div class="container">
					<div id="cardList">
						<div class="cards">
						<c:forEach items="${roomList}" var="room" varStatus="status">
					<div class="card" id="${status.index}">
								<div class="overlay">
									<button type="button" class="btn btn-outline-light">장바구니
										담기</button>
									<br>
									<button type="button" class="btn btn-outline-light">숙소
										상세보기</button>
								</div>
								<div class="head">
									<div class="heart" style="height: 10px; width: 10px;"></div>
								</div>
								<div class="image">
									<img class="img${status.index}" <%-- src="${room.room_img}" --%>>
								</div>
								<div class="details">
									<div class="name name${status.index}" >
										${room.room_name}
									</div>
									<div class="price price${status.index}" >
										${room.room_price}
										<div class="card-content-hashtag">지역위치입니다</div>
									</div>
								</div>
							</div>
					</c:forEach>
							
						</div>
						</div>
					</div>
				</div>
				<!-- 테마4 끝 -->

			</div>
		</div>
		<!-- 테마 끝 -->

		<!-- 연결고리 시작 -->
		<div class="container-fluid mt-3">
			<h1 class="main-h1"><a href="#page2">아래로</a></h1>
		</div>
		<!-- 연결고리 끝 -->
		<div id="map" style="width: 100%; height: 350px;"></div>




	<p id="page2"></p>
		<div class="review">
			<h1 style="text-align: center;">플레너</h1><br><br>
			<ul class="cards_review">
			<c:forEach items="${plannerList}" var="planner" end="2">
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title" id="Ptitle_${status}">${planner.planner_title}</h2>
							<p class="card_review_text"></p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>

		</div>
<a href="plannerlist.do?page=Y">모든 여행 일정 보기</a>
</body>
</html>
