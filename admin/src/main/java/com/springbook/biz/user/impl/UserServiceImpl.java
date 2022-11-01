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
	
//	관리자 회원 조회
	@Override
	public List<UserVO> manage_userList() {
		return userDAO.manage_userList();
	}
	
// 	관리자 회원 등록	
	@Override
	public int manage_userInsert(UserVO vo) {
		System.out.println("회원 등록");
		return userDAO.manage_userInsert(vo);
	}
	
//  관리자 회원 상세 조회
	@Override
	public UserVO manage_userInfo(String user_id) {
		return userDAO.manage_userInfo(user_id);
	}

// 	관리자 회원 정보 수정
	@Override
	public void manage_userUpdate(UserVO vo) {
		userDAO.manage_userUpdate(vo);
	}
	
	
	
	
	
	
	@Override
	public int insert(UserVO vo) {
		System.out.println("회원 등록");
		return userDAO.insertUser(vo);
		
	}
	
	@Override
	public int idCheck(UserVO vo) {
		System.out.println("11");
		return userDAO.user_idCheck(vo);
	}
	@Override
	public UserVO login(UserVO vo) {
		System.out.println("user_login");
		return userDAO.user_login(vo);
	}
	@Override
	public UserVO find(UserVO vo) {
		System.out.println("user_find");
		return userDAO.user_find(vo);
	}
	@Override
	public int change(UserVO vo) {
		System.out.println("user_change");
		return userDAO.user_change(vo);
	}
//	@Override
//	public UserVO logout(UserVO vo) {
//		System.out.println("user_logout");
//		return userDAO.user_logout(vo);
//	}
	@Override
	public UserVO info(UserVO vo) {
		return userDAO.user_info(vo);
	}
	
	@Override
	public void update(UserVO vo) {
		System.out.println("서비스impl");
		userDAO.user_update(vo);
	}
	@Override
	public void delete(UserVO vo) {
		userDAO.user_delete(vo);
	}


	

}
