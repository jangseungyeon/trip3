package com.springbook.biz.reservation;

import java.util.List;

public interface ReservationService {

//  관리자 예약 수정
	void manage_reservUpdate(ReservationVO rvo);

// 	관리자 예약 삭제
	void manage_reservDelete(ReservationVO rvo);

//	관리자 예약 조회
	List<ReservationVO> manage_reservList(ReservationVO rvo);

//  관리자 예약 상세
	ReservationVO manage_reservInfo(ReservationVO rvo);

//	관리자 예약 갯수
	int totalReservationListCnt(ReservationVO rvo);

}
