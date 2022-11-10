<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
%>
<!DOCTYPE html>
<head>
<title>header</title>
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

<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/myinfo.css" rel="stylesheet">
<link href="resources/css/my_ReservationDetail.css" rel="stylesheet">

</head>

<div class="container-fluid">
	<div class="container-fluid main-div">
		<nav id="stNav"
			class="navbar header-bgc bg-success navbar-success  fixed-top">

			<c:choose>
				<c:when test='${user_id ne NULL}'>

					<ul class="nav justify-content-around bg-success">
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="u_getRoomList.do">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="start.do">일정 만들기</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">이용안내</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="getFaqList.do">공지사항</a></li>
					</ul>


					<ul class="nav justify-content-end bg-success">
						<li class="nav-item"><a class="nav-link header-link2">${user_name}님
								접속중</a></li>
						<li class="nav-item"><a class="nav-link header-link2"
							href="move_to_host_login.do">호스트</a></li>
						<li class="nav-item"><a class="nav-link header-link2"
							href="user_logout.do">로그아웃</a></li>
						<div id="header-mydiv" class="dropdown">
							<button id="header-btn" type="button" class="btn btn-primary"
								data-toggle="dropdown">내 정보</button>
							<div id="header-menu-div" class="dropdown-menu">
								<a class="dropdown-item" href="myinfo.do">정보 수정</a> <a
									class="dropdown-item" href="pointcheck.do">마일리지</a> <a
									class="dropdown-item" href="getReservationList.do">결제 목록</a> <a
									class="dropdown-item" href="likeslist.do">좋아요(like)</a> <a
									class="dropdown-item" href="plannerlist.do">나의 여행</a>
							</div>
						</div>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav justify-content-around bg-success">
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="u_getRoomList.do">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="start.do">일정 만들기</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">이용안내</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="getFaqList.do">공지사항</a></li>
					</ul>

					<ul class="nav justify-content-end bg-success">
						<li class="nav-item"><a class="nav-link header-link2"
							href="user_insert.do">회원가입</a></li>
						<li class="nav-item"><a class="nav-link header-link2"
							href="user.login.do">로그인</a></li>
						<li class="nav-item"><a class="nav-link header-link2"
							href="move_to_host_login.do">호스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>
