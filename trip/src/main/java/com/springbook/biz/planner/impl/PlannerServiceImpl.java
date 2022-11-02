package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Service("PlannerService")
public class PlannerServiceImpl implements PlannerService{
	
	@Autowired
	private PlannerDAOMybatis plannerService;
	
	@Override
	public void insertPlace(List<PlaceVO> List) {
		plannerService.insertPlace(List);
	}

	@Override
	public void insertPlanner(PlannerVO vo) {
		plannerService.insertPlanner(vo);
	}
	
}
