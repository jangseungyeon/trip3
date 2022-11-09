<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.host.HostVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="header.jsp"%>

<!doctype html>
<html lang="ko">

<title>정보 수정</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
</head>
<body class="info-body">
	<script>
		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자    
				if (confirm("수정하시겠습니까?")) {
					document.manage_hostInfo.action = "manage_hostUpdate.do";
					document.manage_hostInfo.submit();
				}
			});
		});
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				// 확인 대화상자 
				if (confirm("삭제하시겠습니까?")) {
					document.manage_hostInfo.action = "manage_hostDelete.do";
					document.manage_hostInfo.submit();
				}
			});
		});
	</script>

	<div class="wrapper">
		<div class="sidebar" data-color="green">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="manage_main.do">
							<i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							정보
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>업주
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i
							class="nc-icon nc-single-copy-04"></i>공지사항 관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							정보
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							정보
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<a class="navbar-brand" href="#pablo"> Dashboard </a>
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
						<ul class="nav navbar-nav mr-auto">
							<li class="nav-item"><a href="#" class="nav-link"
								data-toggle="dropdown"> <span class="d-lg-none">Dashboard</span>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Search</span>
							</a></li>
						</ul>

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">${manage_id}님 접속중</span>
							</a></li>
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
					<div class="row">
						<div class="col-md-12">
							<div class="card strpied-tabled-with-hover">
								<div class="card-header ">
									<h4 class="card-title">회원정보 상세</h4>
								</div>
								<div class="card-body table-full-width table-responsive">
									<form name="manage_hostInfo" method="post">
										<table class="table table-hover table-striped">
											<thead>
												<tr>
													<td>아이디</td>
													<td><input name="host_id" value="${HostVO.host_id}"
														readonly></td>
												</tr>
												<tr>
													<td>업소명</td>
													<td><input name="host_bizname"
														value="${HostVO.host_bizname}"></td>
												</tr>
												<tr>
													<td>이름</td>
													<td><input name="host_name"
														value="${HostVO.host_name}"></td>
												</tr>
												<tr>
													<td>생년월일</td>
													<td><input name="host_birth"
														value="${HostVO.host_birth}"></td>
												</tr>
												<tr>
													<td>이메일</td>
													<td><input name="host_email"
														value="${HostVO.host_email}"></td>
												</tr>
												<tr>
													<td>전화번호</td>
													<td><input name="host_phone"
														value="${HostVO.host_phone}"></td>
												</tr>
												<tr>
													<td>주소</td>
													<td><input name="host_addr1"
														value="${HostVO.host_addr1}"></td>
												</tr>
												<tr>
													<td>상세주소</td>
													<td><input name="host_addr2"
														value="${HostVO.host_addr2}"></td>
												</tr>
												<tr>
													<td>상태</td>
													<td><input name="host_status"
														value="${HostVO.host_status}"></td>
												</tr>
												<tr>
													<td>사업자번호</td>
													<td><input name="host_biznum"
														value="${HostVO.host_biznum}"></td>
												</tr>
												<tr>
													<td>이미지</td>
													<td><input name="host_bizimg"
														value="${HostVO.host_bizimg}"></td>
												</tr>
												<tr>
													<td>은행</td>
													<td><input name="host_bank"
														value="${HostVO.host_bank}"></td>
												</tr>
												<tr>
													<td>계좌번호</td>
													<td><input name="host_banknum"
														value="${HostVO.host_banknum}"></td>
												</tr>


												<tr>
													<td colspan="2" align="center"><input type="button"
														value="수정" id="btnUpdate"> <input type="button"
														value="삭제" id="btnDelete"></td>
												</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
<%@ include file="footer.jsp"%>
</html>