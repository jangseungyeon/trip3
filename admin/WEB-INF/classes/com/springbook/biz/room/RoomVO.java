package com.springbook.biz.room;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO {
	private String room_name;	//숙소 이름
	private String room_addr;	//숙소 기본 주소
	private String room_addr_detail;	//숙소 상세 주소
	private String room_desc;	//숙소 설명
	private String room_id;		//숙소 아이디
	private String host_id;		//호스트 아이디
	private String room_price;	//숙소 1박 가격
	private String room_img_no1;	//숙소 대표 이미지
	private String room_img_no2;	//숙소 서브 이미지 1
	private String room_img_no3;	//숙소 서브 이미지 2
	private String room_img_no4;	//숙소 서브 이미지 3
	private String room_img_no5;	//숙소 서브 이미지 4 
	private String room_points;	//숙소 마일리지
	private int room_max;	//숙소 최대인원
	private String room_theme;	//숙소 테마 (산, 바다, 산과 바다)
	private String room_cat;	//숙소 카테고리 (펜션, 모텔, 호텔, 게스트 하우스,...)
	private String room_wifi;	//숙소 와이파이 여부
	private String room_pet;	//숙소 애완동물 동반 투숙 여부
	private String room_meal;	//숙소 조식 포함 여부
	private String room_parking; //숙소 주차장 가능 여부
	private String room_swpool; //숙소 수영장 보유 여부
	private String room_likes; //숙소 좋아요(찜) 보유수
	private String room_stars;	//숙소 별점 평균
	private String room_min_price; //숙소 최저가
	private String room_max_price;	//숙소 최고가
	private String room_theme_m;//산
	private String room_theme_s;//바다
	private String room_theme_f;//숲
	private String room_theme_v;//계곡	//이 부분 31 ~ 36 줄 (산 ~ 도시) 까지는 숙소 목록 상세 검색을 위해 필요한 조건들
	private String room_theme_r;//강
	private String room_theme_c;//도시
	private MultipartFile room_img_no1_multi; 
	private MultipartFile room_img_no2_multi; 
	private MultipartFile room_img_no3_multi; // 숙소 이미지 파일 업로드할때 쓰이는 MultipartFile 변수
	private MultipartFile room_img_no4_multi; // room_img_no1 대표 이미지, 나머지 서브 이미지 4개
	private MultipartFile room_img_no5_multi; 
	
	private String searchCondition;
	private String searchKeyword;
	
	private int offset;

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

	public String getRoom_addr_detail() {
		return room_addr_detail;
	}

	public void setRoom_addr_detail(String room_addr_detail) {
		this.room_addr_detail = room_addr_detail;
	}

	public String getRoom_desc() {
		return room_desc;
	}

	public void setRoom_desc(String room_desc) {
		this.room_desc = room_desc;
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

	public String getRoom_img_no1() {
		return room_img_no1;
	}

	public void setRoom_img_no1(String room_img_no1) {
		this.room_img_no1 = room_img_no1;
	}

	public String getRoom_img_no2() {
		return room_img_no2;
	}

	public void setRoom_img_no2(String room_img_no2) {
		this.room_img_no2 = room_img_no2;
	}

	public String getRoom_img_no3() {
		return room_img_no3;
	}

	public void setRoom_img_no3(String room_img_no3) {
		this.room_img_no3 = room_img_no3;
	}

	public String getRoom_img_no4() {
		return room_img_no4;
	}

	public void setRoom_img_no4(String room_img_no4) {
		this.room_img_no4 = room_img_no4;
	}

	public String getRoom_img_no5() {
		return room_img_no5;
	}

	public void setRoom_img_no5(String room_img_no5) {
		this.room_img_no5 = room_img_no5;
	}

	public String getRoom_points() {
		return room_points;
	}

	public void setRoom_points(String room_points) {
		this.room_points = room_points;
	}

	public int getRoom_max() {
		return room_max;
	}

	public void setRoom_max(int room_max) {
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

	public String getRoom_min_price() {
		return room_min_price;
	}

	public void setRoom_min_price(String room_min_price) {
		this.room_min_price = room_min_price;
	}

	public String getRoom_max_price() {
		return room_max_price;
	}

	public void setRoom_max_price(String room_max_price) {
		this.room_max_price = room_max_price;
	}

	public String getRoom_theme_m() {
		return room_theme_m;
	}

	public void setRoom_theme_m(String room_theme_m) {
		this.room_theme_m = room_theme_m;
	}

	public String getRoom_theme_s() {
		return room_theme_s;
	}

	public void setRoom_theme_s(String room_theme_s) {
		this.room_theme_s = room_theme_s;
	}

	public String getRoom_theme_f() {
		return room_theme_f;
	}

	public void setRoom_theme_f(String room_theme_f) {
		this.room_theme_f = room_theme_f;
	}

	public String getRoom_theme_v() {
		return room_theme_v;
	}

	public void setRoom_theme_v(String room_theme_v) {
		this.room_theme_v = room_theme_v;
	}

	public String getRoom_theme_r() {
		return room_theme_r;
	}

	public void setRoom_theme_r(String room_theme_r) {
		this.room_theme_r = room_theme_r;
	}

	public String getRoom_theme_c() {
		return room_theme_c;
	}

	public void setRoom_theme_c(String room_theme_c) {
		this.room_theme_c = room_theme_c;
	}

	public MultipartFile getRoom_img_no1_multi() {
		return room_img_no1_multi;
	}

	public void setRoom_img_no1_multi(MultipartFile room_img_no1_multi) {
		this.room_img_no1_multi = room_img_no1_multi;
	}

	public MultipartFile getRoom_img_no2_multi() {
		return room_img_no2_multi;
	}

	public void setRoom_img_no2_multi(MultipartFile room_img_no2_multi) {
		this.room_img_no2_multi = room_img_no2_multi;
	}

	public MultipartFile getRoom_img_no3_multi() {
		return room_img_no3_multi;
	}

	public void setRoom_img_no3_multi(MultipartFile room_img_no3_multi) {
		this.room_img_no3_multi = room_img_no3_multi;
	}

	public MultipartFile getRoom_img_no4_multi() {
		return room_img_no4_multi;
	}

	public void setRoom_img_no4_multi(MultipartFile room_img_no4_multi) {
		this.room_img_no4_multi = room_img_no4_multi;
	}

	public MultipartFile getRoom_img_no5_multi() {
		return room_img_no5_multi;
	}

	public void setRoom_img_no5_multi(MultipartFile room_img_no5_multi) {
		this.room_img_no5_multi = room_img_no5_multi;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	@Override
	public String toString() {
		return "RoomVO [room_name=" + room_name + ", room_addr=" + room_addr + ", room_addr_detail=" + room_addr_detail
				+ ", room_desc=" + room_desc + ", room_id=" + room_id + ", host_id=" + host_id + ", room_price="
				+ room_price + ", room_img_no1=" + room_img_no1 + ", room_img_no2=" + room_img_no2 + ", room_img_no3="
				+ room_img_no3 + ", room_img_no4=" + room_img_no4 + ", room_img_no5=" + room_img_no5 + ", room_points="
				+ room_points + ", room_max=" + room_max + ", room_theme=" + room_theme + ", room_cat=" + room_cat
				+ ", room_wifi=" + room_wifi + ", room_pet=" + room_pet + ", room_meal=" + room_meal + ", room_parking="
				+ room_parking + ", room_swpool=" + room_swpool + ", room_likes=" + room_likes + ", room_stars="
				+ room_stars + ", room_min_price=" + room_min_price + ", room_max_price=" + room_max_price
				+ ", room_theme_m=" + room_theme_m + ", room_theme_s=" + room_theme_s + ", room_theme_f=" + room_theme_f
				+ ", room_theme_v=" + room_theme_v + ", room_theme_r=" + room_theme_r + ", room_theme_c=" + room_theme_c
				+ ", room_img_no1_multi=" + room_img_no1_multi + ", room_img_no2_multi=" + room_img_no2_multi
				+ ", room_img_no3_multi=" + room_img_no3_multi + ", room_img_no4_multi=" + room_img_no4_multi
				+ ", room_img_no5_multi=" + room_img_no5_multi + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", offset=" + offset + "]";
	}
	

	
}
