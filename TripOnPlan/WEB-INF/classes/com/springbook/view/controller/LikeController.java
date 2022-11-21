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
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;


@Controller
public class LikeController {

	@Autowired
	private LikeService Service;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private PlannerService planner;
	
	@ResponseBody
	@RequestMapping(value = "/Like.do")
	public void LikeCheck(@RequestParam(value = "type") int type, @RequestParam(value = "status") String status,
			LikeVO vo , String like_id , String like_no , HttpSession session , PlannerVO pvo , String planner_no) {
		vo.setLike_id(like_id);
		vo.setUser_id((String)session.getAttribute("user_id"));
		vo.setLike_no(Integer.parseInt(like_no));
		if (status.equals("like")) {
			vo.setStatus(status);
			Service.likeinsert(vo);
			Service.likeupdate(vo);
			pvo.setStatus(status);
			planner.updateLike(pvo);
		} else if (status.equals("unlike")) {
			vo.setStatus(status);
			Service.likeupdate(vo);
			Service.likedalete(vo);
			pvo.setStatus(status);
			planner.updateLike(pvo);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectLike.do")
	public int selectLike(LikeVO vo , String like_no , HttpSession session) {
		vo.setLike_no(Integer.parseInt(like_no));
		vo.setLike_type(1);
		vo.setUser_id((String)session.getAttribute("user_id"));
		return Service.likeSelect(vo);
	}

	//좋아요 누른 리스트로 불러오기(숙소)
		@RequestMapping("/likeslist.do")
		public String likeslist(LikeVO lvo, HttpSession session, Model model) {
			lvo.setUser_id((String) session.getAttribute("user_id"));

			List<LikeVO> list = Service.likeslist(lvo);
			model.addAttribute("list", list);
			return "WEB-INF/views/my/my_likes.jsp";
		}
	
	//좋아요 누른 (플래너) 리스트로 불러오기
	@RequestMapping("/likeslist2.do")
	public String likeslist2(LikeVO lvo, HttpSession session, Model model) {
		lvo.setUser_id((String) session.getAttribute("user_id"));

		List<LikeVO> list = Service.likeslist2(lvo);
		model.addAttribute("list", list);
		return "WEB-INF/views/my/my_likes2.jsp";
	}

		//좋아요 누른 숙소 데이터 등록 저장하기
		@ResponseBody
		@RequestMapping("/likeinsertRoom.do")
		public void likeinsertRoom(@RequestParam(value = "status") String status, LikeVO lvo, RoomVO rvo, HttpSession session, Model model) {
			if(status.equals("like")){
				lvo.setStatus("like");
				lvo.setUser_id((String) session.getAttribute("user_id"));
				Service.likeinsertRoom(lvo);
				Service.likeupdateRoom(lvo);
				rvo.setStatus("like");
				System.out.println(rvo);
				roomService.updateLikeRoom(rvo);
			} else if (status.equals("unlike")){
				lvo.setStatus("unlike");
				lvo.setUser_id((String) session.getAttribute("user_id"));
				Service.likeupdateRoom(lvo);
				Service.likedeleteRoom(lvo);
				rvo.setStatus("unlike");
				System.out.println(rvo);
				roomService.updateLikeRoom(rvo);
			}
		}

}
