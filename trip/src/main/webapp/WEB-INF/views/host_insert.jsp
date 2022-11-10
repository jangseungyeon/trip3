<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>Host 회원가입</title>
<style>
	#checkMessage1, #checkEmail1{
		color:red;
	}
	#checkMessage2, #checkEmail2{
		color:blue;	
	}
	.id_ok{
		display: none;
		color: blue;
	}
	.id_overlap{
		display: none;
		color: red;
	}
	.id_format{
		display: none;
		color: red;	
	}

</style>

</head>
<body>

<br>
<h1>호스트 회원가입</h1>
<br>
<form action="host_insert.do" method="post">
아이디 <input type="text" name="host_id" class="host_id" onkeyup="checkId()">
<span class="id_ok">사용 가능한 아이디입니다.</span>
<span class="id_overlap">이미 사용중인 아이디에요.</span>
<span class="id_format">ID는 6~11자, 영문자로 시작, 영문자와 숫자만 가능합니다.</span><br>
비밀번호 <input type="password" name="host_pw" id="host_pw" onkeyup="passwordCheckFunction1();"><br>
비밀번호 확인 <input type="password" name="host_pw2" id="host_pw2" onkeyup="passwordCheckFunction2();"><br>
<span id="checkMessage1"></span><span id="checkMessage2"></span><br>
상호명 <input type="text" name="host_bizname"><br>
대표자명 <input type="text" name="host_name"><br>
생년월일 <input type="text" name="host_birth"><br>
이메일 <input type="text" name="host_email" id="host_email" onkeyup="emailCheckFunction();"><span class="checkEmail1"></span><span class="checkEmail2"></span><br>
휴대전화 (-)제외 <input type="text" name="host_phone"><br>
도로명 주소 <input type="text" name="host_addr1"><br>
상세 주소 <input type="text" name="host_addr2"><br>
 <input type="hidden" name="host_status" value="0"><br>
사업자번호 <input type="text" name="host_biznum"><br>
사업자등록증 <input type="text" name="host_bizimg"><br>
은행 <input type="text" name="host_bank"><br>
계좌번호 <input type="text" name="host_banknum"><br><br>

<input type="submit" value="가입하기"><br>
</form>


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