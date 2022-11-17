<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.review.ReviewVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>

<style>
	body, html{
		background: #f9fcff;
	}
	table, td{
		border: 1px solid;
		border-color: gray;
		padding: 5px;
		font-color: #19558c;
		text-align: center;
		font-size: 14px;
	}
	.review_div {		
	}
	
	.title_td{
		background: #be3232;
		color: #f9fcff;
	}

	.input1{
		width:100%;
		max-width: 290px;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		box-shadow: 0 0 0 1px #19558c;
		outline:none;
	}
	.input1:focus{
		width:100%;
		max-width: 290;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		box-shadow: 0 0 0 3px #ff677d;
		outline:none;
	}


</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $("#mykeyword").keyup(function() {
        var value = $(this).val().toLowerCase();
        $("#myTable_tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        // $("#myTable > tbody > tr").hide();
        // var temp = $("#myTable > tbody > tr > td:nth-child(5n+4):contains('" + value + "')");
        // $(temp).parent().show();
    });
});
</script>



</head>
<body>
<br><br>

<div align=center>
<div style="width:80%">
<span style="font-size: 20px; color: #19558c;">
<c:choose>
<c:when test="${reviewListForHost.size() eq '0'}"><span style="font-size: 25px; color: #dc3545;">${host_id}</span>님 등록된 숙소 리뷰가 없습니다. </c:when>
<c:when test="${reviewListForHost.size() ne '0'}">
<span style="font-size: 25px; color: #dc3545;">${host_id}</span>님! 숙소의 리뷰 목록을 살펴보세요. (최신순)<br><br></span>
<div align=left> <input type="text" id="mykeyword" class="input1" placeholder="어디 한번 찾을 내용을 입력해보세요"><br>
 <br></div>
<table id='myTable' style="width:100%">
<thead>
<tr><td class="title_td">리뷰ID</td><td class="title_td">내 객실명</td><td class="title_td">객실ID</td><td class="title_td">호스트ID</td><td class="title_td">리뷰 내용</td><td class="title_td">리뷰 사진(선택)</td><td class="title_td">별점</td><td class="title_td">작성일</td></tr></thead>
<tbody id="myTable_tbody">
	<c:forEach var="i" begin="0" end="${reviewListForHost.size()-1}" step="1">
		<tr>
			<td>${reviewListForHost[i].review_id}</td>
			<td>${reviewListForHost[i].room_name}</td>
			<td>${reviewListForHost[i].room_id}</td>
			<td>${reviewListForHost[i].host_id}</td>
			<td>${reviewListForHost[i].review_content}</td>
			<td><img src="resources/room_img/${reviewListForHost[i].review_img}" style="height:100px; width:100px;" onerror="this.style.display='none';"></td>
			<td>${reviewListForHost[i].star_point}</td>
			<td>${reviewListForHost[i].write_date}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:when>
</c:choose>

</div>
</div>
<br><br><br><br><br><br>
</body>
</html>