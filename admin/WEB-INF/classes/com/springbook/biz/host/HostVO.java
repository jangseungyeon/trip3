package com.springbook.biz.host;

public class HostVO {
	private String host_id;
	private String host_bizname;
	private String host_pw;
	private String host_name;
	private String host_birth;
	private String host_email;
	private String host_phone;
	private String host_addr1;
	private String host_addr2;
	private String host_status;
	private String host_biznum;
	private String host_bizimg;
	private String host_bank;
	private String host_banknum;

	private String searchCondition;
	private String searchKeyword;

	private int offset;

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

	public String getHost_id() {
		return host_id;
	}

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}

	public String getHost_bizname() {
		return host_bizname;
	}

	public void setHost_bizname(String host_bizname) {
		this.host_bizname = host_bizname;
	}

	public String getHost_pw() {
		return host_pw;
	}

	public void setHost_pw(String host_pw) {
		this.host_pw = host_pw;
	}

	public String getHost_name() {
		return host_name;
	}

	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}

	public String getHost_birth() {
		return host_birth;
	}

	public void setHost_birth(String host_birth) {
		this.host_birth = host_birth;
	}

	public String getHost_email() {
		return host_email;
	}

	public void setHost_email(String host_email) {
		this.host_email = host_email;
	}

	public String getHost_phone() {
		return host_phone;
	}

	public void setHost_phone(String host_phone) {
		this.host_phone = host_phone;
	}

	public String getHost_addr1() {
		return host_addr1;
	}

	public void setHost_addr1(String host_addr1) {
		this.host_addr1 = host_addr1;
	}

	public String getHost_addr2() {
		return host_addr2;
	}

	public void setHost_addr2(String host_addr2) {
		this.host_addr2 = host_addr2;
	}

	public String getHost_status() {
		return host_status;
	}

	public void setHost_status(String host_status) {
		this.host_status = host_status;
	}

	public String getHost_biznum() {
		return host_biznum;
	}

	public void setHost_biznum(String host_biznum) {
		this.host_biznum = host_biznum;
	}

	public String getHost_bizimg() {
		return host_bizimg;
	}

	public void setHost_bizimg(String host_bizimg) {
		this.host_bizimg = host_bizimg;
	}

	public String getHost_bank() {
		return host_bank;
	}

	public void setHost_bank(String host_bank) {
		this.host_bank = host_bank;
	}

	public String getHost_banknum() {
		return host_banknum;
	}

	public void setHost_banknum(String host_banknum) {
		this.host_banknum = host_banknum;
	}

	@Override
	public String toString() {
		return "HostVO [host_id=" + host_id + ", host_bizname=" + host_bizname + ", host_pw=" + host_pw + ", host_name="
				+ host_name + ", host_birth=" + host_birth + ", host_email=" + host_email + ", host_phone=" + host_phone
				+ ", host_addr1=" + host_addr1 + ", host_addr2=" + host_addr2 + ", host_status=" + host_status
				+ ", host_biznum=" + host_biznum + ", host_bizimg=" + host_bizimg + ", host_bank=" + host_bank
				+ ", host_banknum=" + host_banknum + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", offset=" + offset + "]";
	}

}
