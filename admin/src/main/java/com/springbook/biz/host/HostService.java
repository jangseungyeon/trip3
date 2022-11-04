package com.springbook.biz.host;

import java.util.List;

public interface HostService {

//	관리자 회원 조회
	List<HostVO> manage_hostList();

//	관리자 회원 등록 
	int manage_hostInsert(HostVO vo);

//  관리자 회원 상세 조회
	HostVO manage_hostInfo(HostVO vo);

//  관리자 회원 정보 수정
	void manage_hostUpdate(HostVO vo);

// 	관리자 회원 삭제
	void manage_hostDelete(HostVO vo);

// 	아이디 체크	
	int idCheck(HostVO vo);

	
}
