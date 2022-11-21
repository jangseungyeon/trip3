package com.springbook.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO user_info(UserVO vo) {
		return mybatis.selectOne("UserDAO.info",vo);
	}

	public void user_update(UserVO vo) {
		System.out.println("===>mybatis 업데이트 기능처리");
		mybatis.update("UserDAO.user_update", vo);
		 System.out.println("mybatis.update(UserDAO.user_update, vo)");
	}

	public void user_delete(UserVO vo) {
		System.out.println("===>mybatis del 기능처리");

		mybatis.delete("UserDAO.user_delete", vo);
		
	}

	public int insertUser(UserVO vo) {
		System.out.println("insertBoard");
		System.out.println("insertUser: " + vo);
		return mybatis.insert("UserDAO.user_insert", vo);
	}

	public int user_idCheck(UserVO vo) {
		System.out.println("user_idCheck");
		System.out.println("idCheck: " + vo);
		if (vo.getUser_id() != null || !vo.getUser_id().equals("")) {
			System.out.println("아이디체크 널아님");
			vo = mybatis.selectOne("UserDAO.idCheck", vo);
			if (vo != null) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return 3;
		}
	}

	public UserVO user_login(UserVO vo) {
		System.out.println("user_login: " + vo);
		return mybatis.selectOne("UserDAO.idCheck", vo);
	}
	
	
	public List<UserVO> user_find(UserVO vo) {
		System.out.println("user_find: " + vo);
		return mybatis.selectList("UserDAO.find", vo);
	}
	
	public int user_change(UserVO vo) {
		System.out.println("user_change: " + vo);
		return mybatis.update("UserDAO.change", vo);
	}
//	public UserVO user_logout(UserVO vo) {
//		return mybatis.selectOne("UserDAO.idCheck", vo);
//	}
	
}
