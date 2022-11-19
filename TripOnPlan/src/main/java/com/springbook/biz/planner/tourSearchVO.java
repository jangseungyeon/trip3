package com.springbook.biz.planner;

public class tourSearchVO {
	private String title;
	private String addr1;
	private String addr2;
	private String mapx;
	private String mapy;
	private String firstimage;
	private int pageNum = 1;
	private String keyword = "";
	private int kate = 12;
	private int date = 0;
	
	
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public int getKate() {
		return kate;
	}
	public void setKate(int kate) {
		this.kate = kate;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	@Override
	public String toString() {
		return "tourSearchVO [title=" + title + ", addr1=" + addr1 + ", addr2=" + addr2 + ", mapx=" + mapx + ", mapy="
				+ mapy + ", firstimage=" + firstimage + "]";
	}
	
	
}
