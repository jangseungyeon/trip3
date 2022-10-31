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
