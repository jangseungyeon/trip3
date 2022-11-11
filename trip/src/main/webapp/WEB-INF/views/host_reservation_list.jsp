<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springbook.biz.reservation.ReservationVO"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.springbook.biz.host.HostChartVO,java.util.*" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    
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
	.red-text{
		color:#DC3545;
		font-size:35px;
	}
	.red-text-small{
		color:#DC3545;
		font-size:18px;
	}


</style>
</head>
<body>
<br><br>

<div style="text-align:center; width:100%; height: 600px; margin: 0 auto;">
<div style="width: 80%; height: 300px;" >
<span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">전체 기간</span> 매출 현황<br></span>
	<br>
	<canvas id="myChart3"></canvas>
</div>
</div>

<div>
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
</div>


<!-- 3번 차트 -->
<script type="text/javascript">
	<!-- 날짜 구하기 -->
	var labels_d = [];
		 <%List<HostChartVO> host_chart3_list = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select"); 
		 for(int i = 0; i < host_chart3_list.size(); i++) {
			 	String chart_date_all = host_chart3_list.get(i).getChart_date_all();%>
	labels_d.push("<%=chart_date_all%>");
	<%}%>
	
	<!-- 일별 매출 구하기 -->
	var labels_e = [];
	 <%List<HostChartVO> host_chart3_list3 = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select"); 
	 for(int i = 0; i < host_chart3_list3.size(); i++) {
		 	int chart_sum_all = host_chart3_list3.get(i).getChart_sum_all();%>
labels_e.push("<%=chart_sum_all%>");
<% } %>

<!-- 일별 건수 구하기 -->
var labels_f = [];
var bg_color = [];
 <%List<HostChartVO> host_chart3_count = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select"); 
 for(int i = 0; i < host_chart3_count.size(); i++) {
	 	int chart_count_all = host_chart3_count.get(i).getChart_count_all();
	 	%>
labels_f.push("<%=chart_count_all%>");
<!-- bar 컬러 동일하게 넣기 -->
bg_color.push("#f8d7da");
<% } %>


<!-- 3번 차트 -->
var context = document
.getElementById('myChart3')
.getContext('2d');
var myChart = new Chart(context, {
type: 'bar', // 차트의 형태
data: { // 차트에 들어갈 데이터
	labels: labels_d,
	datasets: [{
            label: 'Daily..', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: labels_e,
            backgroundColor: bg_color,
            borderColor: [
//                 'rgba(255, 99, 132, 1)',
//                 'rgba(54, 162, 235, 1)',
//                 'rgba(255, 206, 86, 1)',
//                 'rgba(75, 192, 192, 1)',
//                 'rgba(153, 102, 255, 1)',
//                 'rgba(255, 159, 64, 1)',
//                 'rgba(255, 99, 132, 1)',
//                 'rgba(54, 162, 235, 1)',
//                 'rgba(255, 206, 86, 1)',
//                 'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1 //경계선 굵기
        } ,/*
        {
            label: '예약 건수',
            fill: false,
            data: [
            	labels_f
            ],
            backgroundColor: 'rgb(157, 109, 12)',
            borderColor: 'rgb(157, 109, 12)'
        } */
    ]
},
options:
{responsive: true, maintainAspectRatio: false,
    scales: {
        yAxes: [
            {
                ticks: {
                    beginAtZero: true
                }
            }
        ]
    }
}
});

</script>


</body>
</html>