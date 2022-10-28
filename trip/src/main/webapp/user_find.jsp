<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기/비밀번호찾기</title>
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
				$('#user_phone').val($("#phone").val());
				$("#user_findform").attr("action", "user_find.do?find=phone");
				$('#user_findform').submit();

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
						$('#user_email').val($("#email").val());
						$("#user_findform").attr("action",
								"user_find.do?find=email");
						$('#user_findform').submit();
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

</head>
<body>
	<h3>전화번호인증하기</h3>
	<!-- 회원찾을때 넘어가 form태그 -->
	<form action="" method="post" id="user_findform">
		<input type="hidden" name="user_phone" id="user_phone"> <input
			type="hidden" name="user_email" id="user_email">
	</form>

	<button type="button" id="emailconfig" onclick="emailconfig()">이메일
		인증하기</button>
	<button type="button" id="phoneconfig" onclick="phoneconfig()">전화번호
		인증하기</button>


	<div id="config" style="display: none">
		<input id="email" class="text_box" type="text" placeholder="이메일 입력"
			required autofocus>
		<button id="sendMail" class="btn btn-primary btn-sm" type="button">발송하기</button>
		<input id='emailCheck' class='text_box' type='text' required disabled>
		<button id='check' class='btn btn-primary btn-sm'
			onclick='emailCheck()' type="button">인증확인</button>
	</div>
	<div id="config1" style="display: none">
		<input id="phone" type="text" name="phone" title="전화번호 입력" /> <span
			id="phoneChk" class="doubleChk">인증번호 보내기</span> <br /> <input
			id="phone2" type="text" name="phone2" title="인증번호 입력" disabled /> <span
			id="phoneChk2" class="doubleChk">인증확인</span> <span
			class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> <input
			type="hidden" id="phoneDoubleChk" />
	</div>
	<%
	String pullid = (String) request.getAttribute("user");
String subid;//보여질아이디
String sub;//별처리될아이디
int length;//보여질갯수
	if (pullid != null) {
		 length = pullid.length() / 2;
		subid=pullid.substring(0,length);
	%>
	<%=subid%><%for(int i=0;i<length;i++){%>*<%} %>
	<%
	}
	%>
</body>
</html>