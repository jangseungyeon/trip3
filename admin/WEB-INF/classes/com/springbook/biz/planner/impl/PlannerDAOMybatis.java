package com.springbook.biz.planner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerVO;

@Repository
public class PlannerDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

// 	관리자 플레너 등록
	public int manage_plannerInsert(PlannerVO vo) {
		System.out.println("manage_plannerInsert: " + vo);
		return mybatis.insert("PlannerDAO.manage_plannerInsert", vo);
	}

// 	관리자 플레이스 등록	
	public void manage_placeInsert(List<PlaceVO> list) {
		System.out.println("PlannerDAOMybatis.manage_placeInsert 메소드 실행");
		mybatis.insert("PlaceDAO.manage_placeInsert", list);
	}

//	관리자 플레너 관리 수정	
	public void manage_plannerUpdate(PlannerVO vo) {
		System.out.println("manage_plannerUpdate: " + vo);
		mybatis.update("PlannerDAO.manage_plannerUpdate", vo);
	}

//	관리자 플레너 삭제
	public void manage_plannerDelete(PlannerVO vo) {
		System.out.println("manage_plannerDelete: ");
		mybatis.delete("PlannerDAO.manage_plannerDelete", vo);
	}

//	관리자 플레이스 삭제
	public void manage_placeDelete(PlaceVO vo) {
		System.out.println("manage_placeDelete 메소드 실행");
		mybatis.delete("PlaceDAO.manage_placeDelete", vo);
	}

// 	관리자 플레너 조회	
	public List<PlannerVO> manage_plannerList(PlannerVO vo) {
		System.out.println("manage_plannerList: ");
		return mybatis.selectList("PlannerDAO.manage_plannerList", vo);
	}

//  관리자 플레너 상세
	public PlannerVO manage_plannerInfo(PlannerVO vo) {
		System.out.println("manage_plannerInfo: " + vo);
		return mybatis.selectOne("PlannerDAO.manage_plannerInfo", vo);
	}

//	관리자 플레너 개수
	public int totalPlannerListCnt(PlannerVO vo) {
		System.out.println("totalPlannerListCnt() 기능처리");
		return mybatis.selectOne("PlannerDAO.totalPlannerListCnt", vo);
	}

	
	
	
//	public List<PlaceVO> getPlace(PlaceVO place) {
//		System.out.println("PlannerDAOMybatis.getPlace 메소드 실행");
//		return mybatis.selectList("PlaceDAO.getPlace", place);
//	}

}
