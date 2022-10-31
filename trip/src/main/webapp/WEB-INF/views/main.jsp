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
opacity






:






1




;
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
</script>

</head>

<body>

	<div class="container-fluid">

		<div class="container-fluid_ss">
			<div class="row">
				<div class="col-6">
				<br><br>
					<!-- 메인 검색창 -->
					<div class="input-group">
						<form name="" action="서 치 액 션.do " method="post"
							class="form-search">
							<div class="input-group">
								<input class="form-control" placeholder="어디로 가볼까요?" />
								<button class="btn btn-success" type="button">Search</button>
							</div>
						</form>
						
					</div>
					<br><br><br><br><br>
								
								<h1 style="text-align: center;">
								대충 느낌있는 상세 검색
								</h1>
				</div>

				<div class="col-6">
					<div><br><br><br>
						<div class="bxslider">
							<div>
								  <a href=""><img src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png" title="서울로 가요"></a>
							</div>
							<div>
								  <a href=""><img src="resources/img/Light of Baekhakbong Peak.png" title="부산으로 가요"></a>
							</div>
							<div>
								  <a href=""><img src="resources/img/Colorful Skywalk.png" title="제주도로 가요"></a>
							</div>
						</div><br>
					</div>
				</div>

			</div>
		</div>


		<!-- 
		Carousel 시작
		<div id="mainpic" class="carousel slide" data-bs-ride="carousel">

			Indicators/dots
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="2"></button>
			</div>

			The slideshow/carousel
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/img/Colorful Skywalk.png"
						alt="Colorful Skywalk" width="100">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>We had such a great time in LA!</p>
						<button class="btn btn-success" type="button">구매하기</button>
					</div>
				</div>
				<div class="carousel-item">
					<img src="resources/img/Light of Baekhakbong Peak.png"
						alt="Light of Baekhakbong Peak" width="100">
					<div class="carousel-caption">
						<h3>Chicago</h3>
						<p>Thank you, Chicago!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
						alt="Winter Wonderland_Donggung Palace & Wolji Pond" width="100">
					<div class="carousel-caption">
						<h3>New York</h3>
						<p>We love the Big Apple!</p>
					</div>
				</div>
			</div>




			Left and right controls/icons
			<button class="carousel-control-prev" type="button"
				data-bs-target="#mainpic" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#mainpic" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
		Carousel 끝 -->

		<!-- 이달의 테마 시작 -->
		<div class="month-thema">
			<h2 style="text-align: center;">이달의 테마</h2>
			<ul class="ch-grid">
				<li>
					<div class="ch-item ch-img-1">
						<div class="ch-info">
							<h3>눈과 함께하는</h3>
							<p>
								눈이다<a href=""></a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-2">
						<div class="ch-info">
							<h3>단풍과 함께하는</h3>
							<p>
								단풍이다<a href=""></a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-3">
						<div class="ch-info">
							<h3>파란 하늘과 함께하는</h3>
							<p>
								하늘이다<a href=""></a>
							</p>
						</div>
					</div>
				</li>
				<li>
					<div class="ch-item ch-img-4">
						<div class="ch-info">
							<h3>눈과 함께하는</h3>
							<p>
								눈이다<a href=""></a>
							</p>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- 이달의 테마 끝 -->

		<!--  테마 시작 -->
		<div class="container-fluid mt-3">
			<div>
				<h2 style="text-align: center;">테마별 선택하기</h2>
			</div>

			<!-- 탭 -->
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="pills-thema1-tab"
						data-bs-toggle="pill" data-bs-target="#pills-thema1" type="button"
						role="tab" aria-controls="pills-thema1" aria-selected="true">테마1</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-thema2-tab"
						data-bs-toggle="pill" data-bs-target="#pills-thema2" type="button"
						role="tab" aria-controls="pills-thema2" aria-selected="false">테마2</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-thema3-tab"
						data-bs-toggle="pill" data-bs-target="#pills-thema3" type="button"
						role="tab" aria-controls="pills-thema3" aria-selected="false">테마3</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-thema4-tab"
						data-bs-toggle="pill" data-bs-target="#pills-thema4" type="button"
						role="tab" aria-controls="pills-thema4" aria-selected="false">테마4</button>
				</li>
			</ul>

			<div class="tab-content" id="pills-tabContent">

				<!-- 테마1 시작 -->
				<div class="tab-pane fade show active" id="pills-thema1"
					role="tabpanel" aria-labelledby="pills-thema1-tab">

					<div class="container">
						<div class="cards">

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- 테마1 끝 -->

				<!-- 테마2 시작 -->
				<div class="tab-pane fade" id="pills-thema2" role="tabpanel"
					aria-labelledby="pills-thema2-tab">

					<div class="container">
						<div class="cards">

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">>
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Colorful Skywalk.png" alt="부산 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- 테마2 끝 -->

				<!-- 테마3 시작-->
				<div class="tab-pane fade" id="pills-thema3" role="tabpanel"
					aria-labelledby="pills-thema3-tab">

					<div class="container">
						<div class="cards">

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img
										src="resources/img/Winter Wonderland_Donggung Palace & Wolji Pond.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- 테마3 끝 -->

				<!-- 테마4 시작-->
				<div class="tab-pane fade" id="pills-thema4" role="tabpanel"
					aria-labelledby="pills-thema4-tab">

					<div class="container">
						<div class="cards">

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
							</div>

							<div class="card">
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
									<img src="resources/img/Light of Baekhakbong Peak.png"
										alt="경기 호텔 이미지">
								</div>
								<div class="details">
									<div class="name">
										경기 호텔
										<div class="description">정말 좋음</div>
									</div>
									<div class="price">
										&#8361; 50,000
										<div class="card-content-hashtag">#경기 #숙소</div>
									</div>
								</div>
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
			<h1 class="main-h1">숙박과 플래너 연결고리</h1>
		</div>
		<!-- 연결고리 끝 -->
		<div id="map" style="width: 100%; height: 350px;"></div>





		<div class="review">
			<h1>여행 후기</h1>
			<ul class="cards_review">
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Colorful Skywalk.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Light of Baekhakbong Peak.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Colorful Skywalk.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Light of Baekhakbong Peak.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Colorful Skywalk.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
				<li class="cards_review_item">
					<div class="card_review">
						<div class="card_image">
							<img src="resources/img/Light of Baekhakbong Peak.png">
						</div>
						<div class="card_review_content">
							<h2 class="card_review_title">서울 여행 후기</h2>
							<p class="card_review_text">역시 서울이 최고</p>
							<button class="btn card_review_btn">후기 보기</button>
						</div>
					</div>
				</li>
			</ul>

		</div>







	</div>
</body>
</html>
