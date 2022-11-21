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

	// 관리자 예약 수정
	@Override
	public void manage_reservUpdate(ReservationVO rvo) {
		ReservationDAO.manage_reservUpdate(rvo);
	}

	// 관리자 예약 삭제
	@Override
	public void manage_reservDelete(ReservationVO rvo) {
		ReservationDAO.manage_reservDelete(rvo);
	}

	// 관리자 예약 조회
	@Override
	public List<ReservationVO> manage_reservList(ReservationVO rvo) {
		return ReservationDAO.manage_reservList(rvo);
	}

	// 관리자 예약 상세
	@Override
	public ReservationVO manage_reservInfo(ReservationVO rvo) {
		return ReservationDAO.manage_reservInfo(rvo);
	}

//	관리자 예약 개수
	@Override
	public int totalReservationListCnt(ReservationVO rvo) {
		return ReservationDAO.totalReservationListCnt(rvo);
	}

}
