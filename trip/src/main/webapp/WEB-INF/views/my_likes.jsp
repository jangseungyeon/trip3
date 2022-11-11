<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>

</head>
<body>
<br>
<div class="container mt-3">
  <h2 class="mylib-h2">숙소 좋아요 목록</h2>
	

	<div class="mylib-body container mt-2">
		<ul class="nav nav-tabs">
			<li class="nav-item flex_item mylib-li">
				<div id="test">
					<a id="test" class="tab-link current" data-tab="tab-1"
						href="likeslist.do">숙소</a>
				</div>
			</li>
			<li class="nav-item flex_item mylib-li">
				<div id="test1">
					<a id="test1" class="tab-link" data-tab="tab-2"
						href="likeslist2.do">플래너</a>
				</div>
			</li>
		</ul>
		
		<div class="tab-content">
			<div id="tab-1" class="tab-content current">
				<br>
				
				<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th class="likes-th1">숙소 사진</th>
					<th>숙소 이름</th>
					<th>플레너는 작성자</th>
					<th>내 아이디 </th>
					<th>좋아요 갯수</th>
				</tr>
			</thead>
			<tbody>
      <c:forEach var="i" items="${list}">
						<tr>
						<td><img width="50%" src="resources/room_img/${i.room_img_no1}"></td>
						<td>${i.room_name}</td>
						<td>${i.like_id}</td>
						<td>${i.user_id}</td>
						<td>${i.like_count}</td>
					
					</tr>
					
				</c:forEach>
				
				</tbody>
		</table>
		<br>
		<br>
	</div>

			</div>



		</div>
	</div>
</body>
</html>