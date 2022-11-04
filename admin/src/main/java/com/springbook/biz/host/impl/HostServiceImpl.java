package com.springbook.biz.host.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Service
public class HostServiceImpl implements HostService {
	@Autowired
	private HostDAOMybatis hostDAO;

// 	관리자 업주 조회
	@Override
	public List<HostVO> manage_hostList() {
		return hostDAO.manage_hostList();
	}

//	관리자 업주 등록
	@Override
	public int manage_hostInsert(HostVO vo) {
		System.out.println("업주 등록");
		return hostDAO.manage_hostInsert(vo);
	}

//	관리자 업주 상세 조회
	@Override
	public HostVO manage_hostInfo(HostVO vo) {
		return hostDAO.manage_hostInfo(vo);
	}

// 관리자 업주 정보 수정
	@Override
	public void manage_hostUpdate(HostVO vo) {
		hostDAO.manage_hostUpdate(vo);

	}

//	관리자 업주 삭제
	@Override
	public void manage_hostDelete(HostVO vo) {
		hostDAO.manage_hostDelete(vo);

	}

//	아이디 체크	
	@Override
	public int idCheck(HostVO vo) {
		return hostDAO.host_idCheck(vo);
	}

}
