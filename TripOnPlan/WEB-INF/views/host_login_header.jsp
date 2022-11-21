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
<link href="resources/css/my_info.css" rel="stylesheet">
<link href="resources/css/my_Reservation.css" rel="stylesheet">
<link href="resources/css/my_likes.css" rel="stylesheet">

</head>

<div class="container-fluid">
	<div class="container-fluid main-div">
		<nav id="stNav"
			class="navbar header-bgc bg-success navbar-success  fixed-top">

			<c:choose>
				<c:when test='${user_id ne NULL}'>

					<ul class="nav justify-content-around bg-success">
		
					</ul>


					<ul class="nav justify-content-end bg-success">
						<li class="nav-item"><a class="nav-link header-link2"
							href="index.jsp"><span class="main-div2" style="font-size:20px !important">tripONplan</span></a></li>
					</ul>
				</c:when>

				<c:otherwise>

					<ul class="nav justify-content-around bg-success">

					</ul>

					<ul class="nav justify-content-end bg-success">

						<li class="nav-item"><a class="nav-link header-link2"
							href="index.jsp"><span class="main-div2" style="font-size:20px !important">tripONplan</span></a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>
</div>
