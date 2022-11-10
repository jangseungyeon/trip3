package com.springbook.biz.host.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
			vo = mybatis.selectOne("UserDAO.hostIdCheck", vo);
			if(vo!=null) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return 2;
		}
	}
	
	public HostVO hostLogin(HostVO vo) {
		return mybatis.selectOne("HostDAO.hostLogin", vo);
	}
	
	public int hostUpdate(HostVO vo) {
		System.out.println("마이버티스 수정"+vo);
		return mybatis.update("HostDAO.hostUpdate", vo);
	}

	
	public int hostPwUpdate(HostVO vo) {
		System.out.println("마이버티스 비밀번호 수정"+ vo);
		return mybatis.update("HostDAO.hostPwUpdate", vo);
	}
	
	public int hostLeave(HostVO vo) {
		return mybatis.update("HostDAO.hostLeave", vo);
	}
	
	public HostVO hostInfoSelect(HostVO vo) {
		return mybatis.selectOne("HostDAO.hostInfoSelect", vo);
	}

}
