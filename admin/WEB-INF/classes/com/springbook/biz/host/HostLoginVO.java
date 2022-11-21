package com.springbook.biz.host;

public class HostLoginVO {
	private int host_count;
	private int host_avg_income;
	private int host_max_income;
	private String best_room_name;
	private String best_room_img;
	private int best_room_income;
	private int reservation_count_last10days;
	private int reservation_count;
	
	public int getHost_count() {
		return host_count;
	}
	public void setHost_count(int host_count) {
		this.host_count = host_count;
	}
	public int getHost_avg_income() {
		return host_avg_income;
	}
	public void setHost_avg_income(int host_avg_income) {
		this.host_avg_income = host_avg_income;
	}
	public int getHost_max_income() {
		return host_max_income;
	}
	public void setHost_max_income(int host_max_income) {
		this.host_max_income = host_max_income;
	}
	public String getBest_room_name() {
		return best_room_name;
	}
	public void setBest_room_name(String best_room_name) {
		this.best_room_name = best_room_name;
	}
	public String getBest_room_img() {
		return best_room_img;
	}
	public void setBest_room_img(String best_room_img) {
		this.best_room_img = best_room_img;
	}
	public int getBest_room_income() {
		return best_room_income;
	}
	public void setBest_room_income(int best_room_income) {
		this.best_room_income = best_room_income;
	}
	public int getReservation_count_last10days() {
		return reservation_count_last10days;
	}
	public void setReservation_count_last10days(int reservation_count_last10days) {
		this.reservation_count_last10days = reservation_count_last10days;
	}
	public int getReservation_count() {
		return reservation_count;
	}
	public void setReservation_count(int reservation_count) {
		this.reservation_count = reservation_count;
	}

	
}
