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
	
	public void insertPlace(List<PlaceVO> list){
		System.out.println("PlannerDAOMybatis.insertPlace 메소드 실행");
		mybatis.insert("PlaceDAO.insertPlace" , list);
	}
	
	public void insertPlanner(PlannerVO vo) {
		System.out.println("PlannerDAOMybatis.insertPlanner 메소드 실행");
		mybatis.insert("PlannerDAO.insertPlanner" , vo);
	}

	public PlannerVO plannerinfo(PlannerVO pvo) {
		return mybatis.selectOne("PlannerDAO.detailplanner", pvo);
	}
	
	public List<PlannerVO> plannerList(PlannerVO pvo) {
		System.out.println("다오에서 리스트 실행");
		return mybatis.selectList("PlannerDAO.plannerinfo", pvo);
	}
	
}
