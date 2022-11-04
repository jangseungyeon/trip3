<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>
<style>
.area{
	border-style: solid;
	margin: 30px;
	padding: 30px;
}
</style>
</head>
<body>
<br><br>
<div class="area">호스트 정보 수정<br>
호스트 아이디: ${host_id}</div>

<!-- 비밀번호 수정 -->
<div class="area">
<b>비밀번호 수정</b><br>
<form action="host_pw_update.do" method="post">
비밀번호 <input type="password" name="host_pw"><br>
비밀번호 확인 <input type="password" name="host_pw2"><br>
<input type="hidden" name="host_id" value="${host_id}"><br>

<input type="submit" value="수정하기">
</form>
</div>

<!-- 일반정보 수정 -->
<div class="area">
<b>일반정보 수정</b><br>
<form action="host_update.do" method="post">
상호명 <input type="text" name="host_bizname" value="${host.host_bizname}"><br>
대표자명 <input type="text" name="host_name" value="${host.host_name}"><br>
생년월일 <input type="text" name="host_birth" value="${host.host_birth}"><br>
이메일 <input type="text" name="host_email" value="${host.host_email}"><br>
휴대전화 (-)제외 <input type="text" name="host_phone" value="${host.host_phone}"><br>
도로명 주소 <input type="text" name="host_addr1" value="${host.host_addr1}"><br>
상세 주소 <input type="text" name="host_addr2" value="${host.host_addr2}"><br>
 <input type="hidden" name="host_status" value="0"><br>
사업자번호 <input type="text" name="host_biznum" value="${host.host_biznum}"><br>
사업자등록증 <input type="text" name="host_bizimg" value="${host.host_bizimg}"><br>
은행 <input type="text" name="host_bank" value="${host.host_bank}"><br>
계좌번호 <input type="text" name="host_banknum" value="${host.host_banknum}"><br><br>
<input type="hidden" name="host_id" value="${host.host_id}">
<input type="submit" value="수정하기"><br>
</form>
</div>

<!-- 탈퇴 -->
<br><br>
<div class="area">
<form action="host_leave.do" method="post">
<input type="hidden" name="host_id" value="${host_id}">
<input type="submit" value="호스트 탈퇴">
*복구되지 않습니다.
</form>
</div>
</body>
</html>