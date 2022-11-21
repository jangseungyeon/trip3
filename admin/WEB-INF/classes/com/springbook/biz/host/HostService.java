package com.springbook.biz.host;

import java.util.List;

public interface HostService {

//	관리자 호스트 등록 
	int manage_hostInsert(HostVO vo);

//  관리자 호스트 수정
	void manage_hostUpdate(HostVO vo);

// 	관리자 호스트 삭제
	void manage_hostDelete(HostVO vo);

//	관리자 호스트 조회
	List<HostVO> manage_hostList(HostVO vo);

//  관리자 호스트 상세
	HostVO manage_hostInfo(HostVO vo);

//  전체 호스트 개수
	int totalHostListCnt(HostVO vo);
		
// 	아이디 체크	
	int idCheck(HostVO vo);

	List<HostChartVO> hostIndexChartSelect(HostChartVO vo);
	List<HostChartVO> hostIndexChart2Select(HostChartVO vo);
	
	List<HostChartVO> hostIndexRoomSelect(HostChartVO vo);
	List<HostChartVO> hostIndexChart3Select(HostChartVO vo);
	
//HostChartVO
	//호스트가 운영중인 숙소 수
	HostChartVO indexRoomCount(HostChartVO vo);
	
	//호스트가 가진 리뷰 수
	HostChartVO indexReviewCount(HostChartVO vo);
	
	//호스트가 가진 좋아요 수
	HostChartVO indexLikeCount(HostChartVO vo);
	
	//호스트가 가진 체크아웃된 숙소 수
	HostChartVO indexCheckout(HostChartVO vo);
	
	//호스트가 가진 오늘 체크인 숙소 수
	HostChartVO indexTodayCheckin(HostChartVO vo);
	
	//호스트가 가진 현재 숙박중인 숙소 수
	HostChartVO indexStaying(HostChartVO vo);
	
	//호스트가 가진 체크인 예정 숙소 수
	HostChartVO indexCheckinAble(HostChartVO vo);
	
// HostLoginVO
	HostLoginVO hostCount(HostLoginVO vo);
	HostLoginVO hostAvgIncome (HostLoginVO vo);
	List<HostLoginVO> hostMaxIncome (HostLoginVO vo);
	List<HostLoginVO> bestRoomName (HostLoginVO vo);
	List<HostLoginVO> bestRoomImg (HostLoginVO vo);
	List<HostLoginVO> bestRoomIncome (HostLoginVO vo);
	HostLoginVO reservationCountLast10days (HostLoginVO vo);
	HostLoginVO reservation_count (HostLoginVO vo);
	
}
