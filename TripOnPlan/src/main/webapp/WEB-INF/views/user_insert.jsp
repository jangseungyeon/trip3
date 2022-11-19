<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<%@ include file="header.jsp"%>
<title>회원가입</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
<%if(request.getParameter("insert")!=null){%>
alert("계정생성에 실패했습니다");
<% 
   
} %>
// var idReg = /^[A-Za-z]{1}[A-Za-z0-9_]{5,11}$/g;   // 아이디
var idReg = /^([a-z | A-Z]{1})([A-Za-z0-9\_]{5,11})$/;   // 아이디
//영어 대소문자 1글자 뒤에는 영어대소문자숫자_까지5~11글자
var pwReg =/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
//영어 대소문자 특수문자 숫자 포함 8에서 16글자
var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일
var passwordCheck = false;//비밀번호재확인
var idCheck = false;//아이디 중복체크
var con=false;//인증
var idReg1=false;//아이디형식
var pwReg1=false;//비번형식
var emailRegex1=false;//이메일형식
//아이디 형식 설정
$(function() {
    $('#user_id').focusout(function() {
                   if (idReg.test($('#user_id').val()) == false)  {
                      $("#checkid").html('형식을 일치시켜주세요');
                      $("#checkid").attr('color', 'red');
                      idReg1=false;
                   } else{
                      $("#checkid").html('');
                      idReg1=true;

                   }
                });
 });
 
//비번 형식 설정
$(function() {
    $('#user_password').focusout(function() {
                   if (pwReg.test($('#user_password').val()) == false)  {
                      $("#checkpw").html('형식을 일치시켜주세요');
                      $("#checkpw").attr('color', 'red');
                      pwReg1=false;
                   } else{
                      $("#checkpw").html('');
                      pwReg1=true;

                   }
                });
 });
 
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
            con=true;
         } else {
            $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
            $(".successPhoneChk").css("color", "red");
            $("#phoneDoubleChk").val("false");
            $("#phone").attr("readonly", false);
            $(this).attr("autofocus", true);
         }
      });

   });
   
   
   
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
   //    아이디 중복체크
   $(function() {
      $('#idCheck').click(function() {
         if($('#user_id').val()!=''){
            
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
         }else{
            alert("아이디에 공백불가");
         }

      });
   });

   //회원가입버튼
   function check() {
      if(idReg1==false){
         $('#user_id').focus();
      }else if(pwReg1==false){
         $('#user_password').focus();
      }else if(con==false){
         alert("본인인증을 완료해주세요");
      }else if(idCheck==false){
         alert("아이디중복체크를 완료해주세요");
      }
      else{
         $('#user_insert').submit();
       }

    }
   
</script>

<style>

input {
    height: 45px;
    border-radius: 15px;
    border: 1px solid #aaa;
    padding: 12px;
    margin-top: 10px;
    }
    
    #phoneChk, button {
    margin: 15px 5px;
   color: white;
   border-radius: 7px;
   background-color: #ff8e15;
   border: none;
   width: 130px;
   height: 35px;
    }

</style>
</head>
<body class="d-flex flex-column min-vh-100">
<br>
<div class="container">
<div class="userinsert-div1">회원가입</div>
<hr class="userinsert-hr">


<form action="user_insertform.do" method="post" id="user_insert">
<table class="userinsert-table container">
<tr>
<th class="userinsert-th">아이디</th><td><input class="userinsert-input" type="text" name="user_id" id="user_id" placeholder='ID는 6~11자, 영문자로 시작, 영문자와 숫자만 가능합니다.'>
   <font id="checkid" size="2"></font>
   <button type="button" id="idCheck" class="userinsert-idbtn">아이디중복체크</button></td>
</tr>
<tr>
<th class="userinsert-th">비밀번호</th><td> <input class="userinsert-input" type="password" name="user_password"
      id="user_password" placeholder='영어 대소문자 특수문자 숫자 포함 8에서 16글자만 가능합니다'>
      <font id="checkpw" size="2"></font></td>
</tr>
<tr>
<th class="userinsert-th">비밀번호재확인</th><td><input class="userinsert-input" type="password" name="user_passwordCheck"
      id="user_passwordCheck" placeholder='비밀번호재확인'></td>
</tr>
<tr>
<th class="userinsert-th">이름</th><td><input class="userinsert-input" type="text" name="user_name" placeholder='이름'></td>
</tr>
<tr>
<th class="userinsert-th">핸드폰</th><td><input class="userinsert-input" type="hidden" name="user_phone" id="user_phone" placeholder='하이픈(-)을 제외하고 입력해주세요.'>
<div id="config1">
   <input id="phone" type="text" name="phone" title="전화번호 입력" class="userinsert-input" /> <button type="button" id="phoneChk" class="doubleChk userinsert-input">인증번호 보내기</button>

      
</div>
</td>
</tr>
<tr>
<th></th><td><input   id="phone2" type="text" name="phone2" title="인증번호 입력" disabled /><button type="button" id="phoneChk2" class="doubleChk userinsert-input">인증확인</button><br><span class="point successPhoneChk" style="font-size: 12px; color:green;">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span> <input
      type="hidden" id="phoneDoubleChk" /> </td>
</tr>   
<tr>
<th class="userinsert-th">이메일</th><td><input class="userinsert-input" type="text" name="user_email" id="user_email" placeholder='예) 1018@triponplan.com'></td>
</tr>
   <tr>
   <th></th><td><button type="button" class="submitbutton userinsert-insertbtn" onclick="check()">회원가입</button>
   <button type="reset" class="submitbutton userinsert-resetbtn">되돌리기</button></td>
   
   </tr>
   </table>
</form>
</div>



<%@ include file="footer.jsp"%>
</body>

</html>