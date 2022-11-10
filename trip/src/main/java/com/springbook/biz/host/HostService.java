package com.springbook.biz.host;

import java.util.List;

public interface HostService {
	int insert(HostVO vo);
	int idCheck(HostVO vo);
	HostVO login(HostVO vo);
	int update(HostVO vo);
	int updatePw(HostVO vo);
	int leave(HostVO vo);
	HostVO hostInfoSelect(HostVO vo);
	HostVO hostFind(HostVO vo);
	int change(HostVO vo);
	List<HostChartVO> hostIndexChartSelect(HostChartVO vo);
	List<HostChartVO> hostIndexChart2Select(HostChartVO vo);
}
