package com.springbook.biz.host.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
