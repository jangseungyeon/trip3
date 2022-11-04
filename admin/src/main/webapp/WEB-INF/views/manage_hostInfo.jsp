<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.host.HostVO"%>
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
                document.manage_hostInfo.action = "manage_hostUpdate.do";
                document.manage_hostInfo.submit();
            }
        });
    });
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.manage_hostInfo.action = "manage_hostDelete.do";
                document.manage_hostInfo.submit();
            }
        });
    });
</script>

 <h2>회원정보 상세</h2>
    <form name="manage_hostInfo" method="post">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input name="host_id" value="${HostVO.host_id}" readonly></td>
            </tr>
            <tr>
                <td>업소명</td>
                <td><input name="host_bizname" value="${HostVO.host_bizname}"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="host_name" value="${HostVO.host_name}"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input name="host_birth" value="${HostVO.host_birth}"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input name="host_email" value="${HostVO.host_email}"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input name="host_phone" value="${HostVO.host_phone}"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input name="host_addr1" value="${HostVO.host_addr1}"></td>
            </tr>
            <tr>
                <td>상세주소</td>
                <td><input name="host_addr2" value="${HostVO.host_addr2}"></td>
            </tr>
            <tr>
                <td>상태</td>
                <td><input name="host_status" value="${HostVO.host_status}"></td>
            </tr>
            <tr>
                <td>사업자번호</td>
                <td><input name="host_biznum" value="${HostVO.host_biznum}"></td>
            </tr>
            <tr>
                <td>이미지</td>
                <td><input name="host_bizimg" value="${HostVO.host_bizimg}"></td>
            </tr>
             <tr>
                <td>은행</td>
                <td><input name="host_bank" value="${HostVO.host_bank}"></td>
            </tr>
             <tr>
                <td>계좌번호</td>
                <td><input name="host_banknum" value="${HostVO.host_banknum}"></td>
            </tr>
            
            
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="수정" id="btnUpdate">
                    <input type="button" value="삭제" id="btnDelete">
                </td>
            </tr>
        </table>
    </form>
</body>

</html>