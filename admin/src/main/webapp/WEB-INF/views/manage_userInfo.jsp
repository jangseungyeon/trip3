<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.user.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">

<title>정보 수정</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
</head>
<body class="info-body">
	<script>
    $(document).ready(function(){
        $("#btnUpdate").click(function(){
            // 확인 대화상자    
            if(confirm("수정하시겠습니까?")){
                document.manage_userInfo.action = "manage_userUpdate.do";
                document.manage_userInfo.submit();
            }
        });
    });
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.manage_userInfo.action = "${path}/member/delete.do";
                document.manage_userInfo.submit();
            }
        });
    });
</script>

 <h2>회원정보 상세</h2>
    <form name="manage_userInfo" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input name="user_id" value="${UserVO.user_id}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="user_name" value="${UserVO.user_name}"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="user_password" value="${UserVO.user_password}"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input name="user_birth" value="${UserVO.user_birth}"></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input name="user_gender" value="${UserVO.user_gender}"></td>
            </tr>
            <tr>
                <td>이메일주소</td>
                <td><input name="user_email" value="${UserVO.user_email}"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input name="user_phone" value="${UserVO.user_phone}"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input name="user_address1" value="${UserVO.user_address1}"></td>
            </tr>
            <tr>
                <td>상세주소</td>
                <td><input name="user_address2" value="${UserVO.user_address2}"></td>
            </tr>
            <tr>
                <td>상태</td>
                <td><input name="user_status" value="${UserVO.user_status}"></td>
            </tr>
            <tr>
                <td>타입</td>
                <td><input name="user_type" value="${UserVO.user_type}"></td>
            </tr>
            
            
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="수정" id="btnUpdate">
                    <input type="button" value="삭제" id="btnDelete">
                    <div style="color: red;">${message}</div>
                </td>
            </tr>
        </table>
    </form>
</body>

</html>