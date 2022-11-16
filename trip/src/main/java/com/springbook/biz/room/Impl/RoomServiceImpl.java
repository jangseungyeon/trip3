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
	
	//(업주) 숙소 등록
	@Override
	public void insertRoom(RoomVO rvo) {
		
		roomDAO.insertRoom(rvo);
		
	}

	//(업주) 숙소 수정 
	@Override
	public void updateRoom(RoomVO rvo) {

		roomDAO.updateRoom(rvo);
		
	}

	//(업주) 숙소 삭제
	@Override
	public void deleteRoom(RoomVO rvo) {
		
		roomDAO.deleteRoom(rvo);
		
	}
	
	@Override
	public void deleteRoomImageOne2(RoomVO rvo) {

		roomDAO.deleteRoomImageOne2(rvo);
		
	}

	@Override
	public void deleteRoomImageOne3(RoomVO rvo) {

		roomDAO.deleteRoomImageOne3(rvo);
	}

	@Override
	public void deleteRoomImageOne4(RoomVO rvo) {

		roomDAO.deleteRoomImageOne4(rvo);
		
	}

	@Override
	public void deleteRoomImageOne5(RoomVO rvo) {

		roomDAO.deleteRoomImageOne5(rvo);
		
	}

	//(업주, 회원) 숙소 상세 조회
	@Override
	public RoomVO getRoom(RoomVO rvo) {
		
		return roomDAO.getRoom(rvo);
	}
	
	//(업주, 회원) 숙소 여러개 정보 리스트 조회
	@Override
	public List<RoomVO> getRoomList(RoomVO rvo) {
		
		return roomDAO.getRoomList(rvo);
	}
	
	//(업주, 회원) 숙소 정보 전체 갯수 조회
	@Override
	public int totalRoomListCnt(RoomVO rvo) {
		// TODO Auto-generated method stub
		return roomDAO.totalRoomListCnt(rvo);
	}
	
	//(회원) 장승연 숙소 목록
	@Override
	public List<RoomVO> u_getRoomList(RoomVO rvo) {
		return roomDAO.getRoomList(rvo);
	}
	
	//(회원) 장승연 숙소 검색필터
	@Override
	public List<RoomVO> u_searchRoomList(RoomVO rvo) {
		return roomDAO.u_searchRoomList(rvo);
	}
	
	//메인 페이지 숙소 리스트
	@Override
	public List<RoomVO> mainRoomList() {
		return roomDAO.mainRoomList();
	}

	@Override
	public List<RoomVO> mainRoomThemeList(RoomVO vo) {
		return roomDAO.mainRoomThemeList(vo);
	}

	//(회원) 숙소 좋아요 등록/좋아요 해제
	@Override
	public void updateLikeRoom(RoomVO rvo) {
		roomDAO.updateLikeRoom(rvo);
	}

	@Override
	public void updateStarsRoom(RoomVO rvo) {
		roomDAO.updateStarsRoom(rvo);
		
	}
	
}
