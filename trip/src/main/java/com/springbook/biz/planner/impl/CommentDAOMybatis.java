package com.springbook.biz.planner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.planner.CommentVO;
import com.springbook.biz.planner.PlannerVO;
import com.springbook.biz.planner.ReplyVO;

@Repository
public class CommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertComment(CommentVO vo) {
		System.out.println("insertComment 메소드 실행");
		return mybatis.insert("commentDAO.commentInsert", vo);
	}
	
	public int insertReply(ReplyVO vo) {
		System.out.println("ReplyVO 메소드 실행");
		return mybatis.insert("replyDAO.replyInsert", vo);
	}
	
	public List<CommentVO> selectComment(PlannerVO vo){
		return mybatis.selectList("commentDAO.selectComment" , vo);
	}
	
	public List<ReplyVO> selectReply(PlannerVO vo){
		return mybatis.selectList("replyDAO.selectReply" , vo);
	}
	
	public int deleteComment(CommentVO vo) {
		return mybatis.delete("commentDAO.commentDelete", vo);
	}
	
	public int deleteReply(ReplyVO vo) {
		return mybatis.delete("replyDAO.replyDelete" , vo);
	}

	public int updateComment(CommentVO vo) {
		return mybatis.update("commentDAO.commentUpdate", vo);
	}

	public int updateReply(ReplyVO vo) {
		return mybatis.update("replyDAO.replyUpdate" , vo);
	}
	
}
