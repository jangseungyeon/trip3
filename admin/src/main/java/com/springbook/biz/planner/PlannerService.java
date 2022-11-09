package com.springbook.biz.planner;

import java.util.List;

public interface PlannerService {
	
	
	
//	관리자 플레너 조회
	List<PlannerVO> manage_plannerList();

//	관리자 플레너 등록 
	void manage_plannerInsert(PlannerVO vo);
	void manage_placeInsert(List<PlaceVO> List);

//  관리자 플레너 상세 조회
	PlannerVO manage_plannerInfo(PlannerVO vo);

	List<PlaceVO> getPlace(PlaceVO place);
	
//  관리자 플레너 정보 수정
	void manage_plannerUpdate(PlannerVO vo);

// 	관리자 플레너 삭제
	void manage_plannerDelete(PlannerVO vo);
	void manage_placeDelete(PlaceVO vo);
	
	
	
	
	
	
//	
//	void insertPlace(List<PlaceVO> List);
//
//	void insertPlanner(PlannerVO vo);
//
//	// 플래너 상세 보기
//	PlannerVO plannerinfo(PlannerVO pvo);
//
//	// 플래너 목록 조회
//	List<PlannerVO> plannerlist(PlannerVO pvo);
//	
//	List<PlaceVO> getPlace(PlaceVO place);
//	
//	List<PlannerVO> plannerPage();
//	
//	List<PlannerVO> mainPlannerList();
//	
//	void deltePlanner(PlannerVO vo);
//	
//	void deletePlace(PlaceVO vo);

}
