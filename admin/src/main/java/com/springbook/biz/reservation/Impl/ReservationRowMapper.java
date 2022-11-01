package com.springbook.biz.reservation.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springbook.biz.reservation.ReservationVO;

public class ReservationRowMapper implements RowMapper<ReservationVO> {
	
	@Override
	public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReservationVO rvo = new ReservationVO();
		rvo.setRes_id(rs.getString("res_id"));
		rvo.setUser_id(rs.getString("user_id"));
		rvo.setHost_id(rs.getString("host_id"));
		rvo.setRoom_id(rs.getString("room_id"));
		rvo.setRoom_name(rs.getString("room_name"));
		rvo.setRoom_img(rs.getString("room_img"));
		rvo.setPay_date(rs.getString("pay_date"));
		rvo.setPay_amount(rs.getString("pay_amount"));
		rvo.setRes_num(rs.getString("res_num"));
		rvo.setRes_count(rs.getInt("res_count"));
		rvo.setRes_status(rs.getString("res_status"));
		rvo.setRes_checkin(rs.getString("res_checkin"));
		rvo.setRes_checkout(rs.getString("res_checkout"));
		
		System.out.println("rowNum: " + rowNum + "/ reservation: " + rvo);
		
		return rvo;
	}
}
