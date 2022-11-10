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
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;


@Controller
public class LikeController {

	@Autowired
	private LikeService Service;
	
	@Autowired
	private RoomService roomService;
	
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
			Service.likedelete(vo);
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
				roomService.updateLikeRoom(rvo);
			} else if (status.equals("unlike")){
				lvo.setStatus("unlike");
				lvo.setUser_id((String) session.getAttribute("user_id"));
				Service.likeupdateRoom(lvo);
				Service.likedeleteRoom(lvo);
				rvo.setStatus("unlike");
				roomService.updateLikeRoom(rvo);
			}
		}

}
