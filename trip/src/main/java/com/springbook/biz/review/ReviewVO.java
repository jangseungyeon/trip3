package com.springbook.biz.review;
import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private String review_id;
	private String room_name;
	private String room_id;
	private String host_id;
	private String user_id;
	private String review_content;
	private String review_img;
	private double star_point;
	private String write_date;
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	private MultipartFile review_img_uploadFile;
	
	public MultipartFile getReview_img_uploadFile() {
		return review_img_uploadFile;
	}
	public void setReview_img_uploadFile(MultipartFile review_img_uploadFile) {
		this.review_img_uploadFile = review_img_uploadFile;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public double getStar_point() {
		return star_point;
	}
	public void setStar_point(double star_point) {
		this.star_point = star_point;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_id=" + review_id + ", room_name=" + room_name + ", room_id=" + room_id + ", host_id="
				+ host_id + ", user_id=" + user_id + ", review_content=" + review_content + ", review_img=" + review_img
				+ ", star_point=" + star_point + ", write_date=" + write_date + ", review_img_uploadFile="
				+ review_img_uploadFile + "]";
	}
}
