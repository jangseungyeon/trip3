<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Host 회원가입</title>


</head>
<body>

<br>
<h1>호스트 회원가입</h1>
<br>
<form action="host_insert.do" method="post">
아이디 <input type="text" name="host_id"><br>
비밀번호 <input type="password" name="host_pw"><br>
비밀번호 확인 <input type="password" name="host_pw2"><br>
상호명 <input type="text" name="host_bizname"><br>
대표자명 <input type="text" name="host_name"><br>
생년월일 <input type="text" name="host_birth"><br>
이메일 <input type="text" name="host_email"><br>
휴대전화 (-)제외 <input type="text" name="host_phone"><br>
도로명 주소 <input type="text" name="host_addr1"><br>
상세 주소 <input type="text" name="host_addr2"><br>
 <input type="hidden" name="host_status" value="0"><br>
사업자번호 <input type="text" name="host_biznum"><br>
사업자등록증 <input type="text" name="host_bizimg"><br>
은행 <input type="text" name="host_bank"><br>
계좌번호 <input type="text" name="host_banknum"><br><br>

<input type="submit" value="가입하기"><br>
</form>


</body>
</html>