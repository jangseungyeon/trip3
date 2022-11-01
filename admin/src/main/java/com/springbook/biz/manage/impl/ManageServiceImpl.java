package com.springbook.biz.manage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.manage.ManageService;
import com.springbook.biz.manage.ManageUserVO;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired
	private ManageDAOMybatis manageDAO;
	
	@Override
	public ManageUserVO login(ManageUserVO vo) {
		return manageDAO.manage_login(vo);
	}
//
//	@Override
//	public int insert(UserVO vo) {
//		System.out.println("11");
//		return userDAO.insertUser(vo);
//
//	}
//	@Override
//	public int idCheck(UserVO vo) {
//		System.out.println("11");
//		return userDAO.user_idCheck(vo);
//	}
//	@Override
//	public UserVO login(UserVO vo) {
//		System.out.println("user_login");
//		return userDAO.user_login(vo);
//	}
//	@Override
//	public UserVO find(UserVO vo) {
//		System.out.println("user_find");
//		return userDAO.user_find(vo);
//	}
//	@Override
//	public int change(UserVO vo) {
//		System.out.println("user_change");
//		return userDAO.user_change(vo);
//	}
//	@Override
//	public UserVO logout(UserVO vo) {
//		System.out.println("user_logout");
//		return userDAO.user_logout(vo);
//	}
//	@Override
//	public UserVO info(UserVO vo) {
//		
//		return userDAO.user_info(vo);
//	}
//	
//	@Override
//	public void update(UserVO vo) {
//		System.out.println("서비스impl");
//		userDAO.user_update(vo);
//	}
//	@Override
//	public void delete(UserVO vo) {
//		userDAO.user_delete(vo);
//	}

	
}
