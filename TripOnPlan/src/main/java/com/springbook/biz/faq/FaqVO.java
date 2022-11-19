package com.springbook.biz.faq;

import org.springframework.web.multipart.MultipartFile;

public class FaqVO {

	private int faq_no;
	private String faq_title;
	private String faq_writer;
	private String faq_content;
	private String faq_regdate;
	private int faq_cnt;

	private String filename;

	private MultipartFile uploadFile;

	private String searchCondition;
	private String searchKeyword;

	private int offset;

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

	public String getFaq_writer() {
		return faq_writer;
	}

	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_regdate() {
		return faq_regdate;
	}

	public void setFaq_regdate(String faq_regdate) {
		this.faq_regdate = faq_regdate;
	}

	public int getFaq_cnt() {
		return faq_cnt;
	}

	public void setFaq_cnt(int faq_cnt) {
		this.faq_cnt = faq_cnt;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
		return "FaqVO [faq_no=" + faq_no + ", faq_title=" + faq_title + ", faq_writer=" + faq_writer + ", faq_content="
				+ faq_content + ", faq_regdate=" + faq_regdate + ", faq_cnt=" + faq_cnt + ", filename=" + filename
				+ ", uploadFile=" + uploadFile + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", offset=" + offset + "]";
	}

}
