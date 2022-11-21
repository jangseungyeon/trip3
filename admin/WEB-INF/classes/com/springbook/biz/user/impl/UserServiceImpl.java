package com.springbook.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAOMybatis userDAO;

// 	관리자 회원 등록	
	@Override
	public int manage_userInsert(UserVO vo) {
		System.out.println("회원 등록");
		return userDAO.manage_userInsert(vo);
	}

// 	관리자 회원 정보 수정
	@Override
	public void manage_userUpdate(UserVO vo) {
		userDAO.manage_userUpdate(vo);
	}

// 	관리자 회원 삭제	
	@Override
	public void manage_userDelete(UserVO vo) {
		userDAO.manage_userDelete(vo);
	}

//	관리자 회원 조회
	@Override
	public List<UserVO> manage_userList(UserVO vo) {
		return userDAO.manage_userList(vo);
	}

//  관리자 회원 상세
	@Override
	public UserVO manage_userInfo(UserVO vo) {
		return userDAO.manage_userInfo(vo);
	}

//	관리자 회원 개수
	@Override
	public int totalUserListCnt(UserVO vo) {
		return userDAO.totalUserListCnt(vo);
	}

//	아이디 체크	
	@Override
	public int idCheck(UserVO vo) {
		return userDAO.user_idCheck(vo);
	}

}
