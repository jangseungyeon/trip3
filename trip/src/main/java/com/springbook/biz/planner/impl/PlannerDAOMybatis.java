package com.springbook.biz.planner.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.PlannerVO;

@Repository
public class PlannerDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PlannerVO plannerinfo(PlannerVO pvo) {
		return mybatis.selectOne("PlannerDAO.plannerinfo", pvo);
	}

}
