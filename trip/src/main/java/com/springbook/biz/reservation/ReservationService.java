package com.springbook.biz.reservation;

import java.util.List;

import java.util.List;

public interface ReservationService {
	
	//(회원) 숙소 예약 등록
	void insertReservation(ReservationVO rvo);
	
	//(회원) 숙소 예약 수정 GET 요청 마이페이지-예약현황 이동 기준 (조회일 기준으로 예약 변경 가능/예약 변경 불가능/예약 취소/리뷰 쓰기 가능 업데이트)
	void updateReservationGet(ReservationVO rvo);
	
	//(회원) 숙소 예약 수정 Post 요청 수정 폼 페이지 제출 기준 (예약자 기본정보 수정)
	void updateReservationPost(ReservationVO rvo);
	
	//(회원) 숙소 예약 결제 취소 (예약 상태를 "3"으로 변경)
	void updateReservationCancel(ReservationVO rvo); 
	
	//(회원) 숙소 예약 삭제 (일정 추가 및 축소 등 크게 변경의 경우 취소후 재예약 해야함)
	void deleteReservation(ReservationVO rvo);
	
	//(회원) 주어진 유저 아이디 하나에 해당하는 숙소 예약 리스트 조회
	List<ReservationVO> getReservationList(ReservationVO rvo);
	
	//(회원) 주어진 유저 아이디 하나에 해당하는 숙소 예약 총 갯수 조회
	int totalReservationListCnt(ReservationVO rvo);
	
	//(회원) 내가 결제한 숙소 예약 확인
	ReservationVO check(ReservationVO rvo);
	
	//(호스트) 내 숙소 예약현황 조회 (현성규)
	List<ReservationVO> getReservationListForHost(ReservationVO rvo);

	//(호스트) 숙소 예약 총 개수 조회 (현성규)
	int totalReservationListCntForHost(ReservationVO rvo);
	
	//(회원) 예약 1건에 대해 상세 조회
	ReservationVO getReservationOneDetail(ReservationVO rvo);

	//(회원) 내 연락처, 이메일 수정
	void updateReservationDetail(ReservationVO rvo);

}
