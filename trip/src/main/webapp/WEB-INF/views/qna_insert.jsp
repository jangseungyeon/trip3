<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>triponplan</title>
<%@ include file="header.jsp"%>
<style>
span.input-group-text {
	background-color: transparent;
	border: none;
}

#qna_content{
	height:300px;
	resize: none;
}
.span{
font-size: 18px;
font-weight: 550;
}

.title{
    border: solid 1px #e5e5e5;
    padding: 2%;
    border-radius: 20px;
    background-color: white;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<br>

	<div class="container">
		<h1>1:1 문의 등록</h1>
		<br>
		<br>
		<div class="title">
	<form action="qna_insert.do" method="post">
	<span class="span">제목</span>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="qna_title"
				name="qna_title">
		</div>
<span class="span">내용</span> 
		<div class="input-group mb-3">
			<textarea class="form-control" rows="5" id="qna_content"
				name="qna_content"></textarea>
		</div>



		<div class="row">
			<div class="col-sm-12 pt-3" style="text-align: right;">
				<button type="submit" class="btn btn-secondary">질문등록</button>
			</div>
		</div>
	</form>
	
	</div>
	</div>
	

</body>
</html>