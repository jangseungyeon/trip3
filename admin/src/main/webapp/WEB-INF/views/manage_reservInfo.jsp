<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.springbook.biz.room.RoomVO"%>
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
                document.manage_reservInfo.action = "manage_reservUpdate.do";
                document.manage_reservInfo.submit();
            }
        });
    });
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.manage_reservInfo.action = "manage_reservDelete.do";
                document.manage_reservInfo.submit();
            }
        });
    });
</script>

 <h2>회원정보 상세</h2>
    <form name="manage_reservInfo" method="post">
        <table border="1">
            <tr>
                <td>예약번호</td>
                <td><input name="res_id" value="${ReservationVO.res_id}"></td>
            </tr>
            <tr>
                <td>회원아이디</td>
                <td><input name="user_id" value="${ReservationVO.user_id}"></td>
            </tr>
            <tr>
                <td>imp_uid</td>
                <td><input name="imp_uid" value="${ReservationVO.imp_uid}"></td>
            </tr>
            <tr>
                <td>merchant_uid</td>
                <td><input name="merchant_uid" value="${ReservationVO.merchant_uid}"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="res_name" value="${ReservationVO.res_name}"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input name="res_tel" value="${ReservationVO.res_tel}"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input name="res_email" value="${ReservationVO.res_email}"></td>
            </tr>
            <tr>
                <td>업주아이디</td>
                <td><input name="host_id" value="${ReservationVO.host_id}"></td>
            </tr>
            <tr>
                <td>숙소아이디</td>
                <td><input name="room_id" value="${ReservationVO.room_id}"></td>
            </tr>
            <tr>
                <td>숙소명</td>
                <td><input name="room_name" value="${ReservationVO.room_name}"></td>
            </tr>
            <tr>
                <td>이미지</td>
                <td><input name="room_img" value="${ReservationVO.room_img}"></td>
            </tr>
            <tr>
                <td>결제일자</td>
                <td><input name="pay_date" value="${ReservationVO.pay_date}"></td>
            </tr>
            <tr>
                <td>결제금액</td>
                <td><input name="pay_amount" value="${ReservationVO.pay_amount}"></td>
            </tr>
            <tr>
                <td>예약인원</td>
                <td><input name="res_num" value="${ReservationVO.res_num}"></td>
            </tr>
            <tr>
                <td>변경가능횟수</td>
                <td><input name="res_count" value="${ReservationVO.res_count}"></td>
            </tr>
            <tr>
                <td>예약상태</td>
                <td><input name="res_status" value="${ReservationVO.res_status}"></td>
            </tr>
            <tr>
                <td>체크인</td>
                <td><input name="res_checkin" value="${ReservationVO.res_checkin}"></td>
            </tr>
            <tr>
                <td>체크아웃</td>
                <td><input name="res_checkout" value="${ReservationVO.res_checkout}"></td>
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