package com.springbook.biz.room.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springbook.biz.room.RoomVO;

public class RoomRowMapper implements RowMapper<RoomVO> {

	@Override
	public RoomVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		RoomVO rvo = new RoomVO();
		rvo.setRoom_name(rs.getString("room_name"));
		rvo.setRoom_addr(rs.getString("room_addr"));
		rvo.setRoom_addr_detail(rs.getString("room_addr_detail"));
		rvo.setRoom_id(rs.getString("room_id"));
		rvo.setHost_id(rs.getString("host_id"));
		rvo.setRoom_price(rs.getString("room_price"));
		rvo.setRoom_img(rs.getString("room_img"));
		rvo.setRoom_points(rs.getString("room_points"));
		rvo.setRoom_max(rs.getString("room_max"));
		rvo.setRoom_theme(rs.getString("room_theme"));
		rvo.setRoom_cat(rs.getString("room_cat"));
		rvo.setRoom_wifi(rs.getString("room_wifi"));
		rvo.setRoom_pet(rs.getString("room_pet"));
		rvo.setRoom_meal(rs.getString("room_meal"));
		rvo.setRoom_parking(rs.getString("room_parking"));
		rvo.setRoom_swpool(rs.getString("room_swpool"));
		rvo.setRoom_likes(rs.getString("room_likes"));
		rvo.setRoom_stars(rs.getString("room_stars"));
		
		System.out.println("rowNum: " + rowNum + "/ room: " + rvo);
		
		return rvo;
	}

}
