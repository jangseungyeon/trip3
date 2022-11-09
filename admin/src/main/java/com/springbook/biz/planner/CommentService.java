package com.springbook.biz.planner;

import java.util.List;

public interface CommentService {
	int insertComment(CommentVO vo);
	
	int commentDelete(CommentVO vo);
	
	List<CommentVO> selectComment(PlannerVO vo);
	
	int replyDelete(ReplyVO vo);
	
	int insertReply(ReplyVO vo);
	
	List<ReplyVO> selectReply(PlannerVO vo);
	
	int commentUpdate(CommentVO vo);
	
	int replyUpdate(ReplyVO vo);
	
}
