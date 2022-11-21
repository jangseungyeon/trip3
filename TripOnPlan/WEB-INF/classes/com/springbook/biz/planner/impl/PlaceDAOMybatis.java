package com.springbook.biz.planner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.AreaVO;

@Repository
public class PlaceDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AreaVO> getAreaList(){
		System.out.println("PlaceDAOMybatis.get AreaList 메소드 실행");
		return mybatis.selectList("AreaDAO.getAreaList");
	}

	public AreaVO getArea(AreaVO vo) {
		System.out.println("PlaceDAOMybatis.get Area 메소드 실행");
		return (AreaVO) mybatis.selectOne("AreaDAO.getArea" , vo);
	}
	
	public AreaVO getAreaNum(AreaVO vo) {
		System.out.println("vo2: "+vo);
		System.out.println("PlaceDAOMybatis.get Area Num 메소드 실행");
		return (AreaVO) mybatis.selectOne("AreaDAO.getAreaNum" , vo);
	}
	

}
