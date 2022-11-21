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
	body, html{
		background: #f9fcff;
	}
	table, td{
		border: 1px solid;
		border-color: gray;
		padding: 5px;
		font-color: #19558c;
		text-align: center;
		font-size: 14px;
	}
	.review_div {		
	}
	
	.title_td{
		background: #be3232;
		color: #f9fcff;
	}
	.red-text{
		color:#DC3545;
		font-size:35px;
	}
	.red-text-small{
		color:#DC3545;
		font-size:18px;
	}
	
	.input1{
		width:100%;
		max-width: 290px;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		box-shadow: 0 0 0 1px #19558c;
		outline:none;
	}
	.input1:focus{
		width:100%;
		max-width: 290;
		height:30px;
		padding:5px 20px;
		border-radius:20px;
		border:none;
		margin:3px;
		font-size:12px;
		box-shadow: 0 0 0 3px #ff677d;
		outline:none;
	}


</style>
</head>
<body>
<br><br>
<div align=center>
<div align=center style="width:80%" style="min-height:300px;">

<span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">전체 기간</span> 매출 현황 (차트형)<br></span>
	<br>
	<canvas id="myChart3"></canvas>

</div>
<br><br>
<div align=center style="width:80%">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $("#mykeyword").keyup(function() {
        var value = $(this).val().toLowerCase();
        $("#myTable_tbody tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        // $("#myTable > tbody > tr").hide();
        // var temp = $("#myTable > tbody > tr > td:nth-child(5n+4):contains('" + value + "')");
        // $(temp).parent().show();
    });
});
</script>

<c:choose>
<c:when test="${reservationListForHost.size() eq '0'}">${host_id}님 숙소의 예약 내역이 없습니다. </c:when>
<c:when test="${reservationListForHost.size() ne '0'}">
<span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">전체 기간</span> 매출 현황 (목록형) <br></span><br>
<div align=left> <input type="text" id="mykeyword" class="input1" placeholder="어디 한번 찾을 내용을 입력해보세요"><br>
 <br></div>
<table id='myTable' style="width:100%">
<thead>
<tr><td class="title_td">예약번호</td><td class="title_td">회원ID</td><td class="title_td">내 객실명</td><td class="title_td">결제일</td><td class="title_td">결제금액</td><td class="title_td">예약인원(명)</td><td class="title_td">예약상태</td><td class="title_td">체크인</td><td class="title_td">체크아웃</td></tr></thead>
<tbody id="myTable_tbody">
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
</tbody>
</table>
</c:when>
</c:choose>
</div>



</div>
<br><br><br><br><br><br>
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
bg_color.push("#ff677d");
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