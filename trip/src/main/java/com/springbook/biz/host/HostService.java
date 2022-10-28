package com.springbook.biz.host;

public interface HostService {
	int insert(HostVO vo);
	int idCheck(HostVO vo);
	HostVO login(HostVO vo);
}
