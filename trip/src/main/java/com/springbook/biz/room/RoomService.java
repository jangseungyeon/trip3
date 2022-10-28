package com.springbook.biz.room;

import java.util.List;

public interface RoomService {
	
	//숙소 등록
	void insertRoom(RoomVO rvo);
	
	//숙소 수정 
	void updateRoom(RoomVO rvo);
	
	//숙소 삭제
	void deleteRoom(RoomVO rvo);
	
	//숙소 상세 조회
	RoomVO getRoom(RoomVO rvo);
	
	//숙소 여러개 정보 리스트 조회
	List<RoomVO> getRoomList(RoomVO rvo);
	
	//숙소 정보 전체 갯수 조회
	int totalRoomListCnt(RoomVO rvo);
	
}
