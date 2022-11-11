<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String host_id = session.getAttribute("host_id") != null ? session.getAttribute("host_id").toString() : "";
%>
<!DOCTYPE html>
<head>
<title>header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="resources/css/style.css" rel="stylesheet">

</head>

<div class="container-fluid">
	<div class="container-fluid main-div">
		<nav id="stNav" class="navbar  bg-danger navbar-danger  fixed-top">

			<c:choose>
				<c:when test='${host_id ne NULL}'>

					<ul class="nav justify-content-around bg-danger">
						<li class="nav-item"><a class="nav-link text-white"
							href="move_to_host_index.do">홈</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="getRoomList.do">숙소 관리</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="move_to_host_review.do">리뷰 모아보기</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="move_to_host_reservation.do">예약 현황</a></li>
					</ul>


					<ul class="nav justify-content-end bg-danger">
						<li class="nav-item"><a class="nav-link text-white"
							href="move_to_host_update.do">${host_bizname}님 접속중</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="./index.jsp">게스트 페이지</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="host_logout.do">로그아웃</a></li>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav justify-content-around bg-danger">
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">플래너</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">이용안내</a></li>
					</ul>

					<ul class="nav justify-content-end bg-danger">
						<li class="nav-item"><a class="nav-link text-white"
							href="user_login.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="host_login.jsp">호스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>
