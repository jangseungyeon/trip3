<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>main</title>
<%@ include file="header.jsp"%>

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
	margin-top: 80px;
	margin-bottom: 20px;
	width: 40%;
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

@import url("https://fonts.googleapis.com/css?family=Open+Sans");

* {
	margin: 0;
	box-sizing: border-box;
	font-family: "Open Sans", sans-serif;
}

.cards {
	padding: 0 5px;
	display: grid;
/* 	grid-template-columns: repeat(auto-fit, minmax(100px, 1fr, 1fr, 1fr, 1fr, 1fr)); */
	max-width: 300px;
	grid-gap: 10px;
	margin: 0 auto;
}

.card {
	display: flex;
	flex-direction: column;
	position: relative;
	overflow: cover;
	border-radius: 10px;
	box-shadow: 1px 1px 4px 1px rgb(193, 193, 193);
}

.card .head {
	display: flex;
	padding: 15px;
	border-bottom: 2px solid #efefef;
}

.card .image {
	position: relative;
	display: flex;
	align-items: center;
	justify-items: center;
	overflow: cover;
	height: 250px;
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
</style>
</head>

<body>

	<div class="container-fluid">

		<div class="input-group">
			<form name="" action="서 치 액 션.do " method="post" class="form-search">
				<div class="input-group">
					<input class="form-control" placeholder="검색" />
					<button class="btn btn-success" type="button">Search</button>
				</div>
			</form>
		</div>


		<!-- Carousel 시작 -->
		<div id="mainpic" class="carousel slide" data-bs-ride="carousel">

			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#mainpic" data-bs-slide-to="2"></button>
			</div>

			<!-- The slideshow/carousel -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/img/Colorful Skywalk.png"
						alt="Colorful Skywalk" width="100">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>We had such a great time in LA!</p>
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

			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#mainpic" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#mainpic" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
		<!-- Carousel 끝 -->

		<!--  테마 시작 -->
		<div class="container-fluid mt-3">
			<h2>테마 선택하게 하기</h2>

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

					</div>
					</div>
				</div>
			</div>
			<!-- 테마1 끝 -->




			<!-- 테마2 시작 -->
			<div class="tab-pane fade" id="pills-thema2" role="tabpanel"
				aria-labelledby="pills-thema2-tab"></div>
			<!-- 테마2 끝 -->

			<!-- 테마3 시작-->
			<div class="tab-pane fade" id="pills-thema3" role="tabpanel"
				aria-labelledby="pills-thema3-tab"></div>
			<!-- 테마3 끝 -->

			<!-- 테마4 시작-->
			<div class="tab-pane fade" id="pills-thema4" role="tabpanel"
				aria-labelledby="pills-thema4-tab"></div>
			<!-- 테마4 끝 -->
		</div>
		<!-- 테마 끝 -->

		<!-- 연결고리 시작 -->

		<div class="container-fluid mt-3">
			<h1 class="main-h1">숙박과 플래너 연결고리</h1>
		</div>
		<!-- 연결고리 끝 -->
		<div id="map" style="width: 100%; height: 350px;"></div>
	</div>
</body>
</html>
