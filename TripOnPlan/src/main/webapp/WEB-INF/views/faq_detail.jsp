<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
String sts = "";
if (session.getAttribute("userId") == null) {
	sts = "disabled";
}
%>
<body>
<style>
#imgBox {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100vh !important;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999999;
}

#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}
</style>
	<div class="jumbotron" style="background-color: transparent;">
		<h1>상세 보기</h1>
	</div>
	<div class="container-fluid">

		<form name="fm" action="updateFaq.do" method="post">
			<input type="hidden" name="faq_no" value="${faq.faq_no}">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="faq_title"
					value="${faq.faq_title}" <%=sts %>>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<%--       <input type="text" class="form-control innm" name="writer" value="${faq.writer}" readonly <%=sts %>>       --%>
				<input type="text" class="form-control innm" name="faq_writer"
					value="${faq.faq_writer}" readonly <%=sts %>>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control innm" rows="10" id="comment"
					name="faq_content" <%=sts%>>${faq.faq_content}</textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">파일</span> <input type="hidden"
						name="filename" value="${faq.filename}">
				</div>
				<c:if test="${faq.filename ne NULL}">
					<span style="cursor: pointer; padding: 0 20px;" onclick="seeImg()">[파일보기]</span>
					<script>
						function seeImg() {
							$("#imgBox").show();
						}
					</script>
					<span style="cursor: pointer;"
						onclick="downloadFile('${faq.filename}')">[파일다운]</span>
					<script>
						function downloadFile(filename) {
							window.location = 'download.do?filename='
									+ filename;
						}
					</script>
				</c:if>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
				</div>
				<input type="text" class="form-control innm" name="faq_regdate"
					value="${faq.faq_regdate}" readonly <%=sts %>>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">조회수</span>
				</div>
				<input type="text" class="form-control innm" name="faq_cnt"
					value="${faq.faq_cnt}" readonly <%=sts %>>
			</div>
		</form>
			<div id="footer">
				<%-- 	  	<button type="submit" class="btn btn-primary" <%=sts %>>글수정</button> --%>
				<%-- 	  	<button id="conWrite" type="button" class="btn btn-primary" <%=sts %>>글쓰기</button> --%>
				<%-- 	  	<button id="conDel" type="button" class="btn btn-primary" <%=sts %>>글삭제</button> --%>
				<button type="button" class="btn btn-primary" onclick="location.href='getFaqList.do';"> 목록으로 </button>
			</div>
	</div>
	<!-- 클릭시 보이는 이미지 start -->
	<div id="imgBox" class="container-fluid">
		<div id="imgContentBox">
			<div id="imgBoxTitleBar">
				<span id="closeX" onclick="closeX()">X</span>
				<script>
					function closeX() {
						$("#imgBox").hide();
					}
				</script>
			</div>
			<img id="imgBoxImg" src="resources/img/${faq.filename}">
		</div>
	</div>
	<!-- 클릭시 보이는 이미지 end -->
</body>
</html>
