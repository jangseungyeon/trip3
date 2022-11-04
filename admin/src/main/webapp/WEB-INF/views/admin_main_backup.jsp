<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String user_id = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>manage system</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/date-1.1.2/fh-3.2.4/r-2.3.0/sp-2.0.2/sl-1.4.0/datatables.min.css" />

<script type="text/javascript"
	src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/date-1.1.2/fh-3.2.4/r-2.3.0/sp-2.0.2/sl-1.4.0/datatables.min.js"></script>

<style>
.header-greet {
	text-align: end;
	padding-right: 20px;
	padding-top: 20px;
}
</style>

<script>
	$(document).ready(function() {
		$('#userTable').dataTable({
			pageLength : 10,
			bPaginate : true,
			bLengthChange : true,
			lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
			bAutoWidth : false,
			processing : true,
			ordering : true,
			serverSide : false,
			searching : true,
			ajax : {
				"url" : "WEB-INF/views/manage_userList.do",
				"type" : "POST",
				"data" : function(d) {
					d.userStatCd = "NR";
				}
			},
			
			
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>상태</th>
			<th>타입</th>
			
			columns : [ {
				data : "user_id"
			}, {
				data : "user_name"
			}, {
				data : "user_birth"
			}, {
				data : "user_gender"
			}, {
				data : "user_email"
			}, {
				data : "user_phone"
			}, {
				data : "user_address1"
			}, {
				data : "user_address2"
			}, {
				data : "user_status"
			}, {
				data : "user_type"
			} ]

		});

	});
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row no-gutters">
			<div class="col-3 bg-success">
				<h1>투어 3.0</h1>
				<p>관리자를 위한 완벽한 시스템</p>
			</div>
			<div class="col-9 bg-warning">
				<div class='header-greet'>
					<span><i class="fa">&#xf007;</i> 안녕하세요 ${manage_name}님</span> <a
						href='manage_logout.do' class='logout-btn'><i class="fa">&#xf011;</i></a>
				</div>
			</div>
		</div>
		<div>
			<div class="jumbotron">
				<h1>대충 차트 비스무리한거</h1>
				<p>대충 그 내용</p>
			</div>

			<div class="alert alert-success">
				<strong>집중!</strong> 집중해 주세요
			</div>

			<div class="row no-gutters">
				<div class="col-3 bg-success">
					<div class="container">
						<h2>관리자 메뉴</h2>
						<div class="admin-menu">
							<ul class="nav flex-column">
								<li class="nav-item"><a class="nav-link" href="#">상황판</a></li>
								<li class="nav-item"><a class="nav-link" href="manage_userList.do">사용자 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="manage_roomList.do">숙소 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="#">게시판 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="manage_hostList.do">업주 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="#">결제 관리</a></li>
								<li class="nav-item"><a class="nav-link" href="#">관리자 관리</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-9 bg-warning">

					<table id="userTable"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>성별</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>상태</th>
								<th>타입</th>
							</tr>
						</thead>
						<!-- tbody 태그 필요 없다. -->
					</table>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
