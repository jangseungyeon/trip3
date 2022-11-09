package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.planner.LikeService;
import com.springbook.biz.planner.LikeVO;
import com.springbook.biz.planner.PlannerVO;


@Controller
public class LikeController {

	@Autowired
	private LikeService Service;
	
	@ResponseBody
	@RequestMapping(value = "/Like.do")
	public void LikeCheck(@RequestParam(value = "type") int type, @RequestParam(value = "status") String status,
			LikeVO vo , String like_id , String like_no , HttpSession session) {
		vo.setLike_id(like_id);
		vo.setUser_id((String)session.getAttribute("user_id"));
		vo.setLike_no(Integer.parseInt(like_no));
		if (status.equals("like")) {
			vo.setStatus(status);
			Service.likeinsert(vo);
			Service.likeupdate(vo);
		} else if (status.equals("unlike")) {
			vo.setStatus(status);
			Service.likeupdate(vo);
			Service.likedalete(vo);
		}
		System.out.println(vo);
	}



	//좋아요 누른 리스트로 불러오기(숙소)
		@RequestMapping("/likeslist.do")
		public String likeslist(LikeVO lvo, HttpSession session, Model model) {
			lvo.setUser_id((String) session.getAttribute("user_id"));

			List<LikeVO> list = Service.likeslist(lvo);
			model.addAttribute("list", list);
			return "WEB-INF/views/my_likes.jsp";
		}
	
	//좋아요 누른 (플래너) 리스트로 불러오기
	@RequestMapping("/likeslist2.do")
	public String likeslist2(LikeVO lvo, HttpSession session, Model model) {
		lvo.setUser_id((String) session.getAttribute("user_id"));

		List<LikeVO> list = Service.likeslist2(lvo);
		model.addAttribute("list", list);
		return "WEB-INF/views/my_likes2.jsp";
	}

}
