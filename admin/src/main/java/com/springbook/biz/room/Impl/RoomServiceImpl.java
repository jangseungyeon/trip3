package com.springbook.biz.room.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDAOMybatis roomDAO;

	// 관리자 숙소 수정
	@Override
	public void manage_roomUpdate(RoomVO vo) {
		roomDAO.manage_roomUpdate(vo);
	}
	
	// 관리자 숙소 삭제
	@Override
	public void manage_roomDelete(RoomVO vo) {
		roomDAO.manage_roomDelete(vo);
	}
	
	// 관리자 숙소 조회
	@Override
	public List<RoomVO> manage_roomList(RoomVO vo) {
		return roomDAO.manage_roomList(vo);
	}

	// 관리자 숙소 상세
	@Override
	public RoomVO manage_roomInfo(RoomVO vo) {
		return roomDAO.manage_roomInfo(vo);
	}

	// 관리자 숙소 개수
	@Override
	public int totalRoomListCnt(RoomVO vo) {
		return roomDAO.totalRoomListCnt(vo);
	}

}
