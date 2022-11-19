package com.springbook.view.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.planner.CommentService;
import com.springbook.biz.planner.CommentVO;
import com.springbook.biz.planner.ReplyVO;


@ResponseBody
@Controller
public class CommentController {

	@Autowired
	private CommentService service;
	
	@RequestMapping("comment.do")
	public int insertComment(CommentVO vo , HttpServletRequest request , String planner , String content , HttpSession session) {
		vo.setPlanner_no(Integer.parseInt(planner));
		vo.setUser_id((String)session.getAttribute("user_id"));
		vo.setComment_content(content);
		return service.insertComment(vo);
	}
	
	@RequestMapping("reply.do")
	public int insertReply(ReplyVO vo , HttpServletRequest request , String planner , String content , String comment_no , HttpSession session) {
	
		vo.setPlanner_no(Integer.parseInt(planner));
		vo.setReply_content(content);
		vo.setComment_no(Integer.parseInt(comment_no));
		vo.setUser_id((String)session.getAttribute("user_id"));
		return service.insertReply(vo);
	}
	
	@RequestMapping("/commentupdate.do")
	public int commentUpdate(CommentVO vo , HttpServletRequest request , String planner , String content ) {
		vo.setPlanner_no(Integer.parseInt(planner));
		vo.setComment_content(content);
		return service.commentUpdate(vo);
	}
	
	@RequestMapping("/commentdelete.do")
	public int commentDelete(CommentVO vo , HttpServletRequest request , String comment_no , ReplyVO rvo) {
		rvo.setComment_no(Integer.parseInt(comment_no));
		service.replyDelete(rvo);
		return service.commentDelete(vo);
	}
	
	@RequestMapping("/replyupdate.do")
	public int replyUpdate(ReplyVO vo , String comment_no , String content ) {
		vo.setReply_no(Integer.parseInt(comment_no));
		vo.setReply_content(content);
		return service.replyUpdate(vo);
	}
	
	@RequestMapping("/replydelete.do")
	public int replyDelete(ReplyVO vo , HttpServletRequest request , String reply_no) {
		vo.setReply_no(Integer.parseInt(reply_no));
		return service.replyDelete(vo);
	}
	
	
}
