<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자 상세보기 페이지</title>
<%@ include file="header.jsp"%>
<style>
span.input-group-text {
	background-color: transparent;
	border: none;
}

.span {
	font-size: 18px;
	font-weight: 550;
}

.title {
	border: solid 1px #e5e5e5;
	padding: 2%;
	border-radius: 20px;
	background-color: white;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

function update(){
	
	$("#qna_title").attr("readonly" , false);
	$("#qna_content").attr("readonly" , false);
	$(".update-btn").attr("type" , "submit");
	$(".update-btn").attr("onclick" , "");
	
	return false;
}

</script>
</head>
<body>
	<br>

	<div class="container">
		<h1>1:1문의 내역</h1>
		<br> <br>
		<div class="title">
			<form action="qna_update.do" method="post">
				<span class="input-group-text span">질문번호</span>
				<div class="input-group mb-3">
					<div class="input-group-prepend"></div>
					<input type="text" class="form-control" id="qna_num" name="qna_num"
						value="${qnaOne.qna_num}" readonly
						style="background-color: white;">
				</div>

				<span class="input-group-text span">질문제목</span>
				<div class="input-group mb-3">
					<div class="input-group-prepend"></div>
					<input type="text" class="form-control" id="qna_title"
						name="qna_title" value="${qnaOne.qna_title}" readonly
						style="background-color: white;">
				</div>

				<span class="input-group-text span">질문날짜</span>
				<div class="input-group mb-3">
					<div class="input-group-prepend"></div>
					<input type="text" class="form-control" id="qna_regdate"
						name="qna_regdate" value="${qnaOne.qna_regdate}" readonly
						style="background-color: white;">
				</div>

				<span class="input-group-text span">질문내용</span>
				<div class="input-group mb-3">
					<div class="input-group-prepend"></div>
					<textarea class="form-control" rows="5" id="qna_content"
						name="qna_content" readonly
						style="resize: none; background-color: white;">${qnaOne.qna_content}</textarea>
				</div>

				<span class="input-group-text span">답변여부</span>
				<div class="input-group mb-3">
					<div class="input-group-prepend"></div>

					<input type="text" class="form-control" id="qna_answer"
						name="qna_answer" value="${qnaOne.qna_views}" readonly
						style="background-color: white;">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">답변내용</span>
					</div>
					<textarea class="form-control" rows="5" id="qna_answer"
						name="qna_answer" readonly>${qnaOne.qna_answer}</textarea>
				</div>

				<div class="row">
					<div class="col-sm-12 pt-3" style="text-align: center;">
						<button id="amd-btn" type="button"
							class="btn btn-secondary update-btn" onclick="return update()">수정하기</button>
						<button type="button" onclick="deleteOne(${qnaOne.qna_num});"
							class="btn btn-secondary">삭제하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>