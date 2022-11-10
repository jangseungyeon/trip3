<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	.top{
		width:100%;
		min-height:200px;
		background: linear-gradient(45deg, deepSkyBlue, skyBlue, lightCyan, lightCyan, lightCyan);
		color: white;
		font-size: 30px;
		font-weight: normal;
		vertical-align: center;
		padding: 30px;
		line-height: 180%;
	}
	.red-text{
		color:#DC3545;
		font-size:35px;
	}
	.red-text-small{
		color:#DC3545;
		font-size:18px;
	}
	.chart_title{
		text-decoration-line: underline;
		text-decoration-color: #DC3545;
		text-decoration-color: deepSkyBlue;
		text-decoration-thickness: 5px;
		text-underline-position: under;
		padding-bottom: 5px;
	}
	.contents-box{
		min-height:250px;
		margin:30px;
		padding:30px;
		color:black;
		font-size:30px;
		padding:30px;	
		border-style:solid;
		border-color:#6c757d;
		position:relative;
	}
	.host-index-summary{
		min-height:150px;
		padding: 20px;
		width: 60%;
		font-size:16px;
		box-shadow: 1px 1px 3px 1px #dadce0 inset;
		float: left;
		position: absolute;
	}
	.host-index-summary2{
		min-height:150px;
		padding: 20px;
		width: 35%;
		text-align: center;
		font-size:16px;
		box-shadow: 1px 1px 3px 1px #dadce0 inset;
		float: right;
		position: absolute;
		right: 20px;
	}

	.host-index-summary-left{
		padding: 5px;
		width: 50%;
		float:left;
	}
	
	</style>


</head>
<body>


<div class="top">
안녕하세요 <span class="red-text">${host_bizname}</span>님.<br>
오늘도 좋은 하루 보내세요.


</div>


<div style="padding:20px; position:relative; height: 200px;">

<div class="host-index-summary">
	<div class="host-index-summary-left">
	· 운영중인 숙소: <span class="red-text-small">5</span>건<br>
	· 등록된 총 리뷰: <span class="red-text-small">11</span>건
	</div>
	<div class="host-index-summary-left">
	· 체크아웃(완료): <span class="red-text-small">13</span>건<br>
	· 오늘 체크인: <span class="red-text-small">2</span>건<br>
	· 숙박중: <span class="red-text-small">2</span>건<br>
	· 체크인(예정): <span class="red-text-small">3</span>건
	</div>
</div>

<div class="host-index-summary2">
	<div class="host-index-summary-left">
	요즘 인기 트렌드<br>
	1. <span class="red-text-small">숲속</span><br>
	2. <span class="red-text-small">산, 바다</span>
	</div>
	<div class="host-index-summary-left">
	요즘 인기 숙소<br>
	1. <span class="red-text-small">상호민박</span><br>
	2. <span class="red-text-small">상호대차</span>
	</div>
</div>

</div>


<br>
<!-- 매출현황 -->

<div style="text-align:center";>
<div style="width: 65%; height: 900px; padding-left:30px ; float:left; position: relative;">
	<!--차트 1, 막대형 그래프-->
	최근 10일간 <span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">일별</span> 매출 현황<br></span>
	<br>
	<canvas id="myChart"></canvas>
</div>
<div style="width: 30%; height: 900px; padding-right:30px ; float:right; position: relative;">
	<!--차트 2, 원형 그래프-->
	최근 10일간 <span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">숙소별</span> 매출 현황<br></span>
	<br>
	<canvas id="myChart2"></canvas>
</div>
</div>


<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '${hostIndexChartSelect[0].chart_date}',
                        '${hostIndexChartSelect[1].chart_date}',
                        '${hostIndexChartSelect[2].chart_date}',
                        '${hostIndexChartSelect[3].chart_date}',
                        '${hostIndexChartSelect[4].chart_date}',
                        '${hostIndexChartSelect[5].chart_date}',
                        '${hostIndexChartSelect[6].chart_date}',
                        '${hostIndexChartSelect[7].chart_date}',
                        '${hostIndexChartSelect[8].chart_date}',
                       ' ${hostIndexChartSelect[9].chart_date}'
                    ],
                    datasets: [
                        { //데이터
                            label: 'Daily..', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                ${hostIndexChartSelect[0].chart_sum},
                                ${hostIndexChartSelect[1].chart_sum},
                                ${hostIndexChartSelect[2].chart_sum},
                                ${hostIndexChartSelect[3].chart_sum},
                                ${hostIndexChartSelect[4].chart_sum},
                                ${hostIndexChartSelect[5].chart_sum},
                                ${hostIndexChartSelect[6].chart_sum},
                                ${hostIndexChartSelect[7].chart_sum},
                                ${hostIndexChartSelect[8].chart_sum},
                                ${hostIndexChartSelect[9].chart_sum}
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
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

<script type="text/javascript">
			<!-- 방 개수 구하기 -->
			var labels_b = [];
				 <%List<HostChartVO> host_chart2_list = (List<HostChartVO>) request.getAttribute("hostIndexChart2Select"); 
				 for(int i = 0; i < host_chart2_list.size(); i++) {
					 	String room_name = host_chart2_list.get(i).getRoom_name();%>
			labels_b.push("<%=room_name%>");
			<%}%>
			
			<!-- 방 매출 구하기 -->
			var labels_c = [];
			 <%List<HostChartVO> host_chart2_list2 = (List<HostChartVO>) request.getAttribute("hostIndexChart2Select"); 
			 for(int i = 0; i < host_chart2_list2.size(); i++) {
				 	int chart_sum2 = host_chart2_list2.get(i).getChart_sum2();%>
		labels_c.push("<%=chart_sum2%>");
		<% } %>
			
            var context = document
                .getElementById('myChart2')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	labels: labels_b,

                    datasets: [
                        { //데이터
                            label: '최근 10일간 숙소별 매출 현황', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: labels_c
//                                 ${hostIndexChart2Select[0].chart_sum2},
//                                 ${hostIndexChart2Select[1].chart_sum2},
//                                 ${hostIndexChart2Select[2].chart_sum2},
//                                 ${hostIndexChart2Select[3].chart_sum2},
//                                 ${hostIndexChart2Select[4].chart_sum2},
//                                 ${hostIndexChart2Select[5].chart_sum2},
//                                 ${hostIndexChart2Select[6].chart_sum2},
//                                 ${hostIndexChart2Select[7].chart_sum2},
//                                 ${hostIndexChart2Select[8].chart_sum2},
//                                 ${hostIndexChart2Select[9].chart_sum2}
                            ,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
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