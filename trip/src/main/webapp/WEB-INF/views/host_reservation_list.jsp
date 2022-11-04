<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.reservation.ReservationVO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="host_header.jsp"%>

<style>
	table, td{
		border: 1px solid;
	}

</style>
</head>
<body>
<br><br>


<c:choose>
<c:when test="${reservationListForHost.size() eq '0'}">${host_id}님 숙소의 예약 내역이 없습니다. </c:when>
<c:when test="${reservationListForHost.size() ne '0'}">
${host_id}님 숙소의 예약 내역입니다.<br>
<table>
<tr><td>예약번호</td><td>회원ID</td><td>내 객실명</td><td>결제일</td><td>결제금액</td><td>예약인원(명)</td><td>예약상태</td><td>체크인</td><td>체크아웃</td></tr>
	<c:forEach var="i" begin="0" end="${reservationListForHost.size()-1}" step="1">
		<tr>
			<td>${reservationListForHost[i].res_id}</td>
			<td>${reservationListForHost[i].user_id}</td>
			<td>${reservationListForHost[i].room_name}</td>
			<td>${reservationListForHost[i].pay_date}</td>
			<td>${reservationListForHost[i].pay_amount}</td>
			<td>${reservationListForHost[i].res_num}</td>
			<td>${reservationListForHost[i].res_status}</td>
			<td>${reservationListForHost[i].res_checkin}</td>
			<td>${reservationListForHost[i].res_checkout}</td>
		</tr>
	</c:forEach>
</table>
</c:when>
</c:choose>




</body>
</html>