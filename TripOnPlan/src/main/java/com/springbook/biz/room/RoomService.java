package com.springbook.biz.room;

import java.util.List;

public interface RoomService {
	
	//(업주) 숙소 등록
	void insertRoom(RoomVO rvo);
	
	//(업주) 숙소 수정 
	void updateRoom(RoomVO rvo);
	
	//(업주) 숙소 이미지 삭제
	void deleteRoomImageOne2(RoomVO rvo);
	
	void deleteRoomImageOne3(RoomVO rvo);
	
	void deleteRoomImageOne4(RoomVO rvo);
	
	void deleteRoomImageOne5(RoomVO rvo);
	
	//(업주) 숙소 삭제
	void deleteRoom(RoomVO rvo);
	
	//(업주, 회원) 숙소 상세 조회
	RoomVO getRoom(RoomVO rvo);
	
	//(업주, 회원) 숙소 여러개 정보 리스트 조회
	List<RoomVO> getRoomList(RoomVO rvo);
	
	//(업주, 회원) 숙소 정보 전체 갯수 조회
	int totalRoomListCnt(RoomVO rvo);
	
	//(회원) 장승연 숙소검색목록
	List<RoomVO> u_getRoomList(RoomVO rvo);
	
	//(회원) 장승연 숙소검색필터
	List<RoomVO> u_searchRoomList(RoomVO rvo);

	//메인페이지 숙소 검색
	List<RoomVO> mainRoomList();
	
	//메인페이지 숙소 상세 검색
	List<RoomVO> mainRoomThemeList(RoomVO vo);
	
	//(회원) 숙소 좋아요 등록/좋아요 해제
	void updateLikeRoom(RoomVO rvo);
	
	//(회원) 숙소 별점 업데이트
	void updateStarsRoom(RoomVO rvo);
	
}
