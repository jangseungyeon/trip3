package com.springbook.biz.planner;

import java.util.List;

public interface PlannerService {
	void insertPlace(List<PlaceVO> List);

	void insertPlanner(PlannerVO vo);

	// 플래너 상세 보기
	PlannerVO plannerinfo(PlannerVO pvo);

	// 플래너 목록 조회
	List<PlannerVO> plannerlist(PlannerVO pvo);
	
	List<PlaceVO> getPlace(PlaceVO place);
	
	List<PlannerVO> plannerPage();
	
	List<PlannerVO> mainPlannerList();
	
	void deltePlanner(PlannerVO vo);
	
	void deletePlace(PlaceVO vo);
	
	void insertMemo(List<PlannerMemoVO> List);
	
	List<PlannerMemoVO> selectMemo(PlannerMemoVO vo);
	
	void deleteMemo(PlannerMemoVO vo);
	
	void updateLike(PlannerVO vo);
	
	List<PlannerVO> PopularPlanner();
	
	void insertPlace2(List<PlaceVO> List);

	void updateMemo(PlannerMemoVO list);
	
	void deletePlace2(PlaceVO vo);
	
	void updatePlanner(PlannerVO vo);

}
