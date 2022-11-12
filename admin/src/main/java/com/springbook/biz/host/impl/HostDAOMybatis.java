package com.springbook.biz.host.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.host.HostVO;

@Repository
public class HostDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

// 	관리자 업주 등록
	public int manage_hostInsert(HostVO vo) {
		System.out.println("manage_hostInsert: " + vo);
		return mybatis.insert("HostDAO.manage_hostInsert", vo);
	}

//	관리자 업주 수정	
	public void manage_hostUpdate(HostVO vo) {
		System.out.println("manage_hostUpdate: " + vo);
		mybatis.update("HostDAO.manage_hostUpdate", vo);
	}

//	관리자 업주 삭제
	public void manage_hostDelete(HostVO vo) {
		System.out.println("manage_hostDelete: ");
		mybatis.delete("HostDAO.manage_hostDelete", vo);
	}

// 	관리자 업주 조회	
	public List<HostVO> manage_hostList(HostVO vo) {
		System.out.println("manage_hostList: ");
		return mybatis.selectList("HostDAO.manage_hostList", vo);
	}

//  관리자 업주 상세
	public HostVO manage_hostInfo(HostVO vo) {
		System.out.println("manage_hostInfo: " + vo);
		return mybatis.selectOne("HostDAO.manage_hostInfo", vo);
	}

//	관리자 업주 개수
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

}
