<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<style>
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

a.list-btn {
	text-decoration: none;
	font-weight: bolder;
	display: inline-block;
	padding: 5px 10px;
	background-color: white;
	color: #fff;
	border: 1px solid #777;
	border-radius: 5px;
}

a.list-btn:hover, a.list-btn:active {
	background-color: red;
}

a.aSel {
	color: red;
}

div#btnBox {
	text-align: center;
}

/* search nav */
.faql-nav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
	background-color: transparent;
}

button.btn-search {
	background-color: #19558c;
	color: white;
}

a.list-btn {
	text-decoration: none;
	font-weight: bolder;
	display: inline-block;
	padding: 5px 10px;
	background-color: none;
	color: #19558c;
	border: 1px solid #777;
	border-radius: 5px;
}

a.list-btn:hover, a.list-btn:active {
	background-color: #19558c;
	color: white;
}

a.aSel {
	color: white;
	text-decoration: none;
	font-weight: bolder;
	display: inline-block;
	padding: 5px 10px;
	background-color: #19558c;
	border: 1px solid #777;
	border-radius: 5px;
}

div#btnBox {
	text-align: center;
}

button.btn.btn-success.faq-btn, .faql-thead {
	background-color: #19558c;
	border-color: #19558c;
}

.faql-thead:hover {
background-color: #19558c;
	border-color: #19558c;
}
/* search nav end*/
.faql-div1 {
	margin-bottom: 0;
	background-color: transparent;
}

.faql-table {
	text-align: center;
}

.faql-div2 {
	padding: 0 85px;
}

@media ( max-width : 775px) {
	#faql-th1, #faql-th2, #faql-td1, #faql-td2 {
		display: none;
	}
}

@media ( max-width : 575px) {
	select#sel1 {
		width: 25%;
	}
	input.form-control.mr-sm-2 {
		width: 54%;
	}
	.faql-div2 {
		padding: 0;
	}
}
</style>
<script>
function selTr(val){
	location.href = "getFaq.do?faq_no="+val;
}
</script>

<body>
	<div class="jumbotron faql-div1">
		<h1>공지 사항</h1>
	</div>
	<div class="container-fluid faql-div2">
		<nav id="searchNav"
			class="navbar navbar-expand-sm navbar-dark faql-nav">
			<form class="form-inline" action="getFaqList.do" method="post">
				<select class="form-control" id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}</option>
					</c:forEach>
					<%-- 		<option value="${conditionMap['제목']}">${conditionMap['제목']}</option> --%>
					<%-- 		<option value="${conditionMap['내용']}">${conditionMap['내용']}</option> --%>
				</select> <input class="form-control mr-sm-2" type="text"
					name="searchKeyword" placeholder="검색어를 입력하세요.">
				<button class="btn btn-success faq-btn" type="submit">검색</button>
			</form>
		</nav>
		<div class="container-fluid">
			<table class="table table-hover faql-table">
				<thead class="btn-primary faql-thead">

					<tr>
						<th style="width: 50%;">제목</th>
						<th id="faql-th1" style="width: 25%;">작성자</th>
						<th id="faql-th2" style="width: 25%;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${faqList}" var="faq">
						<tr onclick="selTr(${faq.faq_no})" style="cursor: pointer;">
							<td>${faq.faq_title}</td>
							<td id="faql-td1" class="tdCenter">${faq.faq_writer}</td>
							<td id="faql-th2" class="tdCenter">${faq.faq_regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br>
			<div id="btnBox">
				<!-- 반복처리할 태그 시작-->
				<c:if test="${paging.nowPageBtn > 1 }">
					<a class="list-btn"
						href="getFaqList.do?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
					step="1" var="i">
					<c:choose>
						<c:when test="${paging.nowPageBtn == i}">
							<a class="aSel">${i}</a>
						</c:when>
						<c:otherwise>
							<a class="list-btn" href="getFaqList.do?nowPageBtn=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
					<a class="list-btn"
						href="getFaqList.do?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
				</c:if>
				<!-- 반복처리할 태그 끝 -->

			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>
