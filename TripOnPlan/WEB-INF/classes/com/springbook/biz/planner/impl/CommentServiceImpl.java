package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.CommentService;
import com.springbook.biz.planner.CommentVO;
import com.springbook.biz.planner.PlannerVO;
import com.springbook.biz.planner.ReplyVO;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDAOMybatis CommentDAO;
	
	@Override
	public int insertComment(CommentVO vo) {
		return CommentDAO.insertComment(vo);
	}

	@Override
	public List<CommentVO> selectComment(PlannerVO vo) {
		return CommentDAO.selectComment(vo);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		return CommentDAO.insertReply(vo);
	}

	@Override
	public List<ReplyVO> selectReply(PlannerVO vo) {
		return CommentDAO.selectReply(vo);
	}


	@Override
	public int commentDelete(CommentVO vo) {
		return CommentDAO.deleteComment(vo);
		
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		return CommentDAO.deleteReply(vo);
	}

	@Override
	public int commentUpdate(CommentVO vo) {
		return CommentDAO.updateComment(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return CommentDAO.updateReply(vo);
	}
	


	
}
