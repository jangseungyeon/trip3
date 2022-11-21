package com.springbook.biz.planner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.LikeVO;

@Repository
public class LikeDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int likeinsert(LikeVO vo) {
		System.out.println("likeinsert 메소드 실행");
		return mybatis.insert("LikeDAO.likeinsert" , vo);
	}
	
	public void likeupdate(LikeVO vo) {
		System.out.println("likeupdate 메소드 실행");
		mybatis.update("LikeDAO.likeupdate" , vo);
	}
	
	public void likedelete(LikeVO vo) {
		System.out.println("likedelete 메소드 실행");
		mybatis.update("LikeDAO.likedelete" , vo);
	}
	
	public List<LikeVO> likeslist(LikeVO lvo) {
		System.out.println("다오에서 likelist 실행");
		return mybatis.selectList("LikeDAO.likelist", lvo);
	}

	public List<LikeVO> likeslist2(LikeVO lvo) {
		System.out.println("다오에서 likelist 실행");
		return mybatis.selectList("LikeDAO.likelist2", lvo);
	}
}
