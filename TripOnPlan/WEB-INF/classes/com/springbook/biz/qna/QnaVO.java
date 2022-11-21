package com.springbook.biz.qna;

public class QnaVO {
	
	private int qna_num;//질문번호,멤버필드
	private int qna_views;//답변여부(완료1,미완료0),멤버필드
	private String qna_user_id;//질문자아이디,멤버필드
	private String qna_regdate;//질문한날짜,멤버필드
	private String qna_content;//질문한내용,멤버필드
	private String qna_user_email;//사용자이메일주소,멤버필드
	private String qna_admin_id;//관리자아이디,멤버필드
	private String qna_title;//질문제목,멤버필드
	private String qna_answer;//답변내용(여부),멤버필드
	private String qna_answer_date;//답변한날짜,멤버필드
	
	
	public int getQna_views() {
		return qna_views;
	}
	public void setQna_views(int qna_views) {
		this.qna_views = qna_views;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public int getQna_VIEWS() {
		return qna_views;
	}
	public void setQna_VIEWS(int qna_VIEWS) {
		this.qna_views = qna_VIEWS;
	}

    public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_user_id() {
		return qna_user_id;
	}

	public void setQna_user_id(String qna_user_id) {
		this.qna_user_id = qna_user_id;
	}

	public String getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	
	public String getQna_user_email() {
		return qna_user_email;
	}

	public void setQna_user_email(String qna_user_email) {
		this.qna_user_email = qna_user_email;
	}

	public String getQna_admin_id() {
		return qna_admin_id;
	}

	public void setQna_admin_id(String qna_admin_id) {
		this.qna_admin_id = qna_admin_id;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public String getQna_answer_date() {
		return qna_answer_date;
	}

	public void setQna_answer_date(String qna_answer_date) {
		this.qna_answer_date = qna_answer_date;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_num=" + qna_num + ", qna_views=" + qna_views + ", qna_user_id=" + qna_user_id
				+ ", qna_regdate=" + qna_regdate + ", qna_content=" + qna_content + ", qna_user_email=" + qna_user_email
				+ ", qna_admin_id=" + qna_admin_id + ", qna_title=" + qna_title + ", qna_answer=" + qna_answer
				+ ", qna_answer_date=" + qna_answer_date + "]";
	}

	




}
