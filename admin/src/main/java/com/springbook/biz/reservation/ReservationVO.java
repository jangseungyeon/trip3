package com.springbook.biz.reservation;

public class ReservationVO {
	private String res_id; // 예약 번호
	private String user_id; // 손님 아이디
	private String imp_uid; // 아임포트 imp
	private String merchant_uid; // 아임포트 merchant
	private String res_name; // 손님 이름
	private String res_tel; // 손님 전화번호
	private String res_email; // 손님 이메일
	private String host_id; // 호스트 아이디
	private String room_id; // 숙소 아이디
	private String room_name; // 숙소명
	private String room_img; // 숙소 이미지 파일명
	private String pay_date; // 결제 날짜
	private String pay_amount; // 결제금액
	private String res_num; // 예약 인원
	private int res_count; // 변경 가능 횟수 (DB 디폴트 초기 값 3)
	private String res_status; // 예약상태 (DB 디폴트 초기 값 1)
	private String res_checkin; // 체크인 날짜
	private String res_checkout; // 체크아웃 날짜

	private int offset; // 페이징 처리에서 페이지 바꿀때마다 변하는, 맨 처음부터 데이터 건너뛰는 갯수 <= pagingVO에서 조정

	private String searchCondition;
	private String searchKeyword;

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

	public String getRes_tel() {
		return res_tel;
	}

	public void setRes_tel(String res_tel) {
		this.res_tel = res_tel;
	}

	public String getRes_email() {
		return res_email;
	}

	public void setRes_email(String res_email) {
		this.res_email = res_email;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRoom_img() {
		return room_img;
	}

	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getRes_count() {
		return res_count;
	}

	public void setRes_count(int res_count) {
		this.res_count = res_count;
	}

	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}

	public String getRes_num() {
		return res_num;
	}

	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public String getRes_checkin() {
		return res_checkin;
	}

	public void setRes_checkin(String res_checkin) {
		this.res_checkin = res_checkin;
	}

	public String getRes_checkout() {
		return res_checkout;
	}

	public void setRes_checkout(String res_checkout) {
		this.res_checkout = res_checkout;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	@Override
	public String toString() {
		return "ReservationVO [res_id=" + res_id + ", user_id=" + user_id + ", imp_uid=" + imp_uid + ", merchant_uid="
				+ merchant_uid + ", res_name=" + res_name + ", res_tel=" + res_tel + ", res_email=" + res_email
				+ ", host_id=" + host_id + ", room_id=" + room_id + ", room_name=" + room_name + ", room_img="
				+ room_img + ", pay_date=" + pay_date + ", pay_amount=" + pay_amount + ", res_num=" + res_num
				+ ", res_count=" + res_count + ", res_status=" + res_status + ", res_checkin=" + res_checkin
				+ ", res_checkout=" + res_checkout + ", offset=" + offset + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + "]";
	}

}
