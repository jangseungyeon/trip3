package com.springbook.biz.host;

public class HostChartVO {
	private String host_id;
	
	private String chart_date; //차트1, 최근 10일 날짜
	private int chart_sum; //차트1, 최근 10일간 일별 매출
	private int chart_count; //차트1, 최근 10일간 일별 예약 건수 (미사용)
	
	private int chart_sum2; //차트2, 최근 10일간 숙소별 매출 합계
	private String room_name; //차트2에서 사용하는 숙소 이름
	
	private int index_room_count; //호스트가 운영중인 숙소 수
	private int index_review_count; //호스트가 가진 리뷰 수
	private int index_like_count; //호스트가 가진 좋아요 수
	private int index_checkout; //호스트가 가진 체크아웃된 숙소 수
	private int index_today_checkin; //호스트가 가진 오늘 체크인 숙소 수
	private int index_staying; //호스트가 가진 현재 숙박중인 숙소 수
	private int index_checkin_able; //호스트가 가진 체크인 예정 숙소 수
	
	private String index_room_rank; //전체 기간 중 예약 건수 높은 숙소
	private String index_theme_rank; //전체 기간 중 예약 건수 높은 테마
	
	private String chart_date_all; //차트 3, 전체 매출 발생 날짜
	private int chart_sum_all; //차트 3, 전체 일별 매출
	private int chart_count_all; //차트 3, 일별 예약 건수
	
	
	
	public String getChart_date_all() {
		return chart_date_all;
	}
	public void setChart_date_all(String chart_date_all) {
		this.chart_date_all = chart_date_all;
	}
	public int getChart_sum_all() {
		return chart_sum_all;
	}
	public void setChart_sum_all(int chart_sum_all) {
		this.chart_sum_all = chart_sum_all;
	}
	public int getChart_count_all() {
		return chart_count_all;
	}
	public void setChart_count_all(int chart_count_all) {
		this.chart_count_all = chart_count_all;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getChart_date() {
		return chart_date;
	}
	public void setChart_date(String chart_date) {
		this.chart_date = chart_date;
	}
	public int getChart_sum() {
		return chart_sum;
	}
	public void setChart_sum(int chart_sum) {
		this.chart_sum = chart_sum;
	}
	public int getChart_count() {
		return chart_count;
	}
	public void setChart_count(int chart_count) {
		this.chart_count = chart_count;
	}
	public int getChart_sum2() {
		return chart_sum2;
	}
	public void setChart_sum2(int chart_sum2) {
		this.chart_sum2 = chart_sum2;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getIndex_room_count() {
		return index_room_count;
	}
	public void setIndex_room_count(int index_room_count) {
		this.index_room_count = index_room_count;
	}
	public int getIndex_review_count() {
		return index_review_count;
	}
	public void setIndex_review_count(int index_review_count) {
		this.index_review_count = index_review_count;
	}
	public int getIndex_like_count() {
		return index_like_count;
	}
	public void setIndex_like_count(int index_like_count) {
		this.index_like_count = index_like_count;
	}
	public int getIndex_checkout() {
		return index_checkout;
	}
	public void setIndex_checkout(int index_checkout) {
		this.index_checkout = index_checkout;
	}
	public int getIndex_today_checkin() {
		return index_today_checkin;
	}
	public void setIndex_today_checkin(int index_today_checkin) {
		this.index_today_checkin = index_today_checkin;
	}
	public int getIndex_staying() {
		return index_staying;
	}
	public void setIndex_staying(int index_staying) {
		this.index_staying = index_staying;
	}
	public int getIndex_checkin_able() {
		return index_checkin_able;
	}
	public void setIndex_checkin_able(int index_checkin_able) {
		this.index_checkin_able = index_checkin_able;
	}
	public String getIndex_room_rank() {
		return index_room_rank;
	}
	public void setIndex_room_rank(String index_room_rank) {
		this.index_room_rank = index_room_rank;
	}
	public String getIndex_theme_rank() {
		return index_theme_rank;
	}
	public void setIndex_theme_rank(String index_theme_rank) {
		this.index_theme_rank = index_theme_rank;
	}

	
	
}
