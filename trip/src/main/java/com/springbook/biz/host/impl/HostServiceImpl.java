package com.springbook.biz.host.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.host.HostChartVO;
import com.springbook.biz.host.HostLoginVO;
import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Service
public class HostServiceImpl implements HostService {
	@Autowired
	private HostDAOMybatis hostDAO;
	
	@Override
	public int insert(HostVO vo) {
		return hostDAO.insertHost(vo);
	}

	@Override
	public int idCheck(HostVO vo) {
		return hostDAO.hostIdCheck(vo);
	}

	@Override
	public HostVO login(HostVO vo) {
		return hostDAO.hostLogin(vo);
	}

	@Override
	public int update(HostVO vo) {
		return hostDAO.hostUpdate(vo);
	}

	@Override
	public int updatePw(HostVO vo) {
		return hostDAO.hostPwUpdate(vo);
	}
	
	@Override
	public int leave(HostVO vo) {
		return hostDAO.hostLeave(vo);
	}

	@Override
	public HostVO hostInfoSelect(HostVO vo) {
		return hostDAO.hostInfoSelect(vo);
	}

	@Override
	public HostVO hostFind(HostVO vo) {
		return hostDAO.hostFind(vo);
	}

	@Override
	public int change(HostVO vo) {
		return hostDAO.hostPwChange(vo);
	}

	@Override
	public List<HostChartVO> hostIndexChartSelect(HostChartVO vo) {
		return hostDAO.hostIndexChartSelect(vo);
	}

	@Override
	public List<HostChartVO> hostIndexChart2Select(HostChartVO vo) {
		return hostDAO.hostIndexChart2Select(vo);
	}

	@Override
	public HostChartVO indexRoomCount(HostChartVO vo) {
		return hostDAO.indexRoomCount(vo);
	}

	@Override
	public HostChartVO indexReviewCount(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexReviewCount(vo);
	}

	@Override
	public HostChartVO indexLikeCount(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexLikeCount(vo);
	}

	@Override
	public HostChartVO indexCheckout(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexCheckout(vo);
	}

	@Override
	public HostChartVO indexTodayCheckin(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexTodayCheckin(vo);
	}

	@Override
	public HostChartVO indexStaying(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexStaying(vo);
	}

	@Override
	public HostChartVO indexCheckinAble(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.indexCheckinAble(vo);
	}

	@Override
	public List<HostChartVO> hostIndexRoomSelect(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.hostIndexRoomSelect(vo);
	}

	@Override
	public List<HostChartVO> hostIndexChart3Select(HostChartVO vo) {
		// TODO Auto-generated method stub
		return hostDAO.hostIndexChart3Select(vo);
	}

	@Override
	public HostLoginVO hostCount(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HostLoginVO hostAvgIncome(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HostLoginVO> hostMaxIncome(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomName(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomImg(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomIncome(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HostLoginVO reservationCountLast10days(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HostLoginVO reservation_count(HostLoginVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


}
