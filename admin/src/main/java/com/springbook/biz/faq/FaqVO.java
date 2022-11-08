package com.springbook.biz.faq;

public class FaqVO {
	private int faq_no;
	private String faq_title;
	private String faq_regdate;
	private String faq_manage_id;
	private String faq_content;
	private String faq_views;

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_regdate() {
		return faq_regdate;
	}

	public void setFaq_regdate(String faq_regdate) {
		this.faq_regdate = faq_regdate;
	}

	public String getFaq_manage_id() {
		return faq_manage_id;
	}

	public void setFaq_manage_id(String faq_manage_id) {
		this.faq_manage_id = faq_manage_id;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_views() {
		return faq_views;
	}

	public void setFaq_views(String faq_views) {
		this.faq_views = faq_views;
	}

	@Override
	public String toString() {
		return "BoardVO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_regdate=" + faq_regdate
				+ ", faq_manage_id=" + faq_manage_id + ", faq_content=" + faq_content + ", faq_views=" + faq_views
				+ "]";
	}
}