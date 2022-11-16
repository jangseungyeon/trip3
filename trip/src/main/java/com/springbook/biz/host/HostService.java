package com.springbook.biz.host;

import java.util.List;

public interface HostService {
	int insert(HostVO vo);
	int idCheck(HostVO vo);
	HostVO login(HostVO vo);
	int update(HostVO vo);
	int updatePw(HostVO vo);
	int leave(HostVO vo);
	HostVO hostInfoSelect(HostVO vo);
	HostVO hostFind(HostVO vo);
	int change(HostVO vo);
	List<HostChartVO> hostIndexChartSelect(HostChartVO vo);
	List<HostChartVO> hostIndexChart2Select(HostChartVO vo);
	HostChartVO indexRoomCount(HostChartVO vo);
	HostChartVO indexReviewCount(HostChartVO vo);
	HostChartVO indexLikeCount(HostChartVO vo);
	HostChartVO indexCheckout(HostChartVO vo);
	HostChartVO indexTodayCheckin(HostChartVO vo);
	HostChartVO indexStaying(HostChartVO vo);
	HostChartVO indexCheckinAble(HostChartVO vo);
	List<HostChartVO> hostIndexRoomSelect(HostChartVO vo);
	List<HostChartVO> hostIndexChart3Select(HostChartVO vo);
	
	HostLoginVO hostCount(HostLoginVO vo);
	HostLoginVO hostAvgIncome (HostLoginVO vo);
	List<HostLoginVO> hostMaxIncome (HostLoginVO vo);
//	List<HostLoginVO> bestRoomName (HostLoginVO vo);
//	List<HostLoginVO> bestRoomImg (HostLoginVO vo);
	List<HostLoginVO> bestRoomIncome (HostLoginVO vo);
	HostLoginVO reservationCountLast10days (HostLoginVO vo);
	HostLoginVO reservationCount (HostLoginVO vo);
	HostLoginVO roomCount (HostLoginVO vo);
	
}
