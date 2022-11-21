<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<%@ include file="../header.jsp"%>

<title>정보수정</title>
</head>
<body class="info-body d-flex flex-column min-vh-100">
<div class="footer-div">
	<script>
		$(function() {
			if (check == null) {
				var check1 = prompt("비밀번호를 입력해주세요");
				$(".checkuser_password").val(check1);
			}
		});
		function deletecheck() {
			var deletecheck = prompt("탈퇴를 원하시면 아래 문구를 입력해주세요.\n'회원탈퇴'");
			if (deletecheck == "회원탈퇴") {
				location.href="delete.do";
			} else {
				alert("문구가 일치하지 않습니다.");
			}

		}

		var formCheck1 = true;
		var formCheck2 = true;
		var formCheck3 = true;
		var formCheck4 = true;
		var formCheck5 = true;
		var formCheck6 = true;
		var blank_pattern = /[*\s*]/g;
		var special_pattern = /[\W]/gi;
		//    var phone_pattern = /^\d{4}$/;
		// 	var phone_pattern = /^\d{3}\d{4}\d{4}$/;
		var phone_pattern = /^010-?([0-9]{4})-?([0-9]{4})$/;
		var birth_pattern = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		//    var email_pattern = /^[a-z0-9.\-_]+@([a-z0-9-]+\.)+[a-z]{2,6}$/;	 
		var email_pattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		// 	 우편번호 찾기  
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = '';
							var extraAddr = '';

							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		//형식 설정
		$(function() {
			$('#pw2,#pw')
					.focusout(
							function() {

								if (document.joinform.pw.value != document.joinform.pw2.value) {
									$("#checkPw").html('비밀번호가 동일하지 않습니다.');
									$("#checkPw").attr('color', 'red');
									formCheck2 = false;
								} else if (document.joinform.pw.value == document.joinform.pw2.value) {
									$("#checkPw").html('');
									formCheck2 = true;

								}
							});
		});

		$(function() {
			$('#phone').focusout(
					function() {

						if (phone_pattern.test($('#phone').val()) == false) {
							$("#checkphone").html(
									'전화번호의 형식이 올바르지 않습니다<br>예)01012345678');
							$("#checkphone").attr('color', 'red');
							formCheck3 = false;
						} else {
							$("#checkphone").html('');
							formCheck3 = true;
						}
					});
		});

		$(function() {
			$('#birth')
					.focusout(
							function() {
								if ($('#birth').val() != "") {
									if (birth_pattern.test($('#birth').val()) == false) {
										$("#checkbirth")
												.html(
														'생년월일 형식이 올바르지 않습니다<br>예)2000-11-22');
										$("#checkbirth").attr('color', 'red');
										formCheck5 = false;
									} else {
										$("#checkbirth").html('');
										formCheck5 = true;
									}
								}
							});
		});

		$(function() {
			$('#email')
					.focusout(
							function() {
								if ($('#email').val() != "") {
									if (email_pattern.test($('#email').val()) == false) {
										$("#checkemail")
												.html(
														'이메일 형식이 올바르지 않습니다<br>예)email@naver.com');
										$("#checkemail").attr('color', 'red');
										formCheck6 = false;
									} else {
										$("#checkemail").html('');
										formCheck6 = true;
									}
								}
							});
		});

		$(function() {
			$('#email').focus(function() {
				$("#checkemail").html('');
				formCheck6 = true;
			});
		});
		$(function() {
			$('#birth').focus(function() {
				$("#checkbirth").html('');
				formCheck5 = true;
			});
		});

		// 형식 체크 & 수정완료
		function checkForm() {
			if ($('#pw').val() == "") {
				$("#checkPw").html('비밀번호를 입력해주세요');
				$("#checkPw").attr('color', 'red');
			} else if ($('#name').val() == "") {
				$("#checkName").html("이름은 필수 입력창입니다");
				$("#checkName").attr('color', 'red');
			} else if (formCheck2 && formCheck3 && formCheck5 && formCheck6) {
				// 		   document.joinform.action = "user_update.do";
				// 		   document.joinform.method = "post";
				document.joinform.submit();

			} else {
				alert("형식을 다시 확인해주세요.");
			}
		}

		// 핸드폰 번호 바꾸기
		function phonec() {

			$("#phoneChk").show();
			$("#phone-c").hide();
			$("#phone").removeAttr("readOnly");

		};

		// 핸드폰번호인증

		var con = false;//인증
		//휴대폰
		$(function phonecheck() {
			//휴대폰 번호 인증 
			var code2 = "";
			
			
			$("#phoneChk").click(
					
							
								
							function() {
								var inputphone = document.getElementById('phone').value
								if(phone_pattern.test(inputphone) == false){
									alert("형식이 올바르지 않습니다.")
								} else if(inputphone==${user_phone}){
									alert("번호가 동일합니다.")
								} else { 
								
								alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
								$('#config1').show();
								$('#config').hide();
								var phone = $("#phone").val();

								$
										.ajax({
											type : "GET",
											url : "phoneCheck.do?phone="
													+ phone,
											cache : false,
											success : function(data) {
												if (data == "error") {
													alert("휴대폰 번호가 올바르지 않습니다.")
													$(".successPhoneChk").text(
															"유효한 번호를 입력해주세요.");
													$(".successPhoneChk").css(
															"color", "red");
													$("#phone").attr(
															"autofocus", true);
												} else {
													$("#phone2").attr(
															"disabled", false);
													$("#phoneChk2").css(
															"display",
															"inline-block");
													$(".successPhoneChk")
															.text(
																	"인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
													$(".successPhoneChk").css(
															"color", "green");
													$("#phone").attr(
															"readonly", true);
													code2 = data;
												}
											}
										});
							}
							}		
					);

			$("#phoneChk2").click(
					function() {
						if ($("#phone2").val() == code2) {
							$(".successPhoneChk").text("인증번호가 일치합니다.");
							$(".successPhoneChk").css("color", "green");
							$("#phoneDoubleChk").val("true");
							$("#phone2").attr("disabled", true);
							$("#phone").attr("readonly", true);
							$("#phoneChk").hide();
							$("#phone-c").show();
							$('#user_phone').val($("#phone").val());
							con = true;
						} else {
							$(".successPhoneChk").text(
									"인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
							$(".successPhoneChk").css("color", "red");
							$("#phoneDoubleChk").val("false");
							$(this).attr("autofocus", true);
						}
					});

		});

		// 인증 선택
		function phoneconfig() {
			$('#config1').show();
			$('#config').hide();
		};
			//이메일 주소 바꾸기
			function emailc() {

				$("#sendMail").show();
				$("#email-c").hide();
				$("#email").removeAttr("readOnly");

			};

			//이메일 인증
			$(function() {
				var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var email = $("#email");
				
				
				
					 
					
// 				let myStr = '${user_email}';
// 				myStr = myStr.replace("@", "");
				
				
				
				$("#sendMail").on("click", function() {
					var inputemail = document.getElementById('email').value
					if(email_pattern.test(inputemail) == false){
						alert("형식이 올바르지 않습니다.")
					} else if(inputemail=='${user_email}'){
						alert("메일이 동일합니다.")
					} else { 
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
									$('#config1').hide();
									$('#config').show();
								} else {
									alert("인증번호가 발송되지 않았습니다.");
								}
							},
							error : function(request, status) {
								alert("오류가 발생했습니다.");
							}
						});
					
					
					}}
				});
			});

			//이메일인증
			function emailC() {
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
								$("#email").attr("readonly", true);
								$("#emailCheck").attr("readonly", true);
								$("#sendMail").hide();
								$("#email-c").show();
								
							} else {
								alert("인증번호가 일치하지 않습니다.");
							}
						},
						error : function(request, status) {
							alert("오류가 발생했습니다.");
						}
					});
				}
			};
		
	</script>

<br><br>
<div class="container">
<div class="myinfo-div1">내 정보 수정</div>
<hr class="myinfo-hr">
<br><br>

<div class="container">
<form class="validation-form" action="user_update.do" method="post"
					name="joinform">
	<table class="myinfo-table">
	<tr>
	<th id="myinfo-th">아이디</th><td id="myinfo-td"><input type="text"
							class="form-control" name="user_id" id="id" value="${user_id}"
							readonly></td>
	</tr>
	<tr></tr>
	<tr>
	<th id="myinfo-th">이름</th><td id="myinfo-td"><input type="text"
							class="form-control" id="name" name="user_name"
							value="${user_name}" required></td>
	</tr>
	<tr>
	<th id="myinfo-th">주소</th><td id="myinfo-td"> <input type="text"	id="sample6_postcode" name="postcode" placeholder="우편번호"
							value="${aarr[0]}" style="display: none">
							<input type="text" id="sample6_address" placeholder="주소"
							name="user_address1" value="${user_address1}">
							
							<input type="text" id="sample6_extraAddress" placeholder="참고항목"
							style="display: none">
							</td>
	</tr>
	<tr>
	<th id="myinfo-thnone"></th><td><input type="text" id="sample6_detailAddress" placeholder="상세주소"
							name="user_address2" value="${user_address2}">
							<input type="button" class="adbtn" onclick="sample6_execDaumPostcode()" value="주소 찾기">
							</td>
	</tr>
	
	<tr>
	<th id="myinfo-th">연락처</th><td id="myinfo-td"><input type="text"
							class="form-control info-phone" name="user_phone" id="phone"
							value="${user_phone}" readonly>
							<input id="phone-c"
							type="button" onclick="phonec()" value="번호 변경하기"><input
							id="phoneChk" type="button" style="display: none" value="인증하기">
						<font id="checkphone" size="2"></font>
						<div id="config1" style="display: none">
							<input id="phone2" type="text" name="phone2" title="인증번호 입력">
							<input id="phoneChk2" class="doubleChk" type="button"
								value="인증확인"> <span class="point successPhoneChk"></span></div>
							</td>
	</tr>
	
	<tr>
	<th id="myinfo-th">생년월일</th><td id="myinfo-td"><input type="date"
							class="form-control" id="birth" name="user_birth"
							value="${user_birth}"> <font id="checkbirth" size="2"></font></td>
	</tr>
	<tr>
	<th id="myinfo-th">성별</th><td id="myinfo-td"><input type="text"
							class="form-control" id="gender" name="user_gender"
							value="${user_gender}"> </td>
	</tr>
	<tr>
	<th id="myinfo-th">이메일</th><td id="myinfo-td"><input type="email" class="form-control" id="email" name="user_email" required value="${user_email}" readOnly>
						<input id="email-c" type="button" onclick="emailc()" value="메일 변경하기">
						<input id="sendMail" type="button" style="display: none" value="인증하기">
						<br><font id="checkemail" size="2"></font>
						<div id="config" style="display: none">
							<input id="emailCheck" type="text" name="emailCheck" title="인증번호 입력">
							<button id="verifyEmailConfirm" type="button" onclick="emailC()">인증확인</button>
							<span class="point successEmailChk"></span>
						</div></td>
	</tr>
	</table>
	<button class="btn btn-lg btn-block" type="button" id="cbtn"
						onclick="checkForm()">수정 완료</button>
					<button id="dbtn" class="btn btn-lg btn-block" type="button"
						onclick="deletecheck()">탈퇴 하기</button>
	</form>
	</div>
	</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>

</html>