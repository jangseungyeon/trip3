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

	// 관리자 숙소 수정
	public void manage_roomUpdate(RoomVO vo) {
		System.out.println("마이바티스 숙소 수정 manage_roomUpdate 기능 처리");
		mybatis.update("RoomDAO.manage_roomUpdate", vo);
	}

	// 관리자 숙소 삭제
	public void manage_roomDelete(RoomVO vo) {
		System.out.println("마이바티스 숙소 삭제 manage_roomDelete 기능 처리");
		mybatis.delete("RoomDAO.manage_roomDelete", vo);
	}

	// 관리자 숙소 조회
	public List<RoomVO> manage_roomList(RoomVO vo) {
		System.out.println("마이바티스 숙소 조회 manage_roomList 기능 처리");
		return mybatis.selectList("RoomDAO.manage_roomList", vo);
	}

	// 관리자 숙소 상세 조회
	public RoomVO manage_roomInfo(RoomVO vo) {
		System.out.println("마이바티스 숙소 상세 조회 manage_roomInfo: " + vo);
		return mybatis.selectOne("RoomDAO.manage_roomInfo", vo);
	}

	// 관리자 공지 개수
	public int totalRoomListCnt(RoomVO vo) {
		System.out.println("totalRoomListCnt() 기능처리");
		return mybatis.selectOne("RoomDAO.totalRoomListCnt", vo);
	}

}
