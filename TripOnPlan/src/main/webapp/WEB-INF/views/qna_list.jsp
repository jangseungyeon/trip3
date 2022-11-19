<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>triponplan</title>
<%@ include file="header.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<script>
	function detailList(num) {
		location.href = "qna_update.do?qna_num=" + num;
	}
</script>
</head>
<body>
<br>

	<div class="container">
		<h2>1:1 문의 목록</h2>
		<br><br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
               <!-- <th>아이디</th> -->
					<th>제목</th>
					<th>날짜</th>
                    <th>답변여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnalist}" var="qna1">
					<tr>
						<td>${qna1.qna_num }</td>
						<td><a href="qna_views.do?qna_num=${qna1.qna_num }">${qna1.qna_title }</a></td>
						<td>${qna1.qna_regdate }</td>
						<td>${qna1.qna_views }</td>
						<td>
							<form action="qna_delete.do" method="post">
								<input type="hidden" name="qna_num" value="${qna1.qna_num }">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>

</body>
</html>
