package com.springbook.biz.planner.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Service("PlannerService")
public class PlannerServiceImpl implements PlannerService{
	
	@Autowired
	private PlannerDAOMybatis plannerDAO;

//	내가 작성한 플래너 정보 가져오기
	@Override
	public PlannerVO plannerinfo(PlannerVO pvo) {
		return plannerDAO.plannerinfo(pvo);
	}

	
	
}
