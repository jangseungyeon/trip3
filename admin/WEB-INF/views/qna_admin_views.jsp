<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="header.jsp"%>
<title>관리자 상세보기 페이지</title>
<meta charset="utf-8">
<style>
span.input-group-text {
	background-color: transparent;
	border: none;
}
</style>
<script>
function deleteOne(num){
		if(confirm("삭제 하시겠습니까?")){
		location.href="qna_admin_delete.do?qna_num="+num;
	}
};

$(function() {
	var answer = document.getElementById("qna_views").value;
	console.log(answer);
	
	if(answer == 1){//"1"이면 답변버튼 숨기기, "0"이면 수정버튼 숨기기 
		$("#amd-btn").hide();//"1"이면 답변버튼 숨기기
		$("#and-btn").show();//"0"이면 수정버튼 숨기기 
	}else{
		$("#amd-btn").show();//"0"이면 답변버튼 보이기
		$("#and-btn").hide();//"1"이면 답변버튼 숨기기

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
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>호스트
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
					<div class="container-fluid">
						<h3>1:1 문의</h3>
						<p>회원의 문의에 대한 관리자 답변</p>
					</div>
					<form action="qna_admin_update.do" method="POST">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">질문번호</span>
							</div>
							<input type="text" class="form-control" id="qna_num"
								name="qna_num" value="${qnaOne.qna_num}" readonly>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">질문제목</span>
							</div>
							<input type="text" class="form-control" id="qna_title"
								name="qna_title" value="${qnaOne.qna_title}" disabled>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">질문날짜</span>
							</div>
							<input type="text" class="form-control" id="qna_regdate"
								name="qna_regdate" value="${qnaOne.qna_regdate}" readonly>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">질문내용</span>
							</div>
							<textarea class="form-control" rows="5" id="qna_content"
								name="qna_content">${qnaOne.qna_content}</textarea>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">답변여부</span>
							</div>
							<input type="text" class="form-control" id="qna_views"
								name="qna_views" value="${qnaOne.qna_views}" disabled>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">답글입력</span>
							</div>
							<textarea class="form-control" rows="5" id="qna_answer"
								name="qna_answer">${qnaOne.qna_answer}</textarea>
						</div>

						<div class="row">
							<div class="col-sm-12 pt-3" style="text-align: center;">
								<button id="amd-btn" type="submit" class="btn btn-primary">답변하기</button>
								<button id="and-btn" type="submit" class="btn btn-primary">수정하기</button>
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