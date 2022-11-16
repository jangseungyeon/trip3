<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="resources/css/style.css" rel="stylesheet">

<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/my_info.css" rel="stylesheet">
<link href="resources/css/my_Reservation.css" rel="stylesheet">
<link href="resources/css/my_likes.css" rel="stylesheet">

<title>Host login</title>
<%@ include file="host_header.jsp"%>
</head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');
</style>

<style>

body, html{
	background: #f9fcff;
	}

.host-update-area{
	margin: 30px;
	padding: 30px;
	box-shadow: 5px 5px 10px -5px;
	background: white;
	color: #19558c;
	width: 65%;
	align: center;
}

	#checkMessage1, #checkEmail1{
		color:red;
		font-size:12px;
	}
	#checkMessage2, #checkEmail2{
		color:blue;
		font-size:12px;	
	}
	.id_ok{
		display: none;
		color: blue;
		font-size:12px;
	}
	.id_overlap{
		display: none;
		color: red;
		font-size:12px;
	}
	.id_format{
		display: none;
		color: red;	
		font-size:12px;
	}
	td, table{
		padding: 5px;
		border: none;
	}
	.td1{
		padding: 5px;
		min-width: 180px;
	}
	.td2{
		padding: 5px;
		min-width: 300px;
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
		/* background:linear-gradient(to right, #ff8e15, #dc3545, #dc3545); */
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
	
	#checkMessage1, #checkEmail1{
		color:red;
		font-size:12px;
	}
	#checkMessage2, #checkEmail2{
		color:blue;
		font-size:12px;	
	}
	
	.out_insert:hover{
   border-radius: 100px;
   color: #ff8e15 !important;
   background: #fff !important;
   width: 87px;
   height: 87px;
   border: 2px solid #ff8e15;
   padding: 15px;
}

.out_insert:hover a{
   border-radius: 100px;
   color: #ff8e15 !important;
   background: transparent !important;
}


.out_insert{
   border-radius: 100px;
   color: white;
   background: #ff8e15;
   width: 87px;
   height: 87px;
   border: 2px solid #ff8e15;
   padding: 15px;
}
	
</style>
</head>
<body>
<br><br>
<div align=center>
<div align=center>
<span style="font-size:30px; color:#dc3545;">${host_id}</span> <span style="font-size:25px">호스트 정보 수정</span><br><br>
</div>

<!-- 비밀번호 수정 -->
<div class="host-update-area">
<span style="font-size:25px">비밀번호 수정</span><br><br>
<form action="host_pw_update.do" method="post">
<table>
<tr><td class="td1"><b>비밀번호</b></td> <td class="td2"> <input class="input1" type="password" name="host_pw"></td></tr>
<tr><td class="td1"><b>비밀번호 확인</b></td> <td class="td2"> <input class="input1" type="password" name="host_pw2"><span id="checkMessage1"></span>
<span id="checkMessage2"></span></td></tr>
<tr><td style="text-align:center;" colspan='2'><input type="submit" value="수정하기" class="host-insert-button"></td>
<td><input type="hidden" name="host_id" value="${host.host_id}"></td></tr>
</table>
</form>

</div>

<!-- 일반정보 수정 -->
<div class="host-update-area">
<span style="font-size:25px">일반정보 수정</span><br><br>
<form action="host_update.do" method="post">
<table>
<tr><td class="td1"><b>상호명</b></td><td class="td2"><input class="input1"  type="text" name="host_bizname" value="${host.host_bizname}"></td></tr>
<tr><td><b>대표자명</b></td> <td><input class="input1"  type="text" name="host_name" value="${host.host_name}"></td></tr>
<tr><td><b>생년월일</b></td> <td><input class="input1"  type="text" name="host_birth" value="${host.host_birth}"></td></tr>
<tr><td><b>이메일</b></td> <td><input class="input1"  type="text" name="host_email" value="${host.host_email}"></td></tr>
<tr><td><b>휴대전화</b></td> <td><input class="input1"  type="text" name="host_phone" value="${host.host_phone}"></td></tr>
<tr><td><b>도로명 주소</b></td> <td><input class="input1"  type="text" name="host_addr1" value="${host.host_addr1}"></td></tr>
<tr><td><b>상세 주소</b></td> <td><input class="input1"  type="text" name="host_addr2" value="${host.host_addr2}"></td></tr>
<tr><td><b>은행</b></td> <td><input class="input1"  type="text" name="host_bank" value="${host.host_bank}"></td></tr>
<tr><td><b>계좌번호</b></td> <td><input class="input1"  type="text" name="host_banknum" value="${host.host_banknum}"></td></tr>
<tr><td style="text-align:center;" colspan='2'><input type="submit" value="수정하기" class="host-insert-button"></td>
<td><input type="hidden" name="host_id" value="${host.host_id}">
<input type="hidden" name="host_status" value="0"></td></tr>

</table>
</form>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			<script>
			
			$(document).ready(function(){
			
			document.getElementById("host_addr1").addEventListener("click", function(){
				//주소 입력칸을 클릭하면 주소 검색창 팝업
				 new daum.Postcode({
				        oncomplete: function(data) {
							document.getElementById("host_addr1").value = data.address;
							document.querySelector("#host_addr2").focus();
				        }
				    }).open();
				})
				
			});
			</script>
<script>
//비밀번호 형식, 일치여부 체크
function passwordCheckFunction1(){
	var password1 = $("#host_pw").val();
	var password2 = $("#host_pw2").val();
	var pwReg =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
	console.log("비밀번호 체크");
	
	if (password1 == "" && password2 == ""){
		$("#checkMessage1").html("");
		$("#checkMessage2").html("");
	} else if(pwReg.test($('#host_pw').val()) == false){
		$("#checkMessage1").html("비밀번호는 8~16자, 영문 대소문자, 숫자, 특수문자를 포함해주세요.");
		$("#checkMessage2").html("");
	} else if(pwReg.test($('#host_pw').val()) == true){
		$("#checkMessage1").html("");
		$("#checkMessage2").html("적합한 비밀번호입니다.");
	} else if(password2 != "" && password1 != password2 && pwReg.test($('#host_pw').val()) == true && pwReg.test($('#host_pw2').val()) == true){
		$("#checkMessage1").html("비밀번호가 일치하지 않습니다.");
		$("#checkMessage2").html("");
	} else if (password1 == password2 && pwReg.test($('#host_pw').val()) == true && pwReg.test($('#host_pw2').val()) == true){
		$("#checkMessage1").html("");
		$("#checkMessage2").html("적합한 비밀번호입니다.");
	} 
}

function passwordCheckFunction2(){
	var password1 = $("#host_pw").val();
	var password2 = $("#host_pw2").val();
	var pwReg =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
	
	if (password1 == "" && password2 == ""){
		$("#checkMessage1").html("");
		$("#checkMessage2").html("");
	} else if(password1 != password2){
		$("#checkMessage1").html("비밀번호가 일치하지 않습니다.");
		$("#checkMessage2").html("");
	} else if (password1 == password2 && pwReg.test($('#host_pw').val()) == true && pwReg.test($('#host_pw2').val()) == true){
		$("#checkMessage1").html("");
		$("#checkMessage2").html("비밀번호가 일치합니다.");
	} 
}

function emailCheckFunction(){
	var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var host_email = $("#host_email").val();
	console.log("이메일 체크 펑션");
	if (host_email == ""){
		$("#checkEmail1").html("");
		$("#checkEmail2").html("");
	} else if (emailRegex.test($("#host_email").val()) == false){
		$("#checkEmail1").html("이메일 형식이 올바르지 않습니다.");
	} else if (emailRegex.test($("#host_email").val()) == true){
		$("#checkEmail2").html("이메일 형식이 올바릅니다.");
	}
}

</script>

<!-- 나가기 버튼 -->
<a href="move_to_host_index.do" style="color:white; font-size:13;"><div class="out_insert" style="text-align: center; position: fixed; bottom:56px; right:28px; z-index:1000; box-shadow: 0 5px 18px -7px rgba(0,0,0,1);">
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-x" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M12.146 5.146a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
</svg>
<br><b>나가기</b>
</div></a>  


<!-- 탈퇴 -->

<div class="host-update-area">
<form action="host_leave.do" method="post">
<input type="hidden" name="host_id" value="${host_id}">
<input type="submit" value="호스트 탈퇴" class="host-insert-button" style="background: #19558c;">
</form>
</div>

</div>

</body>
</html>