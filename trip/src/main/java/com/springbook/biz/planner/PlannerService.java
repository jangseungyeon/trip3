package com.springbook.biz.planner;

import java.util.List;

public interface PlannerService {
	void insertPlace(List<PlaceVO> List);
	
	void insertPlanner(PlannerVO vo);
}
