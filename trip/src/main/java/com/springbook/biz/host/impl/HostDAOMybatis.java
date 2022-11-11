package com.springbook.biz.host.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.host.HostChartVO;
import com.springbook.biz.host.HostVO;

@Repository
public class HostDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertHost(HostVO vo) {
		return mybatis.insert("HostDAO.hostInsert", vo);
	}
	
	public int hostIdCheck(HostVO vo) {
		if(vo.getHost_id() != null || !vo.getHost_id().equals("")) {
			vo = mybatis.selectOne("HostDAO.hostIdCheck", vo);
			if(vo!=null) {
				return 1;
			} else {
				return 0;
			}
		}return 2;
	
	}
	
	public HostVO hostLogin(HostVO vo) {
		return mybatis.selectOne("HostDAO.hostLogin", vo);
	}
	
	public int hostUpdate(HostVO vo) {
		return mybatis.update("HostDAO.hostUpdate", vo);
	}

	
	public int hostPwUpdate(HostVO vo) {
		return mybatis.update("HostDAO.hostPwUpdate", vo);
	}
	
	public int hostLeave(HostVO vo) {
		return mybatis.update("HostDAO.hostLeave", vo);
	}
	
	public HostVO hostInfoSelect(HostVO vo) {
		return mybatis.selectOne("HostDAO.hostInfoSelect", vo);
	}
	
	public HostVO hostFind(HostVO vo) {
		return mybatis.selectOne("HostDAO.find", vo);
	}
	
	public int hostPwChange(HostVO vo) {
		return mybatis.update("HostDAO.change", vo);
	}
	
	public HostVO hostEmainCheck (HostVO vo) {
		return mybatis.selectOne("HostDAO.emailCheck", vo);
	}
	
	public List<HostChartVO> hostIndexChartSelect(HostChartVO vo){
		return mybatis.selectList("HostDAO.hostIndexChartSelect", vo);
	}
	
	public List<HostChartVO> hostIndexChart2Select(HostChartVO vo){
		return mybatis.selectList("HostDAO.hostIndexChart2Select", vo);
	}
	
	public HostChartVO indexRoomCount (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexRoomCount", vo);
	}
	
	public HostChartVO indexReviewCount (HostChartVO vo){
		return mybatis.selectOne("HostDAO.indexReviewCount", vo);
	}
	
	public HostChartVO indexLikeCount (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexLikeCount", vo);
	}

	public HostChartVO indexCheckout (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexCheckout", vo);
	}
	
	public HostChartVO indexTodayCheckin (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexTodayCheckin", vo);
	}
	
	public HostChartVO indexStaying (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexStaying", vo);
	}
	
	public HostChartVO indexCheckinAble (HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexCheckinAble", vo);
	}
	
	public List<HostChartVO> hostIndexRoomSelect(HostChartVO vo){
		return mybatis.selectList("hostIndexRoomSelect", vo);
	}
	
	public List<HostChartVO> hostIndexChart3Select(HostChartVO vo){
		return mybatis.selectList("hostIndexChart3Select", vo);
	}
	
	
}