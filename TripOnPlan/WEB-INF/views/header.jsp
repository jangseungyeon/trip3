<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
%>
<!DOCTYPE html>
<head>
<title>tripONplan</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>	

<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/my_info.css" rel="stylesheet">
<link href="resources/css/my_Reservation.css" rel="stylesheet">
<link href="resources/css/my_likes.css" rel="stylesheet">
<link href="resources/css/my_planner.css" rel="stylesheet">
<!-- 구글폰트관련 링크 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap')
	;
	
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.main-font{
	font-family: 'Pretendard-Regular';
}
</style>
</head>

<div id="div-90" class="container-fluid">
	<div class="container-fluid main-div">
		<nav id="stNav"
			class="navbar header-bgc navbar-success bg-success fixed-top">

			<c:choose>
				<c:when test='${user_id ne NULL}'>

					<ul class="nav justify-content-around">
						<li class="nav-item"><a class="nav-link head-link text-white header-logo main-font"
							href="index.jsp">tripONplan</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="u_getRoomList.do">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="start.do">일정 만들기</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="getFaqList.do">공지사항</a></li>
					</ul>


					<ul class="nav justify-content-end">
						<li class="nav-item userName"><a class="nav-link header-link2 main-font user_name">${user_name}님
								접속중</a></li>
						<li class="nav-item"><a class="nav-link header-link2 main-font"
							href="move_to_host_login.do">호스트</a></li>
						<li class="nav-item"><a class="nav-link header-link2 main-font"
							href="user_logout.do">로그아웃</a></li>
						<div id="header-mydiv" class="dropdown">
							<button id="header-btn" type="button" class="btn btn-primary main-font"
								data-toggle="dropdown">내 정보</button>
							<div id="header-menu-div" class="dropdown-menu">
								<a class="dropdown-item main-font" href="myinfo.do">정보 수정</a>
								<a class="dropdown-item main-font" href="getReservationList.do">결제 목록</a>
								<a class="dropdown-item main-font" href="likeslist.do">좋아요(like)</a>
								<a class="dropdown-item main-font" href="plannerlist.do">나의 여행</a>
								<a class="dropdown-item main-font" href="qna_insert.do">1:1문의</a>
								<a class="dropdown-item main-font" href="qna_list.do">문의 목록</a>
							</div>
						</div>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav justify-content-around">
						<li class="nav-item"><a class="nav-link head-link text-white header-logo main-font"
							href="index.jsp">tripONplan</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="u_getRoomList.do">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="start.do">일정 만들기</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white main-font"
							href="getFaqList.do">공지사항</a></li>
					</ul>

					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link header-link2 main-font"
							href="move_to_host_login.do">호스트</a></li>
						<li class="nav-item"><a class="nav-link header-link2 main-font"
							href="user_insert.do">회원가입</a></li>
						<li class="nav-item"><a class="nav-link header-link2 main-font"
							href="user.login.do">로그인</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>



<div id="div-80" class="container-fluid">
	<div class="container-fluid main-div">
		<nav id="stNav"
			class="navbar header-bgc navbar-success bg-success fixed-top navbar navbar-expand-xl">

			<c:choose>
				<c:when test='${user_id ne NULL}'>

					<ul class="nav">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#collapsibleNavbar">
							<span class="material-symbols-outlined" style="color: black; font-size: 24px;">menu</span>
						</button>
						<li class="nav-item"><a
							class="nav-link head-link text-white header-logo"
							href="index.jsp">tripONplan</a></li>
						<div class="collapse navbar-collapse" id="collapsibleNavbar">
							<ul class="navbar-nav">
								<li class="nav-item"><a
									class="nav-link head-link text-white main-font" href="u_getRoomList.do">숙소</a>
								</li>
								<li class="nav-item"><a
									class="nav-link head-link text-white main-font" href="start.do">일정
										만들기</a></li>
								<li class="nav-item"><a
									class="nav-link head-link text-white main-font" href="getFaqList.do">공지사항</a>
								</li>
								<li class="nav-item"><a class="nav-link header-link2 main-font"
									href="move_to_host_login.do">호스트</a></li>
								<li class="nav-item"><a class="nav-link header-link2 main-font"
									href="user_logout.do">로그아웃</a></li>
								<div id="header-mydiv" class="dropdown">
									<button id="header-btn" type="button" class="btn btn-primary"
										data-toggle="dropdown">내 정보</button>
									<div id="header-menu-div" class="dropdown-menu">
										<a class="dropdown-item main-font" href="user_info.do">정보 수정</a> <a
											class="dropdown-item main-font" href="getReservationList.do">결제 목록</a>
										<a class="dropdown-item main-font" href="likeslist.do">좋아요(like)</a> <a
											class="dropdown-item main-font" href="plannerlist.do">나의 여행</a>
									</div>
								</div>
							</ul>
						</div>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#collapsibleNavbar">
							<span class="material-symbols-outlined">menu</span>
						</button>
						<li class="nav-item"><a
							class="nav-link head-link text-white header-logo"
							href="index.jsp">tripONplan</a></li>
						<div class="collapse navbar-collapse" id="collapsibleNavbar">
							<ul class="navbar-nav">
								<li class="nav-item"><a
									class="nav-link head-link text-white" href="u_getRoomList.do">숙소</a></li>
								<li class="nav-item"><a
									class="nav-link head-link text-white" href="start.do">일정
										만들기</a></li>
								<li class="nav-item"><a
									class="nav-link head-link text-white" href="#">이용안내</a></li>
								<li class="nav-item"><a
									class="nav-link head-link text-white" href="getFaqList.do">공지사항</a></li>
								<li class="nav-item"><a class="nav-link header-link2"
									href="move_to_host_login.do">호스트</a></li>
								<li class="nav-item"><a class="nav-link header-link2"
									href="user_insert.do">회원가입</a></li>
								<li class="nav-item"><a class="nav-link header-link2"
									href="user.login.do">로그인</a></li>
							</ul>
						</div>
					</ul>

				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>
