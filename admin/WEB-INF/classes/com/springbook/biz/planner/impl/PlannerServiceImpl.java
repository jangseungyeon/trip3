package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Service("PlannerService")
public class PlannerServiceImpl implements PlannerService {
	@Autowired
	private PlannerDAOMybatis plannerDAO;

// 	관리자 플레너 등록
	@Override
	public void manage_plannerInsert(PlannerVO vo) {
		System.out.println("플레너 등록");
		plannerDAO.manage_plannerInsert(vo);
	}

// 	관리자 플레이스 등록
	@Override
	public void manage_placeInsert(List<PlaceVO> List) {
		System.out.println("플레이스 등록");
		plannerDAO.manage_placeInsert(List);
	}

// 관리자 플레너 수정
	@Override
	public void manage_plannerUpdate(PlannerVO vo) {
		plannerDAO.manage_plannerUpdate(vo);
	}

//	관리자 플레너 삭제
	@Override
	public void manage_plannerDelete(PlannerVO vo) {
		System.out.println("플레너 삭제");
		plannerDAO.manage_plannerDelete(vo);
	}

//	관리자 플레이스 삭제
	@Override
	public void manage_placeDelete(PlaceVO vo) {
		System.out.println("플레이스 삭제");
		plannerDAO.manage_placeDelete(vo);
	}

// 	관리자 플레너 조회
	@Override
	public List<PlannerVO> manage_plannerList(PlannerVO vo) {
		return plannerDAO.manage_plannerList(vo);
	}

//	관리자 플레너 상세
	@Override
	public PlannerVO manage_plannerInfo(PlannerVO vo) {
		return plannerDAO.manage_plannerInfo(vo);
	}

//	관리자 플레너 개수
	@Override
	public int totalPlannerListCnt(PlannerVO vo) {
		return plannerDAO.totalPlannerListCnt(vo);
	}

	
	
	
//	@Override
//	public List<PlaceVO> getPlace(PlaceVO place) {
//		return plannerDAO.getPlace(place);
//	}
}
