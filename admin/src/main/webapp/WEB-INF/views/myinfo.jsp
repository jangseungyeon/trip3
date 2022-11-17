<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.user.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="header.jsp"%>
</head>
<body class="info-body">
	<script>
function deletecheck(){
    var deletecheck = prompt("탈퇴를 원하시면 아래 문구를 입력해주세요.\n'회원탈퇴'");
       if(deletecheck == "회원탈퇴"){
         	 location.href="delete.do";

       }
       else{
         alert("문구가 일치하지 않습니다.");
       }
       
       }


var formCheck1=true;
var formCheck2=true;
var formCheck3=true;
var formCheck4=true;
var formCheck5=true;
var formCheck6=true;
   var blank_pattern = /[*\s*]/g;
   var special_pattern = /[\W]/gi;
//    var phone_pattern = /^\d{4}$/;
	var phone_pattern = /^\d{3}\d{4}\d{4}$/;
//    var phone_pattern = /^010-?([0-9]{4})-?([0-9]{4})$/;
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
                            + data.buildingName : data.buildingName);
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
 


$(function() {
    $('#pw2,#pw')
          .focusout(
                function() {

                   if (document.joinform.pw.value != document.joinform.pw2.value) {
                      $("#checkPw").html('비밀번호가 동일하지 않습니다.');
                      $("#checkPw").attr('color', 'red');
                      formCheck2=false;
                   } else if (document.joinform.pw.value == document.joinform.pw2.value) {
                      $("#checkPw").html('');
                      formCheck2=true;

                   }
                });
 });
$(function() {
    $('#phone').focusout(function() {
    
    if (phone_pattern.test($('#phone').val()) == false) {
          $("#checkphone").html('전화번호의 형식이 올바르지 않습니다<br>예)01012345678');
          $("#checkphone").attr('color', 'red');
          formCheck3=false;
       } else {
          $("#checkphone").html('');
          formCheck3=true;
       }
    });
 });

$(function() {
    $('#birth').focusout(function() {
       if($('#birth').val()!=""){
       if (birth_pattern.test($('#birth').val()) == false) {
          $("#checkbirth").html('생년월일 형식이 올바르지 않습니다<br>예)2000-11-22');
          $("#checkbirth").attr('color', 'red');
          formCheck5=false;
       } else {
          $("#checkbirth").html('');
          formCheck5=true;
       }}
    });
 });
 $(function() {
	      $('#email').focusout(
	            function() {
	               if($('#email').val()!=""){
	               if (email_pattern.test($('#email').val()) == false) {
	                  $("#checkemail").html(
	                        '이메일 형식이 올바르지 않습니다<br>예)email@naver.com');
	                  $("#checkemail").attr('color', 'red');
	                  formCheck6=false;
	               } else {
	                  $("#checkemail").html('');
	                  formCheck6=true;
	               }
	               }
	            });
	   });
	   $(function() {
		      $('#email').focus(
		            function() {
		            	$("#checkemail").html('');
		                  formCheck6=true;
		            });
		   });
	   $(function() {
		      $('#birth').focus(
		            function() {
		            	$("#checkbirth").html('');
		                  formCheck5=true;
		            });
		   });
	   
	     
	   
// 	   function checkForm() {
// 		    if ($('#pw').val() == "") {
// 		      $("#checkPw").html('비밀번호를 입력해주세요');
// 		      $("#checkPw").attr('color', 'red');
// 		   } else if ($('#name').val() == "") {
// 		      $("#checkName").html("이름은 필수 입력창입니다");
// 		      $("#checkName").attr('color', 'red');
// 		   } else if ($('#phone').val() == "") {
// 		      $("#checkPhone").html("전화번호는 필수 입력창입니다");
// 		      $("#checkPhone").attr('color', 'red');
// 		   } else if ($('#adderss1').val() == "") {
// 		      $("#checkadderss").html("주소는 필수 입력창입니다");
// 		      $("#checkadderss").attr('color', 'red');
// 		   } else if ($('#adderss2').val() == "") {
// 		      $("#checkadderss").html("주소는 필수 입력창입니다");
// 		      $("#checkadderss").attr('color', 'red');
// 		   } else if(formCheck2&&formCheck5&&formCheck6){
// 		      $('.btn-block').attr('type', 'submit');
<%-- 		      <%String val = request.getParameter("update");%> --%>
<%-- 		      <%try { --%>
<%-- 		if (val.equals("1")) {%> --%>
// 		        alert("수정이 완료 되었습니다.");
<%-- 		         <%} else {%> --%>
// 		         alert("수정 프로세스에 문제가 있습니다.");   
		            
<%-- 		         <%} --%>
// 		} catch (Exception e) {
// //		          System.out.println("어딘가 문제가 있습니다. ");
<%-- 		}%> --%>
// 		   }else{
// 		      alert("형식을 다시 확인해주세요.");
// 		   }
// 		}




</script>




	<c:set var="address" value="${UserDTO.getAddress()}" />
	<c:set var="aarr" value="${fn:split(address,'/')}" />

	<div class="container info-div">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">My Info</h4>
				<br> <br>

				<form class="validation-form" action="user_update.do" method="post"
					name="joinform">

					<div class="mb-3">
						<label for="id">아이디</label> <input type="text"
							class="form-control" name="user_id" id="id" value="${user_id}"
							readonly>
					</div>

					<div class="mb-3">
						<label for="pw">비밀번호</label> <input type="password"
							class="form-control" name="user_password" id="pw"
							value="${user_password}" minlength="8" maxlength="16" required>
					</div>

					<div class="mb-3">
						<label for="pw2">비밀번호 확인</label> <input type="password"
							class="form-control" name="user_password2" id="pw2"
							value="${user_password}" minlength="8" maxlength="16" required>
						<font id="checkPw" size="2">비밀번호는 8~16글자입니다</font>
					</div>
					<font id="checkPw" size="2"></font>
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="user_name"
							value="${user_name}" required>
					</div>

					<div class="mb-3">
						<input type="text" id="sample6_postcode" name="postcode"
							placeholder="우편번호" value="${aarr[0]}" style="display: none"><br>
						<input type="text" id="sample6_address" placeholder="주소"
							name="user_address1" value="${user_address1}"><br> <input
							type="text" id="sample6_detailAddress" placeholder="상세주소"
							name="user_address2" value="${user_address2}"> <input
							type="text" id="sample6_extraAddress" placeholder="참고항목"
							style="display: none"> <input type="button" class="adbtn"
							onclick="sample6_execDaumPostcode()" value="주소 찾기">
					</div>
					<br>
					<div class="mb-3">
						<label for="id">연락처</label> <input type="text"
							class="form-control" name="user_phone" id="phone"
							value="${user_phone}">
					</div>

					<label for="birth">생년월일</label> <input type="text"
						class="form-control" id="birth" name="user_birth"
						value="${user_birth}"> <font id="checkbirth" size="2"></font>


					<div class="mb-3">
						<label for="gender">성별</label> <input type="text"
							class="form-control" id="gender" name="user_gender"
							value="${user_gender}"> <font id="checkgender" size="2"></font>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="user_email" required
							value="${user_email}"> <font id="checkemail" size="2"></font>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<!-- 					<button class="btn btn-lg btn-block" type="button" id="cbtn" -->
					<!-- 						onclick="checkForm()">수정 완료</button> -->
					<button class="btn btn-lg btn-block" type="submit" id="cbtn">수정
						완료</button>
					<button class="btn btn-lg btn-block" type="button"
						onclick="deletecheck()">탈퇴 하기</button>
				</form>
			</div>
		</div>
	</div>

	<br>
	<br>

	<script>

</script>
</body>

</html>