package com.springbook.biz.planner;

public class PlaceVO {
	private String Planner_no;
	private String user_id;
	private String planner_date;
	private String place;
	private String place_memo;
	public String getPlanner_no() {
		return Planner_no;
	}
	public void setPlanner_no(String planner_no) {
		Planner_no = planner_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPlanner_date() {
		return planner_date;
	}
	public void setPlanner_date(String planner_date) {
		this.planner_date = planner_date;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPlace_memo() {
		return place_memo;
	}
	public void setPlace_memo(String place_memo) {
		this.place_memo = place_memo;
	}
	
	
}
