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
	private PlannerDAOMybatis plannerDAO;
	
	@Override
	public void insertPlace(List<PlaceVO> List) {
		plannerDAO.insertPlace(List);
	}

	@Override
	public void insertPlanner(PlannerVO vo) {
		plannerDAO.insertPlanner(vo);
	}
	
//	내가 작성한 플래너 정보 가져오기
	@Override
	public PlannerVO plannerinfo(PlannerVO pvo) {
		return plannerDAO.plannerinfo(pvo);
	}
	
	@Override
	public List<PlannerVO> plannerlist(PlannerVO pvo) {
		return plannerDAO.plannerList(pvo);
	}
	
}
