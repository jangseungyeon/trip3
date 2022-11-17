<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 상세보기 페이지</title>
<%@ include file="header.jsp"%>
<meta charset="utf-8">

<script>
function deleteOne(num){
		if(confirm("삭제 하시겠습니까?")){
		location.href="qna_delete.do?qna_num="+num;
	}
};

$(function() {
	var answer = document.getElementById("qna_views").value;
	console.log(answer);
	
	if(answer == 1){
		$("#amd-btn").hide();
	}
});


</script>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="black">
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
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>업주
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							관리
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> 문의 응답 </a>
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
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Account</span>
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

					<form action="qna_admin_update.do" method="POST">
						<div class="container-fluid p-3 my-3 bg-dark text-white">
							<h1>관리자 상세 보기</h1>
							<p>상세 보기 페이지 입니다.</p>
						</div>
						<div class="row">
							<div class="col-sm-3">번호</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="qna_num"
									name="qna_num" value="${qnaOne.qna_num}" readonly>
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-sm-3">제목</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="qna_title"
									name="qna_title" value="${qnaOne.qna_title}" disabled>
								<!-- disabled : 비활성화 속성 -->
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-sm-3">날짜</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="qna_regdate"
									name="qna_regdate" value="${qnaOne.qna_regdate}" disabled>
								<!-- disabled : 비활성화 속성 -->
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-sm-3" style="padding-top: 10%;">질문내용</div>
							<div class="col-sm-9">
								<textarea class="form-control" rows="5" id="qna_content"
									name="qna_content">${qnaOne.qna_content}</textarea>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3">답변여부</div>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="qna_views"
									name="qna_views" value="${qnaOne.qna_views}" disabled>
								<!-- disabled : 비활성화 속성 -->
							</div>
						</div>
						<br>

						<div class="row">
							<div class="col-sm-3" style="padding-top: 10%;">답글입력</div>
							<div class="col-sm-9">
								<textarea class="form-control" rows="5" id="qna_answer"
									name="qna_answer">${qnaOne.qna_answer}</textarea>
							</div>
						</div>


						<div class="row">
							<div class="col-sm-12 pt-3" style="text-align: center;">
								<button id="amd-btn" type="submit" class="btn btn-primary">답변하기</button>
								<!-- <a href="qna_update.jsp" class="btn btn-primary">수정하기</a> -->
								<!-- <button type="button" onclick="alert('삭제하시겠습니까?')" class="btn btn-primary">삭제하기</button> -->
								<button type="button" onclick="deleteOne(${qnaOne.qna_num});"
									class="btn btn-primary">삭제</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>