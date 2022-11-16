<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>
<style>

	html, body{
		background: #f9fcff;
	}

	.pwch{
		color:red;
		font-size:12px;
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
		box-shadow: 0 0 0 3px #ff8e15;
		outline:none;
	}
		.host-insert-text{
		font-size: 30px;
		color: #19558c;
		position: absolute;
		top: 10%;
		left: 35%;
		text-align: center;
		line-height: 180%;
		z-index: 2;
	}


	.host-insert-button{
		width:40%;
		min-width:153px;
		max-width:300px;
		height:40px;
		padding: 5px 20px;
		margin: 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#dc3545; /*빨간색*/
		background-color:#007bff; /*파란색*/
		background-color:#ff8e15; /*주황색*/
		background:linear-gradient(to right, #ff8e15, #dc3545, #dc3545);
		color:white;
		border:none;
		font-weight:bold;
		z-index: 2;
	}
	.host-insert-button:hover{
		width:40%;
		min-width:153px;
		max-width:300px;
		height:40px;
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#dc3545; /*빨간색*/
		background-color:#007bff; /*파란색*/
		background-color:#ff8e15; /*주황색*/
		color:white;
		border:none;
		font-weight:bold;
		filter: brightness(80%);
		cursor : pointer;
		z-index: 2;
	}
	
		.pride{
		/*white, lightCyan, skyBlue, deepSkyBlue*/
		background: #f9fcff;
		color:#19558c;
		font-size:25px;
		padding:30px;	
	}
	.recent30, .count_host, .count_room, .count_money, .count_rank_room_avg_income, .count_best_host_income{
		color:#DC3545;
		font-size:35px;
	}

</style>

<script>
$(function(){
	<% if (request.getParameter("fail") != null) { %>
	$(".pwch").text("비밀번호가 일치하지 않습니다.");
	<%} %>
});
	
</script>
</head>
<body>
<br><br>

<div align="center" class="host-insert-text"><span class="recent30">${host_id}</span> 호스트 정보 수정<br>
</div><br><br><br>
<div align="center" style="min-height:200px">
<form action="host_pw_check.do" method="post">
<input type="hidden" name="host_id" value="${host_id}">
<input type="password" name="host_pw_check" placeholder="비밀번호를 입력하세요." class="input1"><br>
<br><span class="pwch"></span><br>
<input class="host-insert-button" type="submit" value="확인">
</form>

</div>



</body>
</html>