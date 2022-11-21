package com.springbook.biz.planner;

import java.util.List;

public interface PlannerService {

//	관리자 플레너 등록 
	void manage_plannerInsert(PlannerVO vo);

	void manage_placeInsert(List<PlaceVO> List);

//  관리자 플레너 수정
	void manage_plannerUpdate(PlannerVO vo);

// 	관리자 플레너 삭제
	void manage_plannerDelete(PlannerVO vo);

	void manage_placeDelete(PlaceVO vo);

//	관리자 플레너 조회
	List<PlannerVO> manage_plannerList(PlannerVO vo);

//  관리자 플레너 상세
	PlannerVO manage_plannerInfo(PlannerVO vo);

//  관리자 플레너 개수
	int totalPlannerListCnt(PlannerVO vo);	
	
	
	
	
	
//	List<PlaceVO> getPlace(PlaceVO place);

}
