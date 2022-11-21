package com.springbook.biz.manage;

public class ManageUserVO {

	private String manage_id;
	private String manage_pw;
	private String manage_name;
	private String manage_birth;
	private String manage_email;
	private String manage_phone;
	private String manage_grade;

	public String getManage_id() {
		return manage_id;
	}

	public void setManage_id(String manage_id) {
		this.manage_id = manage_id;
	}

	public String getManage_pw() {
		return manage_pw;
	}

	public void setManage_pw(String manage_pw) {
		this.manage_pw = manage_pw;
	}

	public String getManage_name() {
		return manage_name;
	}

	public void setManage_name(String manage_name) {
		this.manage_name = manage_name;
	}


	public String getManage_birth() {
		return manage_birth;
	}

	public void setManage_birth(String manage_birth) {
		this.manage_birth = manage_birth;
	}

	public String getManage_email() {
		return manage_email;
	}

	public void setManage_email(String manage_email) {
		this.manage_email = manage_email;
	}

	public String getManage_phone() {
		return manage_phone;
	}

	public void setManage_phone(String manage_phone) {
		this.manage_phone = manage_phone;
	}

	public String getManage_grade() {
		return manage_grade;
	}

	public void setManage_grade(String manage_grade) {
		this.manage_grade = manage_grade;
	}

	@Override
	public String toString() {
		return "ManageUserVO [manage_id=" + manage_id + ", manage_password=" + manage_pw + ", manage_name="
				+ manage_name + ", manage_birth=" + manage_birth + ", manage_email=" + manage_email + ", manage_phone="
				+ manage_phone + ", manage_grade=" + manage_grade + "]";
	}

}
