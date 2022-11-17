<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기/비밀번호찾기</title>
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

		$("#phoneChk2").click(
				
				function() {
					var phoneCheck = $("#phone2").val();
					if (phoneCheck == "") {
						alert("인증번호를 입력하지 않았습니다.");
					}
					else if ($("#phone2").val() == code2) {
						$(".successPhoneChk").text("인증번호가 일치합니다.");
						$(".successPhoneChk").css("color", "green");
						$("#phoneDoubleChk").val("true");
// 						$("#phone2").attr("disabled", true);
						$('#user_phone').val($("#phone").val());
						$("#user_findform").attr("action",
								"user_findform.do?find=phone");
						$('#user_findform').submit();

					} else {
// 						$(".successPhoneChk").text(
// 								"인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
// 						$(".successPhoneChk").css("color", "red");
                        alert("인증번호가 일치하지 않습니다.");
						$("#phoneDoubleChk").val("false");
						$(this).attr("autofocus", true);
						location.href="user_find.do";
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
								"user_findform.do?find=email");
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
<style>
#emailconfig, #phoneconfig {
	color: white;
	border-radius: 7px;
	width: 100px;
	height: 40px;
	background-color: #ff8e15;
	border: none;
}

#emailconfig:hover, #phoneconfig:hover {
	background-color: #ff8e15;
	color: white;
}
.config_div{
text-align:center;
}
/* 아이디찾기 텍스트 */
.idfind {
	font-size: 40px;
	background-color: #ff8e15;
	border-radius: 15px;
	padding: 5px 20px;
	color: white;
	box-sizing: border-box;
}
/* 아이디찾기 인증배경 */
.login_back {
	padding: 25px;
	border: 5px solid #19558c;
	width: 90%;
	margin: 25px auto;
	text-align: center;
	border-radius: 8px;
	height: 300px;
}
/* 이메일,전화번호 인증버튼 */
#emailconfig, #phoneconfig {
	width: 180px;
}
/* 이메일인증 인풋창,전화번호인증 인풋창 */
input#email, #emailCheck,input#phone,input#phone2 {
	width: 380px;
	height: 45px;
	border-radius: 15px;
	margin: 15px;
	border: 1px solid #aaa;
	padding: 12px;
}
/* 이메일인증버튼,전화번호버튼 */
#sendMail, #check,#phoneChk,#phoneChk2{
	margin: auto 0;
	color: white;
	border-radius: 7px;
	background-color: #ff8e15;
	border: none;
	width: 90px;
	height: 35px;
}
</style>
</head>
<body style="padding-top: 57px; background-color: #f9fcff; height: 100vh">
	<div class="vh">

		<div class="container mx-auto" id="container">
			<br> <br>
			<div class="idfind">아이디 찾기</div>
			<hr style="border: solid 1px #19558c;">

			<!-- 회원찾을때 넘어가 form태그 -->
			<form action="user_findform.do" method="post" id="user_findform">
				<input type="hidden" name="user_phone" id="user_phone"> <input
					type="hidden" name="user_email" id="user_email">
			</form>
			
			<div class="row config_div">
				<div class="col-6">
					<button type="button" id="emailconfig" onclick="emailconfig()">이메일
						인증하기</button>
				</div>
				<div class="col-6">
					<button type="button" id="phoneconfig" onclick="phoneconfig()">전화번호
						인증하기</button>
				</div>

			</div>
			<div class="login_back">
				<div id="config">
					<h4>이메일 인증</h4>
					<div class="row">
						<div class="col-3"></div>
						<input id="email" class="text_box" type="text"
							placeholder="이메일 입력" required autofocus>
						<button id="sendMail" class="btn btn-primary btn-sm" type="button">발송하기</button>
					</div>
					<div class="row">
						<br>
						<div class="col-3"></div>
						<input id='emailCheck' class='text_box' type='text' required
							disabled>
						<button id='check' class='btn btn-primary btn-sm'
							onclick='emailCheck()' type="button">인증확인</button>
					</div>
				</div>
				<div id="config1" style="display: none">
					<h4>전화번호 인증</h4>
					<div class="row">
						<div class="col-3"></div>
					<input id="phone" type="text" name="phone" title="전화번호 입력" placeholder="전화번호 입력" /> <button
						id="phoneChk" class="doubleChk">발송하기</button></div>
						<div class="row">
						<br>
						<div class="col-3"></div> <input
						id="phone2" type="text" name="phone2" title="인증번호 입력" disabled />
					<button id="phoneChk2" class="doubleChk">인증확인</button> <input
						type="hidden" id="phoneDoubleChk" />
				</div>
				</div>
				<div>
									<c:forEach items="${user}" var="vo1">
									회원아이디 : ${vo1.user_id}<br>
									</c:forEach>
				</div>

				<%
				// 				String pullid = (String) request.getAttribute("user");
				// 				String subid;//보여질아이디
				// 				String sub;//별처리될아이디
				// 				int length;//보여질갯수

				// 				if (pullid != null) {
				// 					length = pullid.length() / 2;
				// 					subid = pullid.substring(0, length);
				%>
				<%-- 				<%=subid%> --%>
				<%
				// 				for (int i = 0; i < pullid.length() - length; i++) {
				%>
				<!-- 				* -->
				<%
				// 				}
				%>
				<%
				// 				}
				%>
			</div>
		</div>
	</div>

</body>
</html>