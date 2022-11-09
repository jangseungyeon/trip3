package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Controller
public class PlannerController {

	@Autowired
	private PlannerService plannerService;

//	@Autowired
//	private com.springbook.biz.planner.CommentService CommentService;

	// 관리자 플레너 조회
	@RequestMapping("/manage_plannerList.do")
	public String manage_plannerList(Model model) {

		// 서비스에서 사용자 리스트 조회
		List<PlannerVO> list = plannerService.manage_plannerList();
		model.addAttribute("list", list);
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_plannerList.jsp";
	}

	// 관리자 플레너 가입 폼 이동
	@RequestMapping("/manage_plannerInsertForm.do")
	public String manage_plannerInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_plannerInsert.jsp";
	}

	// 관리자 플레너 등록
	@RequestMapping("/manage_plannerInsert.do")
	public String manage_plannerInsert(@ModelAttribute PlannerVO vo) {
		System.out.println("manage_plannerInsert");
		plannerService.manage_plannerInsert(vo);
		return "redirect:manage_plannerList.do";
	}

	// 관리자 플레너 상세 조회
	@RequestMapping("/manage_plannerInfo.do")
	public String manage_plannerInfo(PlannerVO vo, Model model) {
		model.addAttribute("PlannerVO", plannerService.manage_plannerInfo(vo));
		return "WEB-INF/views/manage_plannerInfo.jsp";
	}

	// 관리자 플레너 정보 수정
	@RequestMapping("/manage_plannerUpdate.do")
	public String manage_plannerUpdate(@ModelAttribute PlannerVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		plannerService.manage_plannerUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);
		return "manage_plannerList.do";
	}

	// 관리자 플레너 삭제
	@RequestMapping("/manage_plannerDelete.do")
	public String manage_plannerDelete(PlannerVO vo, PlaceVO pvo) {
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		plannerService.manage_plannerDelete(vo);
		plannerService.manage_placeDelete(pvo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		return "manage_plannerList.do";
	}

	
	
	
//	@RequestMapping("/start.do") // 인덱스 페이지에서 들어올 때
//	public String start(HttpSession session, HttpServletRequest request) {
//		if (request.getParameter("check") != null) {
//			session.setAttribute("start", request.getParameter("start"));
//			session.setAttribute("end", request.getParameter("end"));
//			session.setAttribute("areaname", request.getParameter("areaname"));
//			session.setAttribute("numPeople", request.getParameter("numPeople"));
//			session.setAttribute("date", request.getParameter("date"));
//			session.setAttribute("id", (String) session.getAttribute("user_id"));
//			return ("getAreaList.do?areaname=" + request.getParameter("areaname"));
//		}
//		return ("WEB-INF/views/plannerInsert/plannerInsert.jsp");
//	}
//
//	@RequestMapping(value = "/testValue.do")
//	public String test(@RequestParam(value = "placeTab", required = false) String[] arr, HttpServletRequest request,
//			HttpSession session, PlannerVO vop) {
//		int day = Integer.parseInt((String) session.getAttribute("date")) + 1;
//		vop.setPlanner_start((String) session.getAttribute("start"));
//		vop.setPlanner_end((String) session.getAttribute("end"));
//		vop.setUser_id((String) session.getAttribute("user_id"));
//		vop.setRoom_name(request.getParameter("name"));
//		vop.setPlanner_area((String) session.getAttribute("areaname"));
//		vop.setPlanner_day(Integer.toString(day));
//		System.out.println(vop.getPlanner_title());
//		Service.insertPlanner(vop);
//		List<PlaceVO> tourList = new ArrayList<PlaceVO>();
//		String[] tableArr = new String[6];
//		for (int i = 0; i < arr.length; i++) {
//			PlaceVO vo = new PlaceVO();
//			tableArr = arr[i].split("===");
//			vo.setUser_id((String) session.getAttribute("user_id"));
//			vo.setPlanner_date(tableArr[0]);
//			vo.setPlace_name(tableArr[1]);
//			vo.setAddr(tableArr[2]);
//			vo.setMapx(tableArr[3]);
//			vo.setMapy(tableArr[4]);
//			vo.setImg(tableArr[5]);
//
//			tourList.add(vo);
//		}
//		Service.insertPlace(tourList);
//
//		return "WEB-INF/views/main.jsp";
//	}
//
////	내가 작성한 플래너 정보 가져오기
//	@RequestMapping("/plannerinfo.do")
//	public String plannerinfo(PlannerVO pvo, HttpSession session, Model model, PlaceVO vo) {
//		pvo.setUser_id((String) session.getAttribute("user_id"));
//		pvo = Service.plannerinfo(pvo);
//		model.addAttribute("placeList", Service.getPlace(vo));
//		System.out.println("플래너 정보: " + pvo);
//		if (pvo != null) {
//			String user_id = pvo.getUser_id();
//			session.setAttribute("user_id", user_id);
//			model.addAttribute("planner_no", pvo.getPlanner_no());
//			model.addAttribute("room_name", pvo.getRoom_name());
//			model.addAttribute("planner_start", pvo.getPlanner_start());
//			model.addAttribute("planner_end", pvo.getPlanner_end());
//			model.addAttribute("planner_area", pvo.getPlanner_area());
//			model.addAttribute("planner_title", pvo.getPlanner_title());
//			model.addAttribute("planner_day", pvo.getPlanner_day());
//			return "WEB-INF/views/detailPlanner.jsp";
//		} else {
//			return "index.jsp";
//		}
//	}
//
//	// 리스트로 불러오기
//	@RequestMapping("/manage_plannerList.do")
//	public String plannerlist(PlannerVO pvo, HttpSession session, Model model, HttpServletRequest request) {
//		if (request.getParameter("page") != null) {
//			if (request.getParameter("page").equals("Y")) {
//				model.addAttribute("plannerList", Service.plannerPage());
//				return "WEB-INF/views/manage_plannerList.jsp";
//			}
//		}
//		pvo.setUser_id((String) session.getAttribute("user_id"));
//		List<PlannerVO> list = Service.plannerlist(pvo);
//		model.addAttribute("list", list);
//		return "WEB-INF/views/manage_plannerList.jsp";
//	}
//
//	@RequestMapping("/plannerDP.do")
//	public String plannerDetailPage(PlannerVO vo, Model model, PlaceVO pvo, HttpSession session) {
//		model.addAttribute("planner", Service.plannerinfo(vo));
//		model.addAttribute("place", Service.getPlace(pvo));
//		model.addAttribute("comment", CommentService.selectComment(vo));
//		model.addAttribute("reply", CommentService.selectReply(vo));
//		model.addAttribute("userID", (String) session.getAttribute("user_id"));
//		return "WEB-INF/views/plannerInsert/plannerDetailPage.jsp";
//	}
//
//	@ResponseBody
//	@RequestMapping("/plannerRE.do")
//	public List<ReplyVO> plannerRE(String id, String num, PlannerVO vo, HttpSession session) {
//		vo.setUser_id((String) session.getAttribute("user_id"));
//		vo.setPlanner_no(num);
//		List<ReplyVO> Re = CommentService.selectReply(vo);
//		return Re;
//	}
//
//	@RequestMapping("/deletePlanner.do")
//	public String deletePlanner(PlannerVO vo, PlaceVO pvo) {
//		Service.deltePlanner(vo);
//		Service.deletePlace(pvo);
//		return "plannerlist.do";
//	}

}
