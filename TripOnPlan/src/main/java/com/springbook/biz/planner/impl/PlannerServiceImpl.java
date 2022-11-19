package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerMemoVO;
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
	
	@Override
	public List<PlaceVO> getPlace(PlaceVO place) {
		return plannerDAO.getPlace(place);
	}

	@Override
	public List<PlannerVO> plannerPage() {
		return plannerDAO.plannerPage();
	}
	
	@Override
	public List<PlannerVO> mainPlannerList() {
		return plannerDAO.mainPlannerList();
	}

	@Override
	public void deltePlanner(PlannerVO vo) {
		plannerDAO.deletePlanner(vo);
	}

	@Override
	public void deletePlace(PlaceVO vo) {
		plannerDAO.deletePlace(vo);
	}
	
	@Override
	public void insertMemo(List<PlannerMemoVO> List) {
		plannerDAO.insertMemo(List);
	}
	
	@Override
	public List<PlannerMemoVO> selectMemo(PlannerMemoVO vo) {
		return plannerDAO.selectMemo(vo);
	}

	@Override
	public void deleteMemo(PlannerMemoVO vo) {
		plannerDAO.deleteMemo(vo);
	}

	@Override
	public void updateLike(PlannerVO vo) {
		plannerDAO.updateLike(vo);
	}

	@Override
	public List<PlannerVO> PopularPlanner() {
		return plannerDAO.PopularPlanner();
	}

	@Override
	public void insertPlace2(List<PlaceVO> List) {
		plannerDAO.insertPlace2(List);
	}

	@Override
	public void updateMemo(PlannerMemoVO list) {
		plannerDAO.updateMemo(list);
	}

	@Override
	public void deletePlace2(PlaceVO vo) {
		plannerDAO.deletePlace2(vo);
	}
	
	@Override
	public void updatePlanner(PlannerVO vo) {
		plannerDAO.updatePlanner(vo);
	}
	
	
	
}
