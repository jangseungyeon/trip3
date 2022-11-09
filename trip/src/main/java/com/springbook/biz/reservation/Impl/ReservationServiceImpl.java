package com.springbook.biz.reservation.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDAOMybatis ReservationDAO;
	
	//(회원) 숙소 예약 등록
	@Override
	public void insertReservation(ReservationVO rvo) {
		ReservationDAO.insertReservation(rvo);
	}

	//(회원) 숙소 예약 수정 GET 요청 마이페이지-예약현황 이동 기준 (조회일 기준으로 예약 변경 가능/예약 변경 불가능/예약 취소/리뷰 쓰기 가능 업데이트)
	@Override
	public void updateReservationGet(ReservationVO rvo) {
		ReservationDAO.updateReservationGet(rvo);
	}
	
	//(회원) 숙소 예약 수정 Post 요청 수정 폼 페이지 제출 기준 (예약자 기본정보 수정)
	@Override
	public void updateReservationPost(ReservationVO rvo) {
		ReservationDAO.updateReservationPost(rvo);
	}
	
	//(회원) 숙소 예약 결제 취소 (예약 상태를 "3"으로 변경)
	@Override
	public void updateReservationCancel(ReservationVO rvo) {
		ReservationDAO.updateReservationCancel(rvo);
	}

	//(회원) 숙소 예약 삭제 (일정 추가 및 축소 등 크게 변경의 경우 취소후 재예약 해야함)
	@Override
	public void deleteReservation(ReservationVO rvo) {
		ReservationDAO.deleteReservation(rvo);
	}

	//(회원) 주어진 유저 아이디 하나에 해당하는 숙소 예약 리스트 조회
	@Override
	public List<ReservationVO> getReservationList(ReservationVO rvo) {
		return ReservationDAO.getReservationList(rvo);
	}

	//(회원) 주어진 유저 아이디 하나에 해당하는 숙소 예약 총 갯수 조회
	@Override
	public int totalReservationListCnt(ReservationVO rvo) {
		return ReservationDAO.totalReservationListCnt(rvo);
	}
	
	//(회원) 내가 결제한 숙소 예약 확인
	@Override
	public ReservationVO check(ReservationVO rvo) {
		System.out.println(rvo);
		return ReservationDAO.check(rvo);
	}
	
	//(호스트) 내 숙소 예약현황 조회 (헌성규)
	@Override
	public List<ReservationVO> getReservationListForHost(ReservationVO rvo) {
	return ReservationDAO.getReservationListForHost(rvo);
	}
	
	@Override
	//(호스트) 내 숙소 예약현황 조회 총 개수 (현성규)
	public int totalReservationListCntForHost(ReservationVO rvo) {
		return ReservationDAO.totalReservationListCntForHost(rvo);
	}
	
	//(회원) 예약 1건에 대해 상세 조회
	@Override
	public ReservationVO getReservationOneDetail(ReservationVO rvo) {
		return ReservationDAO.getReservationOneDetail(rvo);
	}
	
	@Override
	public void updateReservationDetail(ReservationVO rvo) {
		ReservationDAO.updateReservationDetail(rvo);
	}
}
