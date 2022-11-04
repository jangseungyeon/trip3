package com.springbook.biz.reservation;

import java.util.List;

public interface ReservationService {
	
	//숙소 예약 등록
	void insertReservation(ReservationVO rvo);
	
	//숙소 예약 수정
	void updateReservation(ReservationVO rvo);
	
	//숙소 예약 삭제
	void deleteReservation(ReservationVO rvo);
	
	//숙소 예약 리스트 조회
	List<ReservationVO> getReservationList(ReservationVO rvo);
	
	//숙소 예약 총 갯수 조회
	int totalReservationListCnt(ReservationVO rvo);


//내가 결제한 숙소 확인
	ReservationVO check(ReservationVO rvo);

	//호스트용 내 숙소 예약현황 조회 (헌성규)
	List<ReservationVO> getReservationListForHost(ReservationVO rvo);

	//호스트용 숙소 예약 총 개수 조회 (현성규)
	int totalReservationListCntForHost(ReservationVO rvo);
	
}
