package com.springbook.biz.room.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.room.RoomVO;
import com.springbook.biz.user.UserVO;

@Repository
public class RoomDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 관리자 숙소 조회
	public List<RoomVO> manage_roomList(RoomVO rvo) {
		System.out.println("마이바티스 숙소 조회 manage_roomList 기능 처리");
		return mybatis.selectList("RoomDAO.manage_roomList");
	}
	
	// 관리자 숙소 상세 조회
	public RoomVO manage_roomInfo(RoomVO rvo) {
		System.out.println("마이바티스 숙소 상세 조회 manage_roomInfo: " + rvo);
		return mybatis.selectOne("RoomDAO.manage_roomInfo", rvo);
	}

	// 관리자 숙소 수정
	public void manage_updateRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 수정 manage_updateRoom 기능 처리");
		mybatis.update("RoomDAO.manage_updateRoom", rvo);
	}
	
	// 관리자 숙소 삭제
	public void manage_deleteRoom(RoomVO rvo) {
		System.out.println("마이바티스 숙소 삭제 manage_deleteRoom 기능 처리");
		mybatis.delete("RoomDAO.manage_deleteRoom", rvo);
	}
	
	
	
	
}
