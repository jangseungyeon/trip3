<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
Kakao.init('fb1c12c845e4f94116af70e4a7e21136'); //발급받은 키 중 javascript키를 사용해준다.
// console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  var account = response.kakao_account;
        	  console.log(response);
        	  console.log(response.id);
        	  console.log(account.profile.nickname);
        	  console.log(account.email);
        	  if(account.email==null||account.email==''){
        		  alert('이메일 동의 필수사항');
        		  kakaoLogout();
        	  }else{
        	  $('#kakao_id').val(response.id);
        	  $('#kakao_password').val(response.id);
        	  $('#kakao_email').val(account.email);
        	  $('#kakao_name').val(account.profile.nickname);
        	  document.querySelector('#kakao_form').submit();
        	  }
          },
          fail: function (error) {
            console.log(error);
          },
        })
      },
      fail: function (error) {
        console.log(error);
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response);
        },
        fail: function (error) {
          console.log(error);
        },
      })
      Kakao.Auth.setAccessToken(undefined);
    }
  }  
<%if(request.getParameter("fail")!=null){ %>
  alert("로그인실패");
  <%}
  %>
</script>
</head>
<body>

<!-- 카카오로그인폼 -->
<form action="kakao_login.do" id='kakao_form'>
<input name="user_id" id="kakao_id" type="hidden">
<input name="user_password" id="kakao_password" type="hidden">
<input name="user_name" id="kakao_name" type="hidden">
<input name="user_email" id="kakao_email" type="hidden">
</form>
<!-- 회원로그인 -->
<form action="user_login.do" method="post">
<input name="user_id" placeholder="아이디">
<input name="user_password" placeholder="비밀번호">
<button>로그인버튼</button>
</form>

<button onclick="kakaoLogin()">카카오 로그인</button>
<button onclick="kakaoLogout()">카카오 로그아웃</button>

							<a type="button" class="btn" id="naverIdLogin_loginButton" href="javascript:void(0)">네이버 로그인</a>
					<script
						src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
						charset="utf-8"></script>

					<script>
						var hostIndex = location.href.indexOf(location.host)
								+ location.host.length;
						var contextPath = location.href.substring(hostIndex,
								location.href.indexOf('/', hostIndex + 1));

						var naverLogin = new naver.LoginWithNaverId({
							clientId : "k1TZnT_MhISa1RyzPuW8", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
							callbackUrl : "http://localhost:8090/"
									+ contextPath + "/collback.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
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
									.open(
											"https://nid.naver.com/nidlogin.logout",
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
					<a href="user_find.jsp">아이디찾기</a><a href="user_pwfind.jsp">비밀번호찾기</a><a href="insert.jsp">회원가입</a>
</body>
</html>