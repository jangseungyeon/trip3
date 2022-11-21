package com.springbook.biz.planner;

public class PlaceVO {
	
	private String planner_no;
	private String user_id;
	private String planner_date;
	private String place_name;
	private String mapy;
	private String mapx;
	private String img;
	private String addr;
	
	public String getPlanner_no() {
		return planner_no;
	}
	public void setPlanner_no(String planner_no) {
		this.planner_no = planner_no;
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
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Override
	public String toString() {
		return "PlaceVO [planner_no=" + planner_no + ", user_id=" + user_id + ", planner_date=" + planner_date
				+ ", place_name=" + place_name + ", mapy=" + mapy + ", mapx=" + mapx + ", img=" + img + ", addr=" + addr + "]";
	}
	
	
	
	
	
}
