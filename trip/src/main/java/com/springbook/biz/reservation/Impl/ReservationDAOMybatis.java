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
	
	//숙소 예약 등록
	public void insertReservation(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 등록 insertReservation 기능 처리");
		mybatis.insert("ReservationDAO.insertReservation", rvo);
	}
	
	//숙소 수정
	public void updateReservation(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 수정 updateReservation 기능 처리");
		mybatis.update("ReservationDAO.updateReservation", rvo);
	}
	
	//숙소 삭제
	public void deleteReservation(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 삭제 deleteReservation 기능 처리");
		mybatis.delete("ReservationDAO.deleteReservation", rvo);
	}
	
	//숙소 목록 조회
	public List<ReservationVO> getReservationList(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 리스트 조회 getReservationList 기능 처리");
		return mybatis.selectList("ReservationDAO.getReservationList", rvo);
	}
	
	//전체 숙소 목록 개수 조회
	public int totalReservationListCnt(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 목록 총 개수 조회 totalReservationListCnt 기능 처리");
		return mybatis.selectOne("ReservationDAO.totalReservationListCnt", rvo);
	}

//내가 결제한 숙소 확인
	public ReservationVO check(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 체크");
		return mybatis.selectOne("ReservationDAO.getReservationList", rvo);
	}
	//호스트용 내 숙소 예약현황 조회 (현성규)
	public List<ReservationVO> getReservationListForHost(ReservationVO rvo){
		System.out.println("마이버티스"+rvo);
		return mybatis.selectList("ReservationDAO.getReservationListForHost", rvo);
	}

	//호스트용 전체 예약 목록 개수 조회 (현성규)
	public int totalReservationListCntForHost(ReservationVO rvo) {
		return mybatis.selectOne("ReservationDAO.totalReservationListcntForHost", rvo);
	}


}
