<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Admin Dashboard</title>
</head>

<body>
	<div class="wrapper">
		<div class="sidebar" data-color="orange">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="manage_main.do" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="manage_main.do">
							<i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>호스트 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항 관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> 플래너 관리 </a>
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">${manage_id}님 접속중</span>
							</a></li>
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Account</span> -->
<!-- 							</a></li> -->
							<li class="nav-item"><a class="nav-link"
								href="manage_logout.do"> <span class="no-icon">Log
										out</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">
				<div class="container-fluid">
					<!-- Search -->
					<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
						<form class="form-inline" action="manage_plannerList.do"
							method="post">
							<select class="form-control" id="sel1" name="searchCondition"
								style="display: inline-block !important; margin-right: 10px;">
								<c:forEach items="${conditionMap}" var="option">
									<option value="${option.value}">${option.key}</option>
								</c:forEach>
							</select> <input class="form-control" type="text" name="searchKeyword"
								placeholder="검색어를 입력하세요.">
							<button class="btn btn-search" type="submit">검색</button>
						</form>
					</nav>
					<!-- End Search -->

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>플래너제목</th>
								<th>아이디</th>
								<th>번호</th>
								<th>숙소명</th>
								<th>여행시작일</th>
								<th>여행종료일</th>
								<th>여행지역</th>
								<th>여행기간</th>
								<th></th>
							</tr>
						</thead>
						<c:forEach var="plan" items="${plannerList}">
							<tr align="center">
								<td>${plan.planner_title}</td>
								<td>${plan.user_id}</td>
								<td>${plan.planner_no}</td>
								<td>${plan.room_name}</td>
								<td>${plan.planner_start}</td>
								<td>${plan.planner_end}</td>
								<td>${plan.planner_area}</td>
								<td>${plan.planner_day}</td>
								<td><a class="btn btn-secondary"
									href="manage_plannerInfo.do?planner_no=${plan.planner_no}"
									role="button">상세보기</a></td>
							</tr>
						</c:forEach>
					</table>
					<br> <br>
					<div id="btnBox">
						<!-- 반복처리할 태그 시작-->
						<c:if test="${paging.nowPageBtn > 1 }">
							<a class="list-btn"
								href="manage_plannerList.do?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
							step="1" var="i">
							<c:choose>
								<c:when test="${paging.nowPageBtn == i}">
									<a class="aSel">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="list-btn"
										href="manage_plannerList.do?nowPageBtn=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<a class="list-btn"
								href="manage_plannerList.do?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
						</c:if>
						<!-- 반복처리할 태그 끝 -->

					</div>
					<br> <br>
				</div>
			</div>

		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>