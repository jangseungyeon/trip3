package com.springbook.biz.host;

public interface HostService {
	int insert(HostVO vo);
	int idCheck(HostVO vo);
	HostVO login(HostVO vo);
	int update(HostVO vo);
	int updatePw(HostVO vo);
	int leave(HostVO vo);
	HostVO hostInfoSelect(HostVO vo);
}
