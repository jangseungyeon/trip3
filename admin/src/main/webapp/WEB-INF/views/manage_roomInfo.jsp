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
                document.manage_roomInfo.action = "manage_updateRoom.do";
                document.manage_roomInfo.submit();
            }
        });
    });
    $(document).ready(function(){
        $("#btnDelete").click(function(){
            // 확인 대화상자 
            if(confirm("삭제하시겠습니까?")){
                document.manage_roomInfo.action = "manage_deleteRoom.do";
                document.manage_roomInfo.submit();
            }
        });
    });
</script>

 <h2>회원정보 상세</h2>
    <form name="manage_roomInfo" method="post">
        <table border="1">
            <tr>
                <td>숙소명</td>
                <td><input name="room_name" value="${RoomVO.room_name}"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input name="room_addr" value="${RoomVO.room_addr}"></td>
            </tr>
            <tr>
                <td>상세주소</td>
                <td><input name="room_addr_detail" value="${RoomVO.room_addr_detail}"></td>
            </tr>
            <tr>
                <td>설명</td>
                <td><input name="room_desc" value="${RoomVO.room_desc}"></td>
            </tr>
            <tr>
                <td>숙소 아이디</td>
                <td><input name="room_id" value="${RoomVO.room_id}"></td>
            </tr>
            <tr>
                <td>업주 아이디</td>
                <td><input name="host_id" value="${RoomVO.host_id}"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input name="room_price" value="${RoomVO.room_price}"></td>
            </tr>
            <tr>
                <td>이미지</td>
                <td><input name="room_img" value="${RoomVO.room_img}"></td>
            </tr>
            <tr>
                <td>마일리지</td>
                <td><input name="room_points" value="${RoomVO.room_points}"></td>
            </tr>
            <tr>
                <td>최대인원</td>
                <td><input name="room_max" value="${RoomVO.room_max}"></td>
            </tr>
            <tr>
                <td>테마</td>
                <td><input name="room_theme" value="${RoomVO.room_theme}"></td>
            </tr>
            <tr>
                <td>카테고리</td>
                <td><input name="room_cat" value="${RoomVO.room_cat}"></td>
            </tr>
            <tr>
                <td>와이파이</td>
                <td><input name="room_wifi" value="${RoomVO.room_wifi}"></td>
            </tr>
            <tr>
                <td>동물</td>
                <td><input name="room_pet" value="${RoomVO.room_pet}"></td>
            </tr>
            <tr>
                <td>조식</td>
                <td><input name="room_meal" value="${RoomVO.room_meal}"></td>
            </tr>
            <tr>
                <td>주차</td>
                <td><input name="room_parking" value="${RoomVO.room_parking}"></td>
            </tr>
            <tr>
                <td>수영장</td>
                <td><input name="room_swpool" value="${RoomVO.room_swpool}"></td>
            </tr>
            <tr>
                <td>좋아요</td>
                <td><input name="room_likes" value="${RoomVO.room_likes}"></td>
            </tr>
            <tr>
                <td>별점</td>
                <td><input name="room_stars" value="${RoomVO.room_stars}"></td>
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