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

//	관리자 호스트 등록
	@Override
	public int manage_hostInsert(HostVO vo) {
		System.out.println("호스트 등록");
		return hostDAO.manage_hostInsert(vo);
	}

// 관리자 호스트 수정
	@Override
	public void manage_hostUpdate(HostVO vo) {
		hostDAO.manage_hostUpdate(vo);
	}

//	관리자 호스트 삭제
	@Override
	public void manage_hostDelete(HostVO vo) {
		hostDAO.manage_hostDelete(vo);
	}

// 	관리자 호스트 조회
	@Override
	public List<HostVO> manage_hostList(HostVO vo) {
		return hostDAO.manage_hostList(vo);
	}

//	관리자 호스트 상세
	@Override
	public HostVO manage_hostInfo(HostVO vo) {
		return hostDAO.manage_hostInfo(vo);
	}

//	관리자 호스트 개수
	@Override
	public int totalHostListCnt(HostVO vo) {
		return hostDAO.totalHostListCnt(vo);
	}

//	아이디 체크	
	@Override
	public int idCheck(HostVO vo) {
		return hostDAO.host_idCheck(vo);
	}

	
	
	//호스트가 운영중인 숙소 수
	@Override
	public HostChartVO indexRoomCount(HostChartVO vo) {
		return hostDAO.indexRoomCount(vo);
	}

	//호스트가 가진 리뷰 수
	@Override
	public HostChartVO indexReviewCount(HostChartVO vo) {
		return hostDAO.indexReviewCount(vo);
	}

	//호스트가 가진 좋아요 수
	@Override
	public HostChartVO indexLikeCount(HostChartVO vo) {
		return hostDAO.indexLikeCount(vo);
	}

	//호스트가 가진 체크아웃된 숙소 수
	@Override
	public HostChartVO indexCheckout(HostChartVO vo) {
		return hostDAO.indexCheckout(vo);
	}

	//호스트가 가진 오늘 체크인 숙소 수
	@Override
	public HostChartVO indexTodayCheckin(HostChartVO vo) {
		return hostDAO.indexTodayCheckin(vo);
	}

	//호스트가 가진 현재 숙박중인 숙소 수
	@Override
	public HostChartVO indexStaying(HostChartVO vo) {
		return hostDAO.indexStaying(vo);
	}

	//호스트가 가진 체크인 예정 숙소 수
	@Override
	public HostChartVO indexCheckinAble(HostChartVO vo) {
		return hostDAO.indexCheckinAble(vo);
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
	public List<HostChartVO> hostIndexRoomSelect(HostChartVO vo) {
		return hostDAO.hostIndexRoomSelect(vo);
	}

	@Override
	public List<HostChartVO> hostIndexChart3Select(HostChartVO vo) {
		return hostDAO.hostIndexChart3Select(vo);
	}

	@Override
	public HostLoginVO hostCount(HostLoginVO vo) {
		return null;
	}

	@Override
	public HostLoginVO hostAvgIncome(HostLoginVO vo) {
		return null;
	}

	@Override
	public List<HostLoginVO> hostMaxIncome(HostLoginVO vo) {
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomName(HostLoginVO vo) {
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomImg(HostLoginVO vo) {
		return null;
	}

	@Override
	public List<HostLoginVO> bestRoomIncome(HostLoginVO vo) {
		return null;
	}

	@Override
	public HostLoginVO reservationCountLast10days(HostLoginVO vo) {
		return null;
	}

	@Override
	public HostLoginVO reservation_count(HostLoginVO vo) {
		return null;
	}

}
