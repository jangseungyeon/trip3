package com.springbook.biz.room;

import java.util.List;

public interface RoomService {

	// 관리자 숙소 수정
	void manage_roomUpdate(RoomVO vo);

	// 관리자 숙소 삭제
	void manage_roomDelete(RoomVO vo);

	// 관리자 숙소 조회
	List<RoomVO> manage_roomList(RoomVO vo);

	// 관리자 숙소 상세
	RoomVO manage_roomInfo(RoomVO vo);

	// 관리자 공지 개수
	int totalRoomListCnt(RoomVO vo);
}
