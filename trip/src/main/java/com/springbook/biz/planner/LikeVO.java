package com.springbook.biz.planner;

public class LikeVO {
	private int like_type;
	private String like_id; 
	private String user_id;
	private int like_no;
	private int like_count;
	private String status;
	
	private String planner_title; // 플레너 제목
	private String planner_area; // 여행 지역
	private String planner_day; // 여행 기간
	
	private String room_img_no1;	//숙소 이미지 파일명
	private String room_name;	//숙소명
	private String room_area;	//숙소 지역
	
	
	public String getPlanner_area() {
		return planner_area;
	}
	public void setPlanner_area(String planner_area) {
		this.planner_area = planner_area;
	}
	public String getPlanner_day() {
		return planner_day;
	}
	public void setPlanner_day(String planner_day) {
		this.planner_day = planner_day;
	}
	public String getRoom_area() {
		return room_area;
	}
	public void setRoom_area(String room_area) {
		this.room_area = room_area;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	private String room_price;	//숙소 1박 가격
	
	public String getRoom_img_no1() {
		return room_img_no1;
	}
	public void setRoom_img_no1(String room_img_no1) {
		this.room_img_no1 = room_img_no1;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getPlanner_title() {
		return planner_title;
	}
	public void setPlanner_title(String planner_title) {
		this.planner_title = planner_title;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLike_type() {
		return like_type;
	}
	public void setLike_type(int like_type) {
		this.like_type = like_type;
	}
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	
	@Override
	public String toString() {
		return "LikeVO [like_type=" + like_type + ", like_id=" + like_id + ", user_id=" + user_id + ", like_no="
				+ like_no + ", like_count=" + like_count + ", status=" + status + ", planner_title=" + planner_title
				+ ", room_img=" + room_img_no1 + ", room_name=" + room_name + "]";
	}
	
}
