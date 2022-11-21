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
	
	//(회원) 숙소 예약 등록
	public void insertReservation(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 등록 insertReservation 기능 처리");
		mybatis.insert("ReservationDAO.insertReservation", rvo);
	}
	
	//(회원) 숙소 예약 수정 GET 요청 마이페이지-예약현황 이동 기준 (조회일 기준으로 예약 변경 가능/예약 변경 불가능/예약 취소/리뷰 쓰기 가능 업데이트)
	public void updateReservationGet(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 수정 updateReservationGet 기능 처리");
		mybatis.update("ReservationDAO.updateReservationGet", rvo);
	}
	
	//(회원) 숙소 예약 수정 Post 요청 수정 폼 페이지 제출 기준 (예약자 기본정보 수정)
	public void updateReservationPost(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 수정 updateReservationPost 기능 처리");
		mybatis.update("ReservationDAO.updateReservationPost", rvo);
	}
	
	//(회원) 숙소 예약 결제 취소 (예약 상태를 "3"으로 변경)
	public void updateReservationCancel(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 결제 취소 updateReservationCancel 기능 처리");
		mybatis.update("ReservationDAO.updateReservationCancel", rvo);
	}
	
	//(회원) 숙소 예약 삭제 (일정 추가 및 축소 등 크게 변경의 경우 취소후 재예약 해야함)
	public void deleteReservation(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 삭제 deleteReservation 기능 처리");
		mybatis.delete("ReservationDAO.deleteReservation", rvo);
	}
	
	//(회원) 주어진 유저 아이디 하나에 해당하는 숙소 예약 목록 조회 (마이페이지 - 예약현황)
	public List<ReservationVO> getReservationList(ReservationVO rvo) {
		System.out.println("마이바티스 유저 아이디 숙소 예약 리스트 조회 getReservationList 기능 처리");
		return mybatis.selectList("ReservationDAO.getReservationList", rvo);
	}
	
	//(회원) 주어진 유저 아이디 하나에 해당하는 전체 숙소 예약 목록 개수 조회
	public int totalReservationListCnt(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 예약 목록 총 개수 조회 totalReservationListCnt 기능 처리");
		return mybatis.selectOne("ReservationDAO.totalReservationListCnt", rvo);
	}

	//(회원) 내가 결제한 숙소 확인
	public ReservationVO check(ReservationVO rvo) {
		System.out.println("마이바티스 숙소 체크");
		return mybatis.selectOne("ReservationDAO.getReservationList", rvo);
	}
	//(호스트) 내 숙소 예약현황 조회 (현성규)
	public List<ReservationVO> getReservationListForHost(ReservationVO rvo){
		System.out.println("마이바티스"+rvo);
		return mybatis.selectList("ReservationDAO.getReservationListForHost", rvo);
	}

	//(호스트) 전체 예약 목록 개수 조회 (현성규)
	public int totalReservationListCntForHost(ReservationVO rvo) {
		return mybatis.selectOne("ReservationDAO.totalReservationListcntForHost", rvo);
	}
	
	//(회원) 예약 1건에 대해 상세 조회
	public ReservationVO getReservationOneDetail(ReservationVO rvo) {
		System.out.println("마이바티스 예약 1건 상세 조회 getReservationOneDetail 기능 처리");
		return mybatis.selectOne("ReservationDAO.getReservationOneDetail", rvo);
	}

	public void updateReservationDetail(ReservationVO rvo) {
		System.out.println("마이바티스 내정보 수정 처리");
		mybatis.update("ReservationDAO.updateReservationDetail", rvo);
	}
}
