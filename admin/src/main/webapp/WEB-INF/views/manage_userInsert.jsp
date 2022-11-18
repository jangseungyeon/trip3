<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="header.jsp"%>
<meta charset="utf-8">
<title>회원가입</title>
<style>
input {
	height: 45px;
	border-radius: 15px;
	border: 1px solid #aaa;
	padding: 12px;
	margin-top: 20px;
}

#phoneChk, button {
	margin: 10px 5px;
	color: white;
	border-radius: 7px;
	background-color: #19558c;
	border: none;
	width: 130px;
	height: 35px;
}

button.submitbutton {
	margin-top: 30px;
}
</style>
<script>
	
<%if (request.getParameter("manage_userInsert") != null) {%>
	alert("계정생성에 실패했습니다");
<%}%>
	var idReg = /^[A-za-z0-9]{6,12}$/g; // 아이디
	var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; // 비밀번호 
	var passwordCheck = false;//비밀번호재확인
	var idCheck = false;//아이디 중복체크
	var con = false;//인증
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
				con = true;
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
						// 						$('#user_email').val($("#email").val());
						con = true;
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

	// 비밀번호 재확인
	$(function() {
		$('#user_passwordCheck').focusout(function() {
			console.log($('#user_passwordCheck').val());
			if ($('#user_passwordCheck').val() != $('#user_password').val()) {
				alert("비밀번호재확인필요");

			} else {
				passwordCheck = true;
			}
		})
	})
	// 	아이디 중복체크
	$(function() {
		$('#idCheck').click(function() {
			if ($('#user_id').val() != '') {

				$.ajax({
					url : "user_idCheck.do",
					type : "post",
					data : {
						user_id : $('#user_id').val()
					},
					cache : false,
					success : function(result) {
						console.log(result);
						if (result == 0) {
							alert("아이디사용가능");
							idCheck = true;
						} else if (result == 1) {
							alert("아이디존재");
						} else {
							alert("그외");
						}
					},
					error : function() {
						alert("서버요청실패");
					}
				});
			} else {
				alert("아이디에 공백불가");
			}

		});
	});

	//회원가입버튼
	function check() {
		// 		if(!idReg.test($('#user_id').val())){
		// 			alert('아이디는 영어대/소문자 6~12자리만');
		// 		}else if(!pwReg.test($('#user_password').val())){
		// 			alert('비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합');
		// 		}
		// 		else if (idCheck == false) {
		// 			alert("아이디중복체크하세요");
		// 		}
		// 		else if (passwordCheck == false) {
		// 			alert("비밀번호재확인필요");
		// 		}else if(con==false){
		// 			alert("인증필요");
		// 		}else{
		$('#manage_userInsert').submit();
		// 		}

	}
	// 	//인증선택
	// 	function emailconfig() {
	// 		$('#config').show();
	// 		$('#config1').hide();
	// 	}
	// 	function phoneconfig() {
	// 		$('#config1').show();
	// 		$('#config').hide();
	// 	}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="purple">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="manage_main.do" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="manage_main.do">
							<i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>호스트
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> 회원 관리 </a>
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">${manage_id}님 접속중</span>
							</a></li>
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Account</span> -->
<!-- 							</a></li> -->
							<li class="nav-item"><a class="nav-link"
								href="manage_logout.do"> <span class="no-icon">Log
										out</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">

					<div class="userInsert-div1">회원가입</div>
					<hr class="userInsert-hr">
					<form action="manage_userInsert.do" method="post"
						id="manage_userInsert">

						<table class="userInsert-table container">
							<tr>
								<th class="userInsert-th">아이디</th>
								<td><input type="text" name="user_id" id="user_id"
									placeholder='아이디' required>
									<button type="button" id="idCheck">아이디중복체크</button></td>
							</tr>
							<tr>
								<th class="userInsert-th">비밀번호</th>
								<td><input type="password" name="user_password"
									id="user_password" placeholder='비밀번호' required></td>
							</tr>
							<tr>
								<th class="userInsert-th">비밀번호</th>
								<td><input type="password" name="user_passwordCheck"
									id="user_passwordCheck" placeholder='비밀번호 재확인' required></td>
							</tr>
							<tr>
								<th class="userInsert-th">이름</th>
								<td><input type="text" name="user_name" id="user_name"
									placeholder='이름' required></td>
							</tr>
							<tr>
								<th class="userInsert-th">핸드폰</th>
								<td><input type="text" name="user_phone" id="user_phone"
									placeholder='핸드폰' required></td>
							</tr>
							<tr>
								<th class="userInsert-th">이메일</th>
								<td><input type="text" name="user_email" id="user_email"
									placeholder='이메일' required></td>
							</tr>
							<tr>
								<th></th>
								<td><button type="button" class="submitbutton"
										onclick="check()">회원가입</button>
									<button type="reset" class="submitbutton userInsert-resetbtn">초기화</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>