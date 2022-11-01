package com.springbook.biz.room.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.room.RoomVO;

@Repository
public class RoomDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//숙소 등록
	public void insertRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 등록 insertRoom 기능 처리");
		mybatis.insert("RoomDAO.insertRoom", rvo);
	}
	
	//숙소 수정
	public void updateRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 수정 updateRoom 기능 처리");
		mybatis.update("RoomDAO.updateRoom", rvo);
	}
	
	//숙소 삭제
	public void deleteRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 삭제 deleteRoom 기능 처리");
		mybatis.delete("RoomDAO.deleteRoom", rvo);
	}
	
	//숙소 상세 조회
	public RoomVO getRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 상세 조회 getRoom 기능 처리");
		return (RoomVO) mybatis.selectOne("RoomDAO.getRoom", rvo);
	}
	
	//숙소 목록 조회
	public List<RoomVO> getRoomList(RoomVO rvo) {
		System.out.println("마이바티스 숙소 목록 조회 getRoomList 기능 처리");
		return mybatis.selectList("RoomDAO.getRoomList", rvo);
	}
	
	//전체 숙소 목록 개수 조회
	public int totalRoomListCnt(RoomVO rvo) {
		System.out.println("마이바티스 전체 숙소 목록 개수 조회 totalRoomListCnt 기능 처리");
		return mybatis.selectOne("RoomDAO.totalRoomListCnt", rvo);
	}
	
}
