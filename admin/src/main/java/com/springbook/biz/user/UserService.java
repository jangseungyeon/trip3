package com.springbook.biz.user;

import java.util.List;

public interface UserService {

//	관리자 회원 등록 
	int manage_userInsert(UserVO vo);

//  관리자 회원 정보 수정
	void manage_userUpdate(UserVO vo);

// 	관리자 회원 삭제
	void manage_userDelete(UserVO vo);

//	관리자 회원 조회
	List<UserVO> manage_userList(UserVO vo);

//  관리자 회원 상세 조회
	UserVO manage_userInfo(UserVO vo);
	
//  전체 공지 목록 개수
	int totalUserListCnt(UserVO vo);
	
// 	아이디 체크	
	int idCheck(UserVO vo);
}
