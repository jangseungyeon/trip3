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

// 	관리자 플레너 조회
	@Override
	public List<PlannerVO> manage_plannerList() {
		return plannerDAO.manage_plannerList();
	}

//	관리자 플레너 상세 조회
	@Override
	public PlannerVO manage_plannerInfo(PlannerVO vo) {
		return plannerDAO.manage_plannerInfo(vo);
	}

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

// 관리자 플레너 관리 수정
	@Override
	public void manage_plannerUpdate(PlannerVO vo) {
		plannerDAO.manage_plannerUpdate(vo);
	}

	@Override
	public List<PlaceVO> getPlace(PlaceVO place) {
		return plannerDAO.getPlace(place);
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

//	
//	
//	@Override
//	public void insertPlace(List<PlaceVO> List) {
//		plannerDAO.insertPlace(List);
//	}
//
//	@Override
//	public void insertPlanner(PlannerVO vo) {
//		plannerDAO.insertPlanner(vo);
//	}
//	
////	내가 작성한 플래너 정보 가져오기
//	@Override
//	public PlannerVO plannerinfo(PlannerVO pvo) {
//		return plannerDAO.plannerinfo(pvo);
//	}
//	
//	@Override
//	public List<PlannerVO> plannerlist(PlannerVO pvo) {
//		return plannerDAO.plannerList(pvo);
//	}
//	
//	@Override
//	public List<PlaceVO> getPlace(PlaceVO place) {
//		return plannerDAO.getPlace(place);
//	}
//
//	@Override
//	public List<PlannerVO> plannerPage() {
//		return plannerDAO.plannerPage();
//	}
//	
//	@Override
//	public List<PlannerVO> mainPlannerList() {
//		return plannerDAO.mainPlannerList();
//	}
//
//	@Override
//	public void deltePlanner(PlannerVO vo) {
//		plannerDAO.deletePlanner(vo);
//	}
//
//	@Override
//	public void deletePlace(PlaceVO vo) {
//		plannerDAO.deletePlace(vo);
//	}
//	

}
