package com.springbook.biz.room.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;
import com.springbook.biz.user.UserVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAOMybatis roomDAO;
	
	// 관리자 숙소 조회
	@Override
	public List<RoomVO> manage_roomList(RoomVO rvo) {
		return roomDAO.manage_roomList(rvo);
	}
	
	// 관리자 숙소 상세 조회
	@Override
	public RoomVO manage_roomInfo(RoomVO rvo) {
		return roomDAO.manage_roomInfo(rvo);
	}

	// 관리자 숙소 수정
	@Override
	public void manage_updateRoom(RoomVO rvo) {
		roomDAO.manage_updateRoom(rvo);
	}

	// 관리자 숙소 삭제
	@Override
	public void manage_deleteRoom(RoomVO rvo) {
		roomDAO.manage_deleteRoom(rvo);
	}
	
	
	
	
	
	




	
	
}
