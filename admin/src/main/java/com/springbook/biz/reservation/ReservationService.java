package com.springbook.biz.reservation;

import java.util.List;

public interface ReservationService {

//	관리자 예약 등록 
//	int manage_reservInsert(ReservationVO rvo);	
	
//	관리자 예약 조회
	List<ReservationVO> manage_reservList(ReservationVO rvo);

//  관리자 예약 상세 조회
	ReservationVO manage_reservInfo(ReservationVO rvo);

//  관리자 예약 정보 수정
	void manage_reservUpdate(ReservationVO rvo);

// 	관리자 예약 삭제
	void manage_reservDelete(ReservationVO rvo);
	
	
	
	
	
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

}
