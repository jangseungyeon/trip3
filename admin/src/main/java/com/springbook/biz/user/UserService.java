package com.springbook.biz.user;

import java.util.List;

public interface UserService {
	
	
//	관리자 회원 조회
	List<UserVO> manage_userList();

//	관리자 회원 등록 
	int manage_userInsert(UserVO vo);

//  관리자 회원 상세 조회
	UserVO manage_userInfo(String user_id);
	
//  관리자 회원 정보 수정
	void manage_userUpdate(UserVO vo);
	
	
	
	
	int insert(UserVO vo);

	int idCheck(UserVO vo);

	UserVO login(UserVO vo);

	UserVO find(UserVO vo);

	int change(UserVO vo);

//	UserVO logout(UserVO vo);
	
	UserVO info(UserVO vo);

	void update(UserVO vo);

	void delete(UserVO vo);

}



