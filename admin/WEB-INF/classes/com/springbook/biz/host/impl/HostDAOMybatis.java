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

// 	관리자 호스트 등록
	public int manage_hostInsert(HostVO vo) {
		System.out.println("manage_hostInsert: " + vo);
		return mybatis.insert("HostDAO.manage_hostInsert", vo);
	}

//	관리자 호스트 수정	
	public void manage_hostUpdate(HostVO vo) {
		System.out.println("manage_hostUpdate: " + vo);
		mybatis.update("HostDAO.manage_hostUpdate", vo);
	}

//	관리자 호스트 삭제
	public void manage_hostDelete(HostVO vo) {
		System.out.println("manage_hostDelete: ");
		mybatis.delete("HostDAO.manage_hostDelete", vo);
	}

// 	관리자 호스트 조회	
	public List<HostVO> manage_hostList(HostVO vo) {
		System.out.println("manage_hostList: ");
		return mybatis.selectList("HostDAO.manage_hostList", vo);
	}

//  관리자 호스트 상세
	public HostVO manage_hostInfo(HostVO vo) {
		System.out.println("manage_hostInfo: " + vo);
		return mybatis.selectOne("HostDAO.manage_hostInfo", vo);
	}

//	관리자 호스트 개수
	public int totalHostListCnt(HostVO vo) {
		System.out.println("totalHostListCnt() 기능처리");
		return mybatis.selectOne("HostDAO.totalHostListCnt", vo);
	}

//	아이디 체크
	public int host_idCheck(HostVO vo) {
		System.out.println("idCheck: " + vo);
		if (vo.getHost_id() != null || !vo.getHost_id().equals("")) {
			vo = mybatis.selectOne("HostDAO.idCheck", vo);
			if (vo != null) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return 2;
		}
	}

	 //호스트가 운영중인 숙소 수
	public HostChartVO indexRoomCount(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexRoomCount", vo);
	}

	//호스트가 가진 리뷰 수
	public HostChartVO indexReviewCount(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexReviewCount", vo);
	}

	//호스트가 가진 좋아요 수
	public HostChartVO indexLikeCount(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexLikeCount", vo);
	}

	//호스트가 가진 체크아웃된 숙소 수
	public HostChartVO indexCheckout(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexCheckout", vo);
	}

	//호스트가 가진 오늘 체크인 숙소 수
	public HostChartVO indexTodayCheckin(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexTodayCheckin", vo);
	}

	 //호스트가 가진 현재 숙박중인 숙소 수
	public HostChartVO indexStaying(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexStaying", vo);
	}

	//호스트가 가진 체크인 예정 숙소 수
	public HostChartVO indexCheckinAble(HostChartVO vo) {
		return mybatis.selectOne("HostDAO.indexCheckinAble", vo);
	}

	public List<HostChartVO> hostIndexChartSelect(HostChartVO vo) {
		return mybatis.selectList("HostDAO.hostIndexChartSelect", vo);
	}

	public List<HostChartVO> hostIndexChart2Select(HostChartVO vo) {
		return mybatis.selectList("HostDAO.hostIndexChart2Select", vo);
	}

	public List<HostChartVO> hostIndexRoomSelect(HostChartVO vo) {
		return mybatis.selectList("hostIndexRoomSelect", vo);
	}

	public List<HostChartVO> hostIndexChart3Select(HostChartVO vo) {
		return mybatis.selectList("hostIndexChart3Select", vo);
	}

}
