<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 비밀번호 찾기</title>

	

<style>
.host-find-id{
	color:#19558c;
	font-size:14px;
}

.input1{
		width:300px;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
}

	.input1:focus{
		width:300px;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		outline:none;
	}


.sub1{
		width:100px;
		min-width:100px;
		max-width:100px;
		height:40px;
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#ff8e15; /*주황색*/
		background-color:#19558c; /*남색*/
		color:white;
		border:none;
		z-index: 2;
}

.sub1:hover{
		width:100px;
		min-width:100px;
		max-width:100px;
		height:40px;
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#ff8e15; /*주황색*/
		background-color:#19558c; /*남색*/
		color:white;
		border:none;
		z-index: 2;
		filter: brightness(80%);
}

</style>

	<style>
.host-find-id{
	color:#19558c;
	font-size:14px;
}

.input1{
		width:300px !important;
		height:30px !important;
		padding:5px 20px !important;
		border-radius:20px !important;
		border:none !important;
		margin:3px !important;
		font-size:12px !important;
}

	.input1:focus{
		width:300px !important;
		height:30px !important;
		padding:5px 20px !important;
		border-radius:20px !important;
		border:none !important;
		margin:3px !important;
		font-size:12px !important;
		outline:none !important;
	}


.sub1{
		width:100px  !important;;
		height:30px !important;;
		padding: 5px 20px !important;;
		border-radius: 5px !important;;
		font-size:15px !important;;
		background-color:#ff8e15 !important;; /*주황색*/
		background-color:#19558c !important;; /*남색*/
		color:white !important;;
		border:none !important;;
		z-index: 2;
		font-size:12x;
}

.sub1:hover{
		width:100px;
		height:30px;
		padding: 5px 20px;
		border-radius: 5px;
		font-size:15px;
		background-color:#ff8e15; /*주황색*/
		background-color:#19558c; /*남색*/
		color:white;
		border:none;
		z-index: 2;
		font-size:12px;
		filter: brightness(80%);
}

</style>

<%@ include file="host_login_header.jsp"%>


<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');
</style>


	
</head>
<body>





<!-- 회원찾을때 넘어가 form태그 -->
<form action="" method="post" id="host_findform">
	<input type="hidden" name="host_phone" id="host_phone">
	<input type="hidden" name="host_email" id="host_email">
</form>
<br><br><br>

<div align=center>
<div align=center>
<span class="main-div2" style="font-size:60px; line-height:40%;">tripONplan</span>
<br><span style="color:#19558c; font-size:30px"><br>호스트 비밀번호 찾기</span><br>
</div>
<br>
<div align=center style="width:50%" class="host-find-id">
<input type='radio' name='findPw' value='email' onclick='emailconfig()'>이메일로 찾기 &nbsp;&nbsp;
<input type='radio' name='findPw' value='phone' onclick='phoneconfig()'>휴대폰으로 찾기

<div id="config" style="display: none">
	<input id="email" class="input1" type="text" placeholder="이메일을 입력해주세요."
		required autofocus>
	<button id="sendMail" class="sub1" type="button">발송하기</button><br>
	<input id='emailCheck' class='input1' type='text' required disabled>
	<button id='check' class='sub1'
		onclick='emailCheck()' type="button">인증확인</button>
</div>
<div id="config1" style="display: none">
	<input id="phone" type="text" name="phone" class="input1" title="전화번호 입력" placeholder="휴대폰 번호를 입력해주세요."/>
	<span id="phoneChk" class="sub1">발송하기</span> <br />
	<input id="phone2" type="text" name="phone2" class="input1" title="인증번호 입력" disabled />
	<span id="phoneChk2" class="sub1">인증확인</span><br>
	<span class="successPhoneChk"></span>
	<input type="hidden" id="phoneDoubleChk" />
	<br><div align=center class="complete"></div>
</div>
</div>
</div>

<!-- 휴대폰 인증 성공하면 host 객체에 값이 생겨서 아래 태그가 나타난다. -->
 <c:if test="${host ne null}">
<%-- <%if(request.getAttribute("host")!=null){ %> --%>
<div align=center>
<form action="host_change.do" id="pwchange" method="post">
<input type=text name="host_id" id="host_id" value="${host}" class="input1" disabled><br>
<input type="password" name="host_pw" id="host_pw" placeholder='새 비밀번호를 입력해주세요.' class="input1"><br>
	<input type="password" name="host_pw2" id="host_pw2" placeholder='비밀번호를 한번 더 입력해주세요.'  class="input1"><br><br>
	<button type="button" onclick="change()" class="sub1">변경하기</button>
	
</form>
</div></c:if>
<%-- <%} %> --%>

<script>
$(function(){
	<% if (request.getParameter("complete") == "1") { %>
	$(".complete").text("비밀번호가 변경되었습니다.");
	<%} %>
});
</script>




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//휴대폰
	$(function() {
		//휴대폰 번호 인증
		var code2 = "";
		$("#phoneChk").click(
				function() {
					alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
					var phone = $("#phone").val();

					$.ajax({
						type : "GET",
						url : "phoneCheck.do?phone=" + phone,
						cache : false,
						success : function(data) {
							if (data == "error") {
								alert("휴대폰 번호가 올바르지 않습니다.")
								$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
								$(".successPhoneChk").css("color", "red");
								$("#phone").attr("autofocus", true);
							} else {
								$("#phone2").attr("disabled", false);
								$("#phoneChk2").css("display", "inline-block");
								$(".successPhoneChk").text("인증번호 입력 후 인증확인을 눌러주세요.");
								$(".successPhoneChk").css("color", "green");
								$("#phone").attr("readonly", true);
								code2 = data;
							}
						}
					});
				});

		$("#phoneChk2").click(function() {
			if ($("#phone2").val() == code2) {
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color", "green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled", true);
				$('#host_phone').val($("#phone").val());
				$("#host_findform").attr("action", "host_find_pw_form.do?host_find=phone");
				$('#host_findform').submit();

			} else {
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successPhoneChk").css("color", "red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus", true);
			}
		});

	});
	
	
	$(function() {
		var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email = $("#email");
		$("#sendMail").on("click", function() {
			if (email == "") {
				alert("이메일을 입력하지 않았습니다.");
			} else {
				if (!(emailRegex.test(email.val()))) {
					alert("이메일 입력이 제대로 되지 않았습니다.");
					return false;
				}
				$.ajax({
					type : 'POST',
					url : 'email_Send',
					data : {
						email : email.val()
					},
					success : function(data) {
						if (data == 'ok') {
							alert("인증번호를 발송했습니다.");
							$("#emailCheck").removeAttr("disabled");
						} else {
							alert("인증번호가 발송되지 않았습니다.");
						}
					},
					error : function(request, status) {
						alert("오류가 발생했습니다.");
					}
				});
			}
		});
	});
//이메일인증
	function emailCheck() {
		var emailCheck = $("#emailCheck").val();
		if (emailCheck == "") {
			alert("인증번호를 입력하지 않았습니다.");
		} else {
			$.ajax({
				type : 'POST',
				url : 'email_Check',
				data : {
					emailCheck : emailCheck
				},
				success : function(data) {
					if (data == true) {
						alert("인증되었습니다.");
						$('#host_email').val($("#email").val());
						$("#host_findform").attr("action", "host_find_pw_form.do?host_find=email");
						$('#host_findform').submit();
					} else {
						alert("인증번호가 일치하지 않습니다.");
					}
				},
				error : function(request, status) {
					alert("오류가 발생했습니다.");
				}
			});
		}
	}
	
	//인증선택
	function emailconfig() {
		$('#config').show();
		$('#config1').hide();
	}
	function phoneconfig() {
		$('#config1').show();
		$('#config').hide();
	}
	
	// 비밀번호 재확인
	$(function() {
		$('#host_pw2').focusout(function() {
			if ($('#host_pw').val() != $('#host_pw2').val()) {
				alert("비밀번호재확인필요");

			} else {
				passwordCheck = true;
			}
		})
	})
	function change(){
		if(passwordCheck){
			$('#pwchange').submit();
		}
	}
</script>

</body>
</html>