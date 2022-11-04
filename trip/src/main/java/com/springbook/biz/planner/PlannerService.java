package com.springbook.biz.planner;

import java.util.List;

public interface PlannerService {
	void insertPlace(List<PlaceVO> List);

	void insertPlanner(PlannerVO vo);

	// 플래너 상세 보기
	PlannerVO plannerinfo(PlannerVO pvo);

	// 플래너 목록 조회
	List<PlannerVO> plannerlist(PlannerVO pvo);

}
