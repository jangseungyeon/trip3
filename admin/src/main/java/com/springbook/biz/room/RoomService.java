package com.springbook.biz.room;

import java.util.List;

public interface RoomService {
	
		
	// 관리자 숙소 조회
	List<RoomVO> manage_roomList(RoomVO rvo);
	
	// 관리자 숙소 상세 조회
	RoomVO manage_roomInfo(RoomVO rvo);
	
	// 관리자 숙소 수정 
	void manage_updateRoom(RoomVO rvo);
	
	// 관리자 숙소 삭제
	void manage_deleteRoom(RoomVO rvo);
	
	

	
}
