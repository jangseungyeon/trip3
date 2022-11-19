<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<%@ include file="host_login_header.jsp"%>


<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=B612:wght@700&family=Do+Hyeon&family=RocknRoll+One&display=swap');
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

</style>



</head>
<body>


<br><br>

<div align=center><br>
<div align=center>
<span class="main-div2" style="font-size:60px; line-height:40%;">tripONplan</span>
<br><span style="color:#19558c; font-size:30px"><br>호스트 아이디 찾기</span><br>
</div>


<div align=center style="width:50%" class="host-find-id">
<input type='radio' name='findId' value='email' onclick='emailconfig()'>이메일로 찾기 &nbsp;&nbsp; 
<input type='radio' name='findId' value='phone' onclick='phoneconfig()'>휴대폰으로 찾기

	<!-- 회원찾을때 넘어가 form태그 -->
	<form action="" method="post" id="host_findform">
		<input type="hidden" name="host_phone" id="host_phone"> <input
			type="hidden" name="host_email" id="host_email">
	</form>


	<div id="config" style="display: none">
		<input id="email" class="input1" type="text" placeholder="이메일을 입력해주세요." required autofocus>
		<button id="sendMail" type="button" class='sub1'>발송하기</button>
		<input id='emailCheck' type='text' class='input1' required disabled>
		<button id='check' onclick='emailCheck()' type="button" class='sub1'>인증확인</button>
	</div>
	<div id="config1" style="display: none">
		<input id="phone" type="text" name="phone" title="전화번호 입력" class="input1" placeholder="휴대폰 번호를 입력해주세요.">
		<span id="phoneChk" class="sub1">발송하기</span> <br>
		<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled class="input1">
		<span id="phoneChk2" class="sub1">인증확인</span><br>
		<span class="point successPhoneChk"></span>
		<input type="hidden" id="phoneDoubleChk">
	</div>


</div>
</div>


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
								$(".successPhoneChk").text(
										"인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
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
				$("#host_findform").attr("action", "host_find_id_form.do?host_find=phone");
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
						$("#host_findform").attr("action",
								"host_find_id_form.do?host_find=email");
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
</script>

	<%
	String pullid = (String) request.getAttribute("host");
String subid;//보여질아이디
String sub;//별처리될아이디
int length;//보여질갯수

	if (pullid != null) {
		 length = pullid.length() / 2;
		subid=pullid.substring(0,length);
	%>
	<%=subid%><%for(int i=0;i<pullid.length()-length;i++){%>*<%} %>
	<%
	}
	%>

<script>
function getEmail(event){
	$('#config').show();
	$('#config1').hide();
}
function getEmail(event){
	$('#config').hide();
	$('#config1').show();
}
</script>

</body>
</html>