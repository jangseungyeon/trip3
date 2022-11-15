package com.springbook.biz.planner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerMemoVO;
import com.springbook.biz.planner.PlannerVO;

@Repository
public class PlannerDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPlace(List<PlaceVO> list){
		System.out.println("PlannerDAOMybatis.insertPlace 메소드 실행");
		mybatis.insert("PlaceDAO.insertPlace" , list);
	}
	
	public void insertPlanner(PlannerVO vo) {
		System.out.println("PlannerDAOMybatis.insertPlanner 메소드 실행");
		mybatis.insert("PlannerDAO.insertPlanner" , vo);
	}

	public PlannerVO plannerinfo(PlannerVO pvo) {
		System.out.println("info 메소드 실행");
		return mybatis.selectOne("PlannerDAO.detailplanner", pvo);
	}
	
	public List<PlannerVO> plannerList(PlannerVO pvo) {
		System.out.println("다오에서 리스트 실행");
		return mybatis.selectList("PlannerDAO.plannerinfo", pvo);
	}
	
	public List<PlaceVO> getPlace(PlaceVO place) {
		System.out.println("PlannerDAOMybatis.getPlace 메소드 실행");
		return mybatis.selectList("PlaceDAO.getPlace", place);
	}
	
	public List<PlannerVO> plannerPage(){
		System.out.println("plannerPage 메소드 실행");
		return mybatis.selectList("PlannerDAO.plannerPage");
	}
	
	public List<PlannerVO> mainPlannerList(){
		System.out.println("mainPlannerList 메소드 실행");
		return mybatis.selectList("PlannerDAO.mainPlannerList");
	}
	
	public void deletePlanner(PlannerVO vo) {
		System.out.println("deletePlanner 메소드 실행");
		mybatis.delete("PlannerDAO.deletePlanner", vo);
	}
	
	public void deletePlace(PlaceVO vo) {
		System.out.println("deletePlace 메소드 실행");
		mybatis.delete("PlaceDAO.deletePlace", vo);
	}
	
	public void insertMemo(List<PlannerMemoVO> list) {
		System.out.println("insertMemo 메소드 실행");
		mybatis.insert("memoDAO.insertMemo", list);
	}
	
	public void deleteMemo(PlannerMemoVO vo) {
		System.out.println("deleteMemo 메소드 실행");
		mybatis.delete("memoDAO.deleteMemo", vo);
	}
	
	public List<PlannerMemoVO> selectMemo(PlannerMemoVO vo){
		System.out.println("selectMemo 메소드 실행");
		return mybatis.selectList("memoDAO.selectMemo", vo);
	}
	
	public void updateLike(PlannerVO vo) {
		System.out.println("updateLike 메소드 실행");
		mybatis.update("PlannerDAO.updateLike", vo);
	}
	
	public List<PlannerVO> PopularPlanner(){
		return mybatis.selectList("PlannerDAO.plannerPopular");
	}
	
	public void insertPlace2(List<PlaceVO> list){
		System.out.println("PlannerDAOMybatis.insertPlace2 메소드 실행");
		mybatis.insert("PlaceDAO.insertPlace2" , list);
	}
	
	public void updateMemo(PlannerMemoVO list) {
		mybatis.update("memoDAO.updateMemo", list);
	}
	
	public void deletePlace2(PlaceVO vo) {
		mybatis.delete("PlaceDAO.deletePlace2", vo);
	}
	
	public void updatePlanner(PlannerVO vo) {
		mybatis.update("PlannerDAO.updatePlanner", vo);
	}
	
	
}
