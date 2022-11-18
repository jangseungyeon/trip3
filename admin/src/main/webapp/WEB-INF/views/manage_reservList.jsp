<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Admin Dashboard</title>
</head>

<body>
	<div class="wrapper">
		<div class="sidebar" data-color="red">
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
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너 관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
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
					<a class="navbar-brand"> 예약 관리 </a>
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
						<form class="form-inline" action="manage_reservList.do"
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
								<th>예약번호</th>
								<th>회원아이디</th>
								<!-- 								<th>imp_uid</th> -->
								<!-- 								<th>merchant_uid</th> -->
								<th>이름</th>
								<th>전화번호</th>
								<!-- 								<th>이메일</th> -->
								<!-- 								<th>호스트아이디</th> -->
								<!-- 								<th>숙소아이디</th> -->
								<th>숙소명</th>
								<!-- 								<th>이미지</th> -->
								<th>결제일자</th>
								<th>결제금액</th>
								<th>예약인원</th>
								<!-- 								<th>변경가능횟수</th> -->
								<th>예약상태</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th></th>
							</tr>
						</thead>
						<c:forEach var="res" items="${reservList}">
							<tr align="center">
								<td>${res.res_id}</td>
								<td>${res.user_id}</td>
								<%-- 								<td>${res.imp_uid}</td> --%>
								<%-- 								<td>${res.merchant_uid}</td> --%>
								<td>${res.res_name}</td>
								<td>${res.res_tel}</td>
								<%-- 								<td>${res.res_email}</td> --%>
								<%-- 								<td>${res.host_id}</td> --%>
								<%-- 								<td>${res.room_id}</td> --%>
								<td>${res.room_name}</td>
								<%-- 								<td>${res.room_img}</td> --%>
								<%-- 								<td>${res.pay_date}</td> --%>

								<td><fmt:parseDate value="${res.pay_date}" var="dateValue"
										pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
										value="${dateValue}" pattern="yyyy-MM-dd" /></td>
								<td>${res.pay_amount}</td>
								<td>${res.res_num}</td>
								<%-- 								<td>${res.res_count}</td> --%>
								<td>${res.res_status}</td>
								<td>${res.res_checkin}</td>
								<td>${res.res_checkout}</td>
								<td><a class="btn btn-secondary"
									href="manage_reservInfo.do?res_id=${res.res_id}" role="button">상세보기</a></td>
							</tr>
						</c:forEach>
					</table>
					<br> <br>
					<div id="btnBox">
						<!-- 반복처리할 태그 시작-->
						<c:if test="${paging.nowPageBtn > 1 }">
							<a class="list-btn"
								href="manage_reservList.do?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
							step="1" var="i">
							<c:choose>
								<c:when test="${paging.nowPageBtn == i}">
									<a class="aSel">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="list-btn" href="manage_reservList.do?nowPageBtn=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
							<a class="list-btn"
								href="manage_reservList.do?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
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