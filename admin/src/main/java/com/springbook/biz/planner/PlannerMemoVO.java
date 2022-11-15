package com.springbook.biz.planner;

public class PlannerMemoVO {

	private int planner_no;
	private String user_id;
	private int memo_day;
	private String memo_content;
	
	

	@Override
	public String toString() {
		return "PlannerMemoVO [planner_no=" + planner_no + ", user_id=" + user_id + ", memo_day=" + memo_day
				+ ", memo_content=" + memo_content + "]";
	}
	public int getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(int planner_no) {
		this.planner_no = planner_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getMemo_day() {
		return memo_day;
	}
	public void setMemo_day(int memo_day) {
		this.memo_day = memo_day;
	}
	public String getMemo_content() {
		return memo_content;
	}
	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}
	
	
}
