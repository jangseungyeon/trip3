<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 리스트 페이지</title>
<%@ include file="header.jsp"%>
<meta charset="utf-8">

<script>
	function detailList(num) {
		location.href = "qna_update.do?qna_num=" + num;
	}
</script>
	<!-- <script> -->
<!-- // function deleteOne(num){ -->
<!-- // 		if(confirm("삭제 하시겠습니까?")){ -->
<!-- // 		location.href="qna_delete.do?qna_num="+num; -->
<!-- // 	} -->
<!-- // }; -->

<!-- // $(function() { -->
<!-- // 	var answer = document.getElementById("qna_views").value; -->
<!-- // 	console.log(answer); -->
	
<!-- // 	if(answer == 1){ -->
<!-- // 		$("#amd-btn").hide(); -->
<!-- // 	} -->
<!-- // }); -->
	<!-- </script> -->
</head>
<body>
<br>

	<div class="container">
		<h2>관리자 질문 목록 리스트 페이지</h2>
		<p>사용자가 질문한 내용 답변 여부 확인후 삭제 관리할수 있는 관리자 페이지</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>질문날짜</th>
					<th>답변여부</th>
               <!-- <th>삭제</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaadminlist}" var="qna1">
					<tr>
						<td>${qna1.qna_num }</td>
						<td><a href="qna_admin_views.do?qna_num=${qna1.qna_num }">${qna1.qna_title }</a></td>
						<td>${qna1.qna_regdate }</td>
						<td>${qna1.qna_views }</td>
						<td>
							<form action="qna_delete.do" method="post">
								<input type="hidden" name="qna_admin_id" value="${qna1.qna_num }">
                      <%--  <button type="button" onclick="deleteOne(${qnaOne.qna_num});" class="btn btn-primary">삭제</button> --%>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-12 pt-3" style="text-align: center;">
			<a href="qna_insert.do" class="btn btn-primary">질문등록</a> 
        <!--<a href="qna_update.do" class="btn btn-primary">수정하기</a> -->
		</div>
	</div>

</body>
</html>
