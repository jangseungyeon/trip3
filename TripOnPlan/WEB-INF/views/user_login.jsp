<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script>
	Kakao.init('fb1c12c845e4f94116af70e4a7e21136'); //발급받은 키 중 javascript키를 사용해준다.
	// console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						var account = response.kakao_account;
						console.log(response);
						console.log(response.id);
						console.log(account.profile.nickname);
						console.log(account.email);
						if (account.email == null || account.email == '') {
							alert('이메일 동의 필수사항');
							kakaoLogout();
						} else {
							$('#kakao_id').val(response.id);
							$('#kakao_password').val(response.id);
							$('#kakao_email').val(account.email);
							$('#kakao_name').val(account.profile.nickname);
							document.querySelector('#kakao_form').submit();
						}
					},
					fail : function(error) {
						console.log(error);
					},
				})
			},
			fail : function(error) {
				console.log(error);
			},
		})
	}
	//카카오로그아웃  
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response);
				},
				fail : function(error) {
					console.log(error);
				},
			})
			Kakao.Auth.setAccessToken(undefined);
		}
	}
<%if (request.getParameter("fail") != null) {%>
	alert("로그인실패");
<%}%>
	
</script>
<style>
/* 로그인버튼 */
.user_loginbutton {
	margin: auto 0;
	color: white;
	border-radius: 7px;
	background-color: #ff8e15;
	border: none;
	width: 90px;
	height: 35px;
}

#user_id, #user_password {
	width: 300px;
	padding: 15px;
	margin: 10px;
	border-radius: 20px;
	height: 40px;
	border:1px solid black;
}


/* 로그인폼 */
.user_loginForm {
	text-align: center;
	margin-top: 150px;
}
/* 카카오이미지둥글게 */
.kakao_img {
	border-radius: 150px;
}
/* 이미지크기 */
img {
	width: 40px;
}
/* a태그 밑줄 */
a.find {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>

	<!-- 카카오로그인폼 -->
	<form action="kakao_loginform.do" id='kakao_form' method="post">
		<input name="user_id" id="kakao_id" type="hidden"> <input
			name="user_password" id="kakao_password" type="hidden"> <input
			name="user_name" id="kakao_name" type="hidden"> <input
			name="user_email" id="kakao_email" type="hidden">
	</form>
	<div class="user_loginForm">
		<!-- 회원로그인 -->
		<form action="user_loginform.do" method="post">
			<input name="user_id" id="user_id" placeholder=" 아이디"><br>
			<input type="password" name="user_password" id="user_password" placeholder=" 비밀번호"><br>
			<button class="user_loginbutton">로그인</button>
		</form>
		<br>
		<br> <a class="find" href="user_find.do">아이디 찾기</a>&nbsp;|&nbsp; <a
			class="find" href="user_pwfind.do">비밀번호 찾기</a>&nbsp;|&nbsp; <a
			class="find" href="step1.do">회원가입</a><br>
		<br> <span> <img src="resources/img/kakao_icon.png"
			onclick="kakaoLogin()" class="kakao_img">&nbsp;&nbsp; <a
			id="naverIdLogin_loginButton" href="javascript:void(0)"><img
				src="resources/img/naver_icon.png" class="naver_img"></a><br>
			<small>카카오</small>&nbsp;&nbsp; <small>네이버</small>
		</span>

		<!-- 	<img src="../resources/img/kakao_icon.png"> 나중경로-->
		<script
			src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
			charset="utf-8"></script>

		<script>
			var hostIndex = location.href.indexOf(location.host)
					+ location.host.length;
			var contextPath = location.href.substring(hostIndex, location.href
					.indexOf('/', hostIndex + 1));

			var naverLogin = new naver.LoginWithNaverId({
				clientId : "k1TZnT_MhISa1RyzPuW8", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl : "http://triponplan.ga/" + contextPath
						+ "/collback.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup : false,
				callbackHandle : true
			});

			naverLogin.init();

			window.addEventListener('load', function() {
				naverLogin.getLoginStatus(function(status) {
					if (status) {
						console.log(naverLogin.user);
						var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
						var name = naverLogin.user.getName();

						console.log(naverLogin.user);

						if (email == undefined || email == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						}
						if (name == undefined || name == null) {
							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
							naverLogin.reprompt();
							return;
						}
					} else {
						console.log("callback 처리에 실패하였습니다.");
					}
				});
			});

			var testPopUp;
			function openPopUp() {
				testPopUp = window
						.open("https://nid.naver.com/nidlogin.logout",
								"_blank",
								"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
			}
			function closePopUp() {
				testPopUp.close();
			}

			function naverLogout() {
				openPopUp();
				setTimeout(function() {
					closePopUp();
				}, 1000);

			}
		</script>

	</div>
</body>
</html>