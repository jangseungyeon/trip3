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

	// 관리자 예약 등록
//	@Override
//	public int manage_reservInsert(ReservationVO rvo) {
//		return ReservationDAO.manage_reservInsert(rvo);
//	}
	
	// 관리자 예약 조회
	@Override
	public List<ReservationVO> manage_reservList(ReservationVO rvo) {
		return ReservationDAO.manage_reservList(rvo);
	}

	// 관리자 예약 상세 조회
	@Override
	public ReservationVO manage_reservInfo(ReservationVO rvo) {
		return ReservationDAO.manage_reservInfo(rvo);
	}

	// 관리자 예약 정보 수정
	@Override
	public void manage_reservUpdate(ReservationVO rvo) {
		ReservationDAO.manage_reservUpdate(rvo);
	}
	
	// 관리자 예약 삭제
	@Override
	public void manage_reservDelete(ReservationVO rvo) {
		ReservationDAO.manage_reservDelete(rvo);
	}

	
	
	
	@Override
	public void insertReservation(ReservationVO rvo) {
		ReservationDAO.insertReservation(rvo);
	}

	@Override
	public void updateReservation(ReservationVO rvo) {
		ReservationDAO.updateReservation(rvo);
	}

	@Override
	public void deleteReservation(ReservationVO rvo) {
		ReservationDAO.deleteReservation(rvo);
	}

	@Override
	public List<ReservationVO> getReservationList(ReservationVO rvo) {
		return ReservationDAO.getReservationList(rvo);
	}

	@Override
	public int totalReservationListCnt(ReservationVO rvo) {
		return ReservationDAO.totalReservationListCnt(rvo);
	}

	@Override
	public ReservationVO check(ReservationVO rvo) {
		System.out.println(rvo);
		return ReservationDAO.check(rvo);
	}


}
