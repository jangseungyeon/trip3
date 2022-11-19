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
<%@ include file="host_login_header.jsp"%>
</head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');


</style>

<style>
	a {
  	text-decoration: none;
  	color: white;
	}
	
	a:hover {
  	text-decoration: none;
  	color: white;
	}
	
	html, body{
		background: #f9fcff;
	}
	
	*{
		margin:0;
		padding:0;
		font-color:#19558c;
	}
	

	
	.main-container-insert{
		width:100%;
		height:800px;
		text-align:center;
		position: relative;
	}

	.sub-container-insert{
		width:50%;
		height:800px;
		line-height: 180%;
		float:middle;
		background: #f9fcff;
		position: absolute;
		left: 60%;
		top: 20%;
 		transform: translate(-60%, -20%);
 		color: #19558c;
	}

		.host-login-text{
		font-size: 30px;
		color: #19558c;
		position: absolute;
		top: 10%;
		left: 50%;
		line-height: 180%;
		z-index: 2;
	}
	
	.login-form{
		width:100%;
		position:absolute;
		top:30%;
		left:50%;
		transform:translate(-50%, -30%);
		text-align:left;
		background: #f9fcff;
	}
	.input-id-pw{
		width:100%;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
	}
	.input-id-pw:focus{
		width:100%;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
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
	
	/*아래로 버튼 깜빡임 애니메이션*/
	.blinking{
		animation:blink 0.8s ease-in-out infinite alternate;
	}
	@keyframes blink{
		0%{
			opacity:0.2;
			}
		100%{
			opacity:0.9;
			}
	}
	
	.contents-box-cap{
		min-height: 35px;
		width:100%;
		background: #19558c;
		border-radius: 20px 20px 0px 0px;
	}
	
	.contents-box{
		min-height:250px;
		padding:30px;
		background: #f9fcff;
		color:#19558c;
		font-size:25px;
		padding:30px;	
		position:relative;
	}
	
	.contents-box2{
		width:100%;
		height:700px;
		position: relative;
;
	}
	.contents-box2::after {
		background:url("resources/img/your-turn.jpg");
		background-size:cover;
		width:100%;
		height:700px;
		content:"";
		filter: brightness(50%);
		z-index: 0;
		top:0;
		left:0;
		position:absolute;
	}

	
</style>

<style>
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

<!-- 나가기 버튼 -->
<a href="move_to_host_login.do" style="color:white; font-size:13;"><div class="out_insert" style="text-align: center; position: fixed; bottom:56px; right:28px; z-index:1000; box-shadow: 0 5px 18px -7px rgba(0,0,0,1);">
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-x" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
  <path fill-rule="evenodd" d="M12.146 5.146a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
</svg>
<br><b>나가기</b>
</div></a>  


<br><div style="min-height:150px">
<h1 class="host-insert-text"><span class="main-div2" style="font-size:60px !important">tripONplan</span><b>의<br>&nbsp;&nbsp;호스트가 되는 겁니다.</b></h1>
<br></div>

<div class="main-container-insert">
<div class="sub-container-insert">
<form action="host_insert.do" method="post" class="login-form">
<table>
<tr>
<td class="td1"><b>아이디</b></td> 
<td class="td2"><input type="text" name="host_id" class="host_id input1" class="input1" placeholder="아이디를 입력해주세요." onkeyup="checkId()">
<span class="id_ok">사용 가능한 아이디입니다.</span>
<span class="id_overlap">이미 사용중인 아이디에요.</span>
<span class="id_format">ID는 6~11자, 영문자로 시작, 영문자와 숫자만 가능합니다.</span><br>
</td>
</tr>

<tr>
<td class="td1"><b>비밀번호</b></td>
<td class="td2"><input type="password" name="host_pw" id="host_pw" class="input1" placeholder="비밀번호를 입력해주세요." onkeyup="passwordCheckFunction1();">
</td>
</tr>

<tr>
<td class="td1"><b>비밀번호 확인</b></td>
<td class="td2"><input type="password" name="host_pw2" id="host_pw2" class="input1" placeholder="비밀번호를 한번 더 입력해주세요." onkeyup="passwordCheckFunction2();">
<span id="checkMessage1"></span>
<span id="checkMessage2"></span>
</td>
</tr>

<tr><td><b>상호명</b></td> <td><input type="text" name="host_bizname" class="input1" placeholder="사업자명을 입력해주세요."><br></td></tr>

<tr><td><b>대표자명</b></td> <td><input type="text" name="host_name" class="input1" placeholder="대표자명을 입력해주세요."><br></td></tr>

<tr><td><b>이메일</b></td> <td><input type="text" name="host_email" id="host_email" class="input1" placeholder="예) 1018@triponplan.com" onkeyup="emailCheckFunction();"><span class="checkEmail1"></span><span class="checkEmail2"></span><td></td></tr>

<tr><td><b>휴대전화</b></td> <td><input type="text" name="host_phone" id="host_phone" class="input1" placeholder="하이픈(-)을 제외하고 입력해주세요."></td></tr>

<tr><td><b>도로명 주소</b></td> <td><input type="text" name="host_addr1" id="host_addr1" class="input1" placeholder="클릭하시면 도로명 주소 찾기 팝업이 실행돼요."></td></tr>

<tr><td><b>상세 주소</b></td> <td><input type="text" name="host_addr2" id="host_addr2" class="input1" placeholder="나머지 주소를 입력해주세요."></td></tr>

<tr><td><b>은행</b></td><td> <input type="text" name="host_bank" id="host_bank" class="input1" placeholder="정산받으실 은행명을 입력해주세요."></td></tr>

<tr><td><b>계좌번호</b></td> <td><input type="text" name="host_banknum" id="host_banknum" class="input1" placeholder="은행의 계좌번호를 입력해주세요."></td></tr>
<tr><td style="text-align:center;" colspan='2'><input type="submit" value="가입하기" class="host-insert-button"></td><td> <input type="hidden" name="host_status" value="0"><br></td></tr>

</table>


</form>
</div>
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

//아이디 중복, 형식 체크
function checkId(){
    var host_id = $('.host_id').val();
    var data = {host_id: host_id}
    var idReg = /^([a-z | A-Z]{1})([A-Za-z0-9\_]{5,11})$/;
    $.ajax({
        url:'host_id_check.do',
        type:'post',
        data: data,
        cache: false,
        success:function(result){
        	console.log(result);
        	if(host_id == "" || host_id == null){
        		$('.id_ok').css("display","none"); 
                $('.id_overlap').css("display", "none");
                $('.id_format').css("display", "none");
        	} else if(idReg.test($('.host_id').val()) == false){
        		$('.id_ok').css("display","none"); 
                $('.id_overlap').css("display", "none");
                $('.id_format').css("display", "inline-block");
        	} else if(result == 1 && idReg.test($('.host_id').val()) == true){
                $('.id_ok').css("display", "none"); 
                $('.id_overlap').css("display", "inline-block");
                $('.id_format').css("display", "none");
            } else if(result == 0 && idReg.test($('.host_id').val()) == true) {
                $('.id_ok').css("display","inline-block");
                $('.id_overlap').css("display", "none");	
                $('.id_format').css("display", "none");
            }
        },
        error:function(){
        }
    });
    };


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


</body>
</html>