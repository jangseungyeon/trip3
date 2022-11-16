package com.springbook.biz.reservation;

public class ReservationVO {
	private String res_id;	//예약 번호
	private String user_id;	//손님 아이디
	private String imp_uid;	//결제 고유 ID
	private String merchant_uid;	//상점가 ID (merchant_지금시간)
	private String res_name; //손님 이름
	private String res_tel;	//손님 전화번호
	private String res_email;	//손님 이메일
	private String host_id;	//업주 아이디
	private String room_id;	//숙소 아이디
	private String room_name;	//숙소명
	private String room_img;		//숙소 이미지 파일명
	private String pay_date;	//결제 날짜
	private String pay_amount;	//결제금액
	private String res_num;	//예약 인원
	//수정 폼으로 예약 수정/변경할때마다 카운트 감소 (0되면 이제 변경 불가)
	private String res_status = "0";	//예약상태 (DB 디폴트 초기 값 0)
	//예약 상태 "0" = 예약 변경 가능, "1" = 예약 변경 불가능
	private String res_checkin;	//체크인 날짜
	private String res_checkout;	//체크아웃 날짜
	private String res_ci3_ok = "true";		//오늘 날짜 기준으로 계산 결과 체크인 날짜 3일 이상 => 예약 가능 기준점 변수
	//res_ci3_ok true일때 예약 변경 가능, false일때 예약 변경 불가능
	private String res_co_ok = "false";		//오늘 날짜 기준으로 계산 결과 체크아웃 날짜보다 경과 => 리뷰 쓰기 가능 기준점 변수
	//res_co_ok false일때 리뷰 쓰기 불가능, true일때 리뷰 쓰기 가능
	private int offset;	//페이징 처리에서 페이지 바꿀때마다 변하는, 맨 처음부터 데이터 건너뛰는 갯수 <= pagingVO에서 조정
	
	
	public String getRes_ci3_ok() {
		return res_ci3_ok;
	}
	public void setRes_ci3_ok(String res_ci3_ok) {
		this.res_ci3_ok = res_ci3_ok;
	}
	public String getRes_co_ok() {
		return res_co_ok;
	}
	public void setRes_co_ok(String res_co_ok) {
		this.res_co_ok = res_co_ok;
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
	
	@Override
	public String toString() {
		return "ReservationVO [res_id=" + res_id + ", user_id=" + user_id + ", imp_uid=" + imp_uid + ", merchant_uid="
				+ merchant_uid + ", res_name=" + res_name + ", res_tel=" + res_tel + ", res_email=" + res_email
				+ ", host_id=" + host_id + ", room_id=" + room_id + ", room_name=" + room_name + ", room_img="
				+ room_img + ", pay_date=" + pay_date + ", pay_amount=" + pay_amount + ", res_num=" + res_num
				+ ", res_status=" + res_status + ", res_checkin=" + res_checkin
				+ ", res_checkout=" + res_checkout + ", res_ci3_ok=" + res_ci3_ok + ", res_co_ok=" + res_co_ok
				+ ", offset=" + offset + "]";
	}
	
}
