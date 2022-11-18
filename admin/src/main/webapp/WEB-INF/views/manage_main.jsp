<!-- 
=========================================================
 Light Bootstrap Dashboard - v2.0.1
=========================================================

 Product Page: https://www.creative-tim.com/product/light-bootstrap-dashboard
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/light-bootstrap-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.springbook.biz.host.HostChartVO,java.util.*"%>
<%@ page import="com.springbook.biz.reservation.ReservationVO"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>tripONplan</title>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="black">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="manage_main.do" class="simple-text"> Trip 3.0 </a>
				</div>
				<ul class="nav">
					<li class="nav-item active"><a class="nav-link"
						href="manage_main.do"> <i class="nc-icon nc-chart-pie-35"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_userList.do"> <i class="nc-icon nc-circle-09"></i>회원
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_roomList.do"> <i class="nc-icon nc-istanbul"></i>숙소
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>호스트
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_faqList.do"> <i class="nc-icon nc-single-copy-04"></i>공지사항
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_plannerList.do"> <i class="nc-icon nc-map-big"></i>플래너
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="manage_reservList.do"> <i class="nc-icon nc-money-coins"></i>예약
							관리
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="qna_admin_list.do"> <i class="nc-icon nc-send"></i>문의 응답
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg " color-on-scroll="500">
				<div class="container-fluid">
					<a class="navbar-brand"> DASH BOARD </a>
					<button href="" class="navbar-toggler navbar-toggler-right"
						type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span> <span
							class="navbar-toggler-bar burger-lines"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">

						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">${manage_id}님 접속중</span>
							</a></li>
<!-- 							<li class="nav-item"><a class="nav-link" href="#pablo"> -->
<!-- 									<span class="no-icon">Account</span> -->
<!-- 							</a></li> -->
							<li class="nav-item"><a class="nav-link"
								href="manage_logout.do"> <span class="no-icon">Log
										out</span>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">
				<div class="container-fluid">
					<div class="row">
					
					<div class="col-md-10">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">총 매출 현황</h4>
									<p class="card-category">전체 매출 현황</p>
								</div>
								<div class="card-body ">
									<!--차트 3, 바 그래프-->
									<div class="chart3">
										<canvas id="myChart3"></canvas>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="now-ui-icons loader_refresh spin"></i> Data
										information certified
									</div>
								</div>
							</div>
						</div>
					
						<div class="col-md-8">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">일별 매출 현황</h4>
									<p class="card-category">10일간 매출 현황</p>
								</div>
								<div class="card-body ">
									<!--차트 1, 막대형 그래프-->
									<div class="chart1">
										<canvas id="myChart1"></canvas>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="now-ui-icons loader_refresh spin"></i> Data
										information certified
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">숙소 매출 현황</h4>
									<p class="card-category">숙소별 매출 현황</p>
								</div>
								<div class="card-body ">
									<!--차트 2, 원형 그래프-->
									<div class="chart2">
										<canvas id="myChart2"></canvas>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="now-ui-icons loader_refresh spin"></i> Data
										information certified
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card  card-tasks">
								<div class="card-header ">
									<h4 class="card-title">Info</h4>
									<p class="card-category">인기 테마 / 숙소</p>
								</div>
								<div class="card-body ">
									<div class="table-full-width">
										<table class="table">
											<tbody>
												<tr>
													<td>${hostIndexRoomSelect[0].index_theme_rank}</td>
												</tr>
												<tr>
													<td>${hostIndexRoomSelect[1].index_theme_rank}</td>
												</tr>
												<tr>
													<td>${hostIndexRoomSelect[2].index_theme_rank}</td>
												</tr>
												<tr>
													<td>${hostIndexRoomSelect[0].index_room_rank}</td>
												</tr>
												<tr>
													<td>${hostIndexRoomSelect[1].index_room_rank}</td>
												</tr>
												<tr>
													<td>${hostIndexRoomSelect[2].index_room_rank}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-4">
							<div class="card  card-tasks">
								<div class="card-header ">
									<h4 class="card-title">Info</h4>
									<p class="card-category">운영 현황</p>
								</div>
								<div class="card-body ">
									<div class="table-full-width">
										<table class="table">
											<tbody>
												<tr>
													<td>현재 등록 운영중인 숙소 :
														${indexRoomCount.index_room_count}건</td>
												</tr>
												<tr>
													<td>숙박완료(체크아웃) 숙소 : ${indexCheckout.index_checkout}건</td>
												</tr>
												<tr>
													<td>숙박예정(체크 인)인 숙소 :
														${indexTodayCheckin.index_today_checkin}건</td>
												</tr>
												<tr>
													<td>현재 고객님이 숙박중인 수 : ${indexStaying.index_staying}건</td>
												</tr>
												<tr>
													<td>숙박예정(체크 인) 고객님 :
														${indexCheckinAble.index_checkin_able}건</td>
												</tr>
												<tr>
													<td>홈페이지에 등록된 총 리뷰 :
														${indexReviewCount.index_review_count}건</td>
												</tr>
												<tr>
													<td>누적된 지금까지의 좋아요 :
														${indexLikeCount.index_like_count}건</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

						


					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
    		var context = document
                .getElementById('myChart1')
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
for (int i = 0; i < host_chart2_list.size(); i++) {
	String room_name = host_chart2_list.get(i).getRoom_name();%>
			labels_b.push("<%=room_name%>");
			<%}%>
			
			<!-- 방 매출 구하기 -->
			var labels_c = [];
			 <%List<HostChartVO> host_chart2_list2 = (List<HostChartVO>) request.getAttribute("hostIndexChart2Select");
for (int i = 0; i < host_chart2_list2.size(); i++) {
	int chart_sum2 = host_chart2_list2.get(i).getChart_sum2();%>
		labels_c.push("<%=chart_sum2%>");
		<%}%>
			
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

	<script type="text/javascript">
	<!-- 3번 차트 -->
	<!-- 날짜 구하기 -->
	var labels_d = [];
		 <%List<HostChartVO> host_chart3_list = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select");
for (int i = 0; i < host_chart3_list.size(); i++) {
	String chart_date_all = host_chart3_list.get(i).getChart_date_all();%>
	labels_d.push("<%=chart_date_all%>");
	<%}%>
	
	<!-- 일별 매출 구하기 -->
	var labels_e = [];
	 <%List<HostChartVO> host_chart3_list3 = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select");
for (int i = 0; i < host_chart3_list3.size(); i++) {
	int chart_sum_all = host_chart3_list3.get(i).getChart_sum_all();%>
	labels_e.push("<%=chart_sum_all%>");
	<%}%>

	<!-- 일별 건수 구하기 -->
	var labels_f = [];
	var bg_color = [];
 	<%List<HostChartVO> host_chart3_count = (List<HostChartVO>) request.getAttribute("hostIndexChart3Select");
for (int i = 0; i < host_chart3_count.size(); i++) {
	int chart_count_all = host_chart3_count.get(i).getChart_count_all();%>
	labels_f.push("<%=chart_count_all%>");
	<!-- bar 컬러 동일하게 넣기 -->
	bg_color.push("#f8d7da");
	<%}%>


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
<%@ include file="footer.jsp"%>
</html>
