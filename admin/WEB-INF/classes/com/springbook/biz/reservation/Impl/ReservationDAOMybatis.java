package com.springbook.biz.reservation.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.reservation.ReservationVO;

@Repository
public class ReservationDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

//	관리자 예약 정보 수정	
	public void manage_reservUpdate(ReservationVO rvo) {
		System.out.println("manage_reservUpdate: " + rvo);
		mybatis.update("ReservationDAO.manage_reservUpdate", rvo);
	}

//	관리자 예약 삭제
	public void manage_reservDelete(ReservationVO rvo) {
		System.out.println("manage_reservDelete: ");
		mybatis.delete("ReservationDAO.manage_reservDelete", rvo);
	}

// 	관리자 예약 조회	
	public List<ReservationVO> manage_reservList(ReservationVO rvo) {
		System.out.println("manage_reservList: " + rvo);
		return mybatis.selectList("ReservationDAO.manage_reservList", rvo);
	}

//  관리자 예약 상세
	public ReservationVO manage_reservInfo(ReservationVO rvo) {
		System.out.println("manage_reservInfo: " + rvo);
		return mybatis.selectOne("ReservationDAO.manage_reservInfo", rvo);
	}

// 	관리자 예약 개수
	public int totalReservationListCnt(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 목록 총 개수 조회 totalReservationListCnt 기능 처리");
		return mybatis.selectOne("ReservationDAO.totalReservationListCnt", rvo);
	}

}
