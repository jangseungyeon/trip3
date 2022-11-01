package com.springbook.biz.room.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAOMybatis roomDAO;
	
	//숙소 등록
	@Override
	public void insertRoom(RoomVO rvo) {
		
		roomDAO.insertRoom(rvo);
		
	}

	//숙소 수정
	@Override
	public void updateRoom(RoomVO rvo) {

		roomDAO.updateRoom(rvo);
		
	}

	//숙소 삭제
	@Override
	public void deleteRoom(RoomVO rvo) {
		
		roomDAO.deleteRoom(rvo);
		
	}

	//숙소 상세 조회
	@Override
	public RoomVO getRoom(RoomVO rvo) {
		
		return roomDAO.getRoom(rvo);
	}
	
	//숙소 여러개 정보 리스트 조회
	@Override
	public List<RoomVO> getRoomList(RoomVO rvo) {
		
		return roomDAO.getRoomList(rvo);
	}
	
	//숙소 정보 전체 갯수 조회
	@Override
	public int totalRoomListCnt(RoomVO rvo) {
		// TODO Auto-generated method stub
		return roomDAO.totalRoomListCnt(rvo);
	}
	

	
}
