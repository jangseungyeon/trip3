<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 상세보기 페이지</title>
<%@ include file="header.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
	<form action="qna_admin_update.do" method="POST">
		<div class="container-fluid p-3 my-3 bg-dark text-white">
			<h1>관리자 상세 보기</h1>
			<p>상세 보기 페이지 입니다.</p>
		</div>
		<div class="row">
			<div class="col-sm-3">번호</div>
			<div class="col-sm-9">
				<input type="text" class="form-control" id="qna_num" name="qna_num"
					value="${qnaOne.qna_num}" readonly>
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
				<button  id="amd-btn" type="submit" class="btn btn-primary">수정하기</button>
				<!-- <a href="qna_update.jsp" class="btn btn-primary">수정하기</a> -->
           <!-- <button type="button" onclick="alert('삭제하시겠습니까?')" class="btn btn-primary">삭제하기</button> -->
           <button type="button" onclick="deleteOne(${qnaOne.qna_num});" class="btn btn-primary">삭제</button>
			</div>
		</div>
	</form>

</body>
</html>