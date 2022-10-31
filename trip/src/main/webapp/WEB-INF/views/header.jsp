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
		<nav id="stNav" class="navbar  bg-success navbar-success  fixed-top">

			<c:choose>
				<c:when test='${user_id ne NULL}'>

					<ul class="nav justify-content-around bg-success">
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">플래너</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">이용안내</a></li>
					</ul>


					<ul class="nav justify-content-end bg-success">
						<li class="nav-item"><a class="nav-link">${user_name}님 접속중</a></li>
						<li class="nav-item"><a class="nav-link"
							href="move_to_host_login.do">호스트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user_logout.do">로그아웃</a></li>
							<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">내 정보</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="user_info.do">정보 수정</a>
								<a class="dropdown-item" href="check.do">결제 목록</a>
								<a class="dropdown-item" href="#">좋아요(like)</a>
								<a class="dropdown-item" href="plannerinfo.do">나의 여행</a>
							</div>
						</div>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav justify-content-around bg-success">
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="index.jsp">홈</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">숙소</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="start.do">플래너</a></li>
						<li class="nav-item"><a class="nav-link head-link text-white"
							href="#">이용안내</a></li>
					</ul>

					<ul class="nav justify-content-end bg-success">
						<li class="nav-item"><a class="nav-link"
							href="user_login.jsp">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user_loginform.do">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="move_to_host_login.do">호스트</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>
