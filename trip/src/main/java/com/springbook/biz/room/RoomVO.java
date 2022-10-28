package com.springbook.biz.room;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private String room_name;	//숙소 이름
	private String room_addr;	//숙소 기본 주소
	private String room_addr_detail;	//숙소 상세 주소
	private String room_id;		//숙소 아이디
	private String host_id;		//업주 아이디
	private String room_price;	//숙소 1박 가격
	private String room_img;	//숙소 이미지
	private String room_points;	//숙소 마일리지
	private String room_max;	//숙소 최대인원
	private String room_theme;	//숙소 테마 (산, 바다, 산과 바다)
	private String room_cat;	//숙소 카테고리 (펜션, 모텔, 호텔, 게스트 하우스,...)
	private String room_wifi;	//숙소 와이파이 여부
	private String room_pet;	//숙소 애완동물 동반 투숙 여부
	private String room_meal;	//숙소 조식 포함 여부
	private String room_parking; //숙소 주차장 가능 여부
	private String room_swpool; //숙소 수영장 보유 여부
	private String room_likes; //숙소 좋아요(찜) 보유수
	private String room_stars;	//숙소 별점 평균
	private MultipartFile uploadFile; // 숙소 이미지 파일 업로드할때 쓰이는 MultipartFile 변수
	private int offset;
	
	public String getRoom_addr_detail() {
		return room_addr_detail;
	}
	public void setRoom_addr_detail(String room_addr_detail) {
		this.room_addr_detail = room_addr_detail;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getRoom_addr() {
		return room_addr;
	}
	public void setRoom_addr(String room_addr) {
		this.room_addr = room_addr;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}
	public String getRoom_img() {
		return room_img;
	}
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	public String getRoom_points() {
		return room_points;
	}
	public void setRoom_points(String room_points) {
		this.room_points = room_points;
	}
	public String getRoom_max() {
		return room_max;
	}
	public void setRoom_max(String room_max) {
		this.room_max = room_max;
	}
	public String getRoom_theme() {
		return room_theme;
	}
	public void setRoom_theme(String room_theme) {
		this.room_theme = room_theme;
	}
	public String getRoom_cat() {
		return room_cat;
	}
	public void setRoom_cat(String room_cat) {
		this.room_cat = room_cat;
	}
	public String getRoom_wifi() {
		return room_wifi;
	}
	public void setRoom_wifi(String room_wifi) {
		this.room_wifi = room_wifi;
	}
	public String getRoom_pet() {
		return room_pet;
	}
	public void setRoom_pet(String room_pet) {
		this.room_pet = room_pet;
	}
	public String getRoom_meal() {
		return room_meal;
	}
	public void setRoom_meal(String room_meal) {
		this.room_meal = room_meal;
	}
	public String getRoom_parking() {
		return room_parking;
	}
	public void setRoom_parking(String room_parking) {
		this.room_parking = room_parking;
	}
	public String getRoom_swpool() {
		return room_swpool;
	}
	public void setRoom_swpool(String room_swpool) {
		this.room_swpool = room_swpool;
	}
	public String getRoom_likes() {
		return room_likes;
	}
	public void setRoom_likes(String room_likes) {
		this.room_likes = room_likes;
	}
	public String getRoom_stars() {
		return room_stars;
	}
	public void setRoom_stars(String room_stars) {
		this.room_stars = room_stars;
	}
	
	@Override
	public String toString() {
		return "RoomVO [room_name=" + room_name + ", room_id=" + room_id + ", host_id=" + host_id + ", room_price="
				+ room_price + ", room_img=" + room_img + ", room_points=" + room_points + ", room_max=" + room_max
				+ ", room_theme=" + room_theme + ", room_cat=" + room_cat + ", room_wifi=" + room_wifi + ", room_pet="
				+ room_pet + ", room_meal=" + room_meal + ", room_parking=" + room_parking + ", room_swpool="
				+ room_swpool + ", room_likes=" + room_likes + ", room_stars=" + room_stars + "]";
	}
	
}
