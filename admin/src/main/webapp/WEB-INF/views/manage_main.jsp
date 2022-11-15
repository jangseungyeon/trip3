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
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Admin Dashboard</title>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar" data-color="black">
			<!-- data-color="purple | blue | green | orange | red" -->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> Trip 3.0 </a>
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
						href="manage_hostList.do"> <i class="nc-icon nc-satisfied"></i>업주
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
					<a class="navbar-brand" href="#pablo"> DASH BOARD </a>
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
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<span class="no-icon">Account</span>
							</a></li>
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
						<div class="col-md-6">
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
													<td>운영중인 숙소: <span class="red-text-small">${indexRoomCount.index_room_count}</span>건
													</td>
												</tr>
												<tr>
													<td>등록된 총 리뷰: <span class="red-text-small">${indexReviewCount.index_review_count}</span>건
													</td>
												</tr>
												<tr>
													<td>받은 좋아요 수: <span class="red-text-small">${indexLikeCount.index_like_count}</span>건
													</td>
												</tr>
												<tr>
													<td>체크아웃(완료): <span class="red-text-small">${indexCheckout.index_checkout}</span>건
													</td>
												</tr>
												<tr>
													<td>오늘 체크인: <span class="red-text-small">${indexTodayCheckin.index_today_checkin}</span>건
													</td>
												</tr>
												<tr>
													<td>숙박중: <span class="red-text-small">${indexStaying.index_staying}</span>건
													</td>
												</tr>
												<tr>
													<td>체크인(예정): <span class="red-text-small">${indexCheckinAble.index_checkin_able}</span>건
													</td>
												</tr>
											</tbody>
										</table>
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

						<div class="col-md-6">
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
													<td><span class="red-text-small">${hostIndexRoomSelect[0].index_theme_rank}</span>
													</td>
												</tr>
												<tr>
													<td><span class="red-text-small">${hostIndexRoomSelect[1].index_theme_rank}</span>
													</td>
												</tr>
												<tr>
													<td><span class="red-text-small">${hostIndexRoomSelect[2].index_theme_rank}</span>
													</td>
												</tr>
												<tr>
													<td><span class="red-text-small">${hostIndexRoomSelect[0].index_room_rank}</span>
													</td>
												</tr>
												<tr>
													<td><span class="red-text-small">${hostIndexRoomSelect[1].index_room_rank}</span>
													</td>
												</tr>
												<tr>
													<td><span class="red-text-small">${hostIndexRoomSelect[2].index_room_rank}</span>
													</td>
												</tr>
											</tbody>
										</table>
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









<!-- 매출현황 -->

<div style="text-align:center";>
<div class="chart1" style="width: 65%; height: 500px; padding-left:30px ; float:left; position: relative;">
	<!--차트 1, 막대형 그래프-->
	최근 10일간 <span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">일별</span> 매출 현황<br></span>
	<br>
	<canvas id="myChart"></canvas>
</div>
<div style="width: 30%; height: 400px; padding-right:30px ; float:right; position: relative;">
	<!--차트 2, 원형 그래프-->
	최근 10일간 <span class="red-text-small">${host_id}</span>님의 <span class="chart_title"><span class="red-text-small">숙소별</span> 매출 현황<br></span>
	<br>
	<canvas id="myChart2"></canvas>
</div>
</div>

<!-- 차트 3, 전체 매출 -->


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
        











						<div class="col-md-4">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">Email Statistics</h4>
									<p class="card-category">Last Campaign Performance</p>
								</div>
								<div class="card-body ">
									<div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
									<div class="legend">
										<i class="fa fa-circle text-info"></i> Open <i
											class="fa fa-circle text-table border=1px solid;"></i> Bounce
										<i class="fa fa-circle text-warning"></i> Unsubscribe
									</div>
									<hr>
									<div class="stats">
										<i class="fa fa-clock-o"></i> Campaign sent 2 days ago
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">Users Behavior</h4>
									<p class="card-category">24 Hours performance</p>
								</div>
								<div class="card-body ">
									<div id="chartHours" class="ct-chart"></div>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-info"></i> Open <i
											class="fa fa-circle text-table border=1px solid;"></i> Click
										<i class="fa fa-circle text-warning"></i> Click Second Time
									</div>
									<hr>
									<div class="stats">
										<i class="fa fa-history"></i> Updated 3 minutes ago
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<h4 class="card-title">2017 Sales</h4>
									<p class="card-category">All products including Taxes</p>
								</div>
								<div class="card-body ">
									<div id="chartActivity" class="ct-chart"></div>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-info"></i> Tesla Model S <i
											class="fa fa-circle text-table border=1px solid;"></i> BMW 5
										Series
									</div>
									<hr>
									<div class="stats">
										<i class="fa fa-check"></i> Data information certified
									</div>
								</div>
							</div>
						</div>












					</div>

				</div>
			</div>

		</div>
	</div>
	<!--   -->
	<!-- <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
            <i class="fa fa-cog fa-2x"> </i>
        </a>

        <ul class="dropdown-menu">
			<li class="header-title"> Sidebar Style</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>Background Image</p>
                    <label class="switch">
                        <input type="checkbox" data-toggle="switch" checked="" data-on-color="primary" data-off-color="primary"><span class="toggle"></span>
                    </label>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger background-color">
                    <p>Filters</p>
                    <div class="pull-right">
                        <span class="badge filter badge-black" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple active" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">Sidebar Images</li>

            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="resources/assets/img/sidebar-1.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="resources/assets/img/sidebar-3.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="..//assets/img/sidebar-4.jpg" alt="" />
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="resources/assets/img/sidebar-5.jpg" alt="" />
                </a>
            </li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard" target="_blank" class="btn btn-info btn-block btn-fill">Download, it's free!</a>
                </div>
            </li>

            <li class="header-title pro-title text-center">Want more components?</li>

            <li class="button-container">
                <div class="">
                    <a href="http://www.creative-tim.com/product/light-bootstrap-dashboard-pro" target="_blank" class="btn btn-warning btn-block btn-fill">Get The PRO Version!</a>
                </div>
            </li>

            <li class="header-title" id="sharrreTitle">Thank you for sharing!</li>

            <li class="button-container">
				<button id="twitter" class="btn btn-social btn-outline btn-twitter btn-round sharrre"><i class="fa fa-twitter"></i> · 256</button>
                <button id="facebook" class="btn btn-social btn-outline btn-facebook btn-round sharrre"><i class="fa fa-facebook-square"></i> · 426</button>
            </li>
        </ul>
    </div>
</div>
 -->
</body>

<%@ include file="footer.jsp"%>
</html>
