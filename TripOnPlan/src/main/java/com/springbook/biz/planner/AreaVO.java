package com.springbook.biz.planner;

public class AreaVO {
	private String area_name; // 지역
	private int area_num;
	private double area_mapy;
	private double area_mapx;
	
	
	
	public double getArea_mapy() {
		return area_mapy;
	}
	public void setArea_mapy(double area_mapy) {
		this.area_mapy = area_mapy;
	}
	public double getArea_mapx() {
		return area_mapx;
	}
	public void setArea_mapx(double area_mapx) {
		this.area_mapx = area_mapx;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public int getArea_num() {
		return area_num;
	}
	public void setArea_num(int area_num) {
		this.area_num = area_num;
	}
	
	@Override
	public String toString() {
		return "AreaVO [area_name=" + area_name + ", area_num=" + area_num + ", area_mapy=" + area_mapy + ", area_mapx="
				+ area_mapx + "]";
	}
	
}
