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

// 	관리자 회원 조회	
	public List<UserVO> manage_userList() {
		System.out.println("manage_userList: ");
		return mybatis.selectList("UserDAO.manage_userList");
	}

// 	관리자 회원 등록
	public int manage_userInsert(UserVO vo) {
		System.out.println("manage_userInsert: " + vo);
		return mybatis.insert("UserDAO.manage_userInsert", vo);
	}

//  관리자 회원 상세 조회
	public UserVO manage_userInfo(UserVO vo) {
		System.out.println("manage_userInfo: " + vo);
		return mybatis.selectOne("UserDAO.manage_userInfo", vo);
	}

//	관리자 회원 정보 수정	
	public void manage_userUpdate(UserVO vo) {
		System.out.println("manage_userUpdate: " + vo);
		mybatis.update("UserDAO.manage_userUpdate", vo);
	}

//	관리자 회원 삭제
	public void manage_userDelete(UserVO vo) {
		System.out.println("manage_userDelete: ");
		mybatis.delete("UserDAO.manage_userDelete", vo);

	}

//  아이디 체크
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

}
