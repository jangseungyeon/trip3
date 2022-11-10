package com.springbook.biz.host;

public class HostChartVO {
	private String host_id;
	private String chart_date; //막대형 차트
	private int chart_sum; //막대형 차트 일별 매출 합계
	private int chart_count; //막대형 차트 일별 예약 건수 (미사용)
	private int chart_sum2; //파이형 차트 숙소별 매출 합계
	private String room_name; //파이형 차트 숙소 이름
	private int index_room_count; //호스트가 운영중인 숙소 수
	private int index_review_count; //호스트가 가진 리뷰 수
	private int index_like_count; //호스트가 가진 좋아요 수
	private int index_checkout; //호스트가 가진 체크아웃된 숙소 수
	private int index_today_checkin; //호스트가 가진 오늘 체크인 숙소 수
	private int index_staying; //호스트가 가진 현재 숙박중인 숙소 수
	private int index_checkin_able; //호스트가 가진 체크인 예정 숙소 수
	private String index_best_cat1; //최근 10일간 인기 카테고리 1위
	private String index_best_cat2; //최근 10일간 인기 카테고리 2위
	private String index_best_cat3; //최근 10일간 인기 카테고리 3위
	private String index_best_like1; //최근 10일간 좋아요 수 많은 숙소 1위
	private String index_best_like2; //최근 10일간 좋아요 수 많은 숙소 2위
	private String index_best_like3; //최근 10일간 좋아요 수 많은 숙소 3위
	private String index_best_sales1; //최근 10일간 매출 높은 숙소 1위
	private String index_best_sales2; //최근 10일간 매출 높은 숙소 2위
	private String index_best_sales3; //최근 10일간 매출 높은 숙소 3위
	
	
	
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
	public String getIndex_best_cat1() {
		return index_best_cat1;
	}
	public void setIndex_best_cat1(String index_best_cat1) {
		this.index_best_cat1 = index_best_cat1;
	}
	public String getIndex_best_cat2() {
		return index_best_cat2;
	}
	public void setIndex_best_cat2(String index_best_cat2) {
		this.index_best_cat2 = index_best_cat2;
	}
	public String getIndex_best_cat3() {
		return index_best_cat3;
	}
	public void setIndex_best_cat3(String index_best_cat3) {
		this.index_best_cat3 = index_best_cat3;
	}
	public String getIndex_best_like1() {
		return index_best_like1;
	}
	public void setIndex_best_like1(String index_best_like1) {
		this.index_best_like1 = index_best_like1;
	}
	public String getIndex_best_like2() {
		return index_best_like2;
	}
	public void setIndex_best_like2(String index_best_like2) {
		this.index_best_like2 = index_best_like2;
	}
	public String getIndex_best_like3() {
		return index_best_like3;
	}
	public void setIndex_best_like3(String index_best_like3) {
		this.index_best_like3 = index_best_like3;
	}
	public String getIndex_best_sales1() {
		return index_best_sales1;
	}
	public void setIndex_best_sales1(String index_best_sales1) {
		this.index_best_sales1 = index_best_sales1;
	}
	public String getIndex_best_sales2() {
		return index_best_sales2;
	}
	public void setIndex_best_sales2(String index_best_sales2) {
		this.index_best_sales2 = index_best_sales2;
	}
	public String getIndex_best_sales3() {
		return index_best_sales3;
	}
	public void setIndex_best_sales3(String index_best_sales3) {
		this.index_best_sales3 = index_best_sales3;
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
	
	
	
	
}
