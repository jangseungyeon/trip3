package com.springbook.biz.host;

import java.util.List;

public interface HostService {

//	관리자 업주 등록 
	int manage_hostInsert(HostVO vo);

//  관리자 업주 수정
	void manage_hostUpdate(HostVO vo);

// 	관리자 업주 삭제
	void manage_hostDelete(HostVO vo);

//	관리자 업주 조회
	List<HostVO> manage_hostList(HostVO vo);

//  관리자 업주 상세
	HostVO manage_hostInfo(HostVO vo);

//  전체 업주 개수
	int totalHostListCnt(HostVO vo);
		
// 	아이디 체크	
	int idCheck(HostVO vo);

}
