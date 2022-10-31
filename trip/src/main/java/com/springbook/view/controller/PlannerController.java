package com.springbook.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Controller
public class PlannerController {
	
	@Autowired
	private PlannerService plannerService;
		
	@RequestMapping("/start.do") // 인덱스 페이지에서 들어올 때 
	public String start(HttpSession session , HttpServletRequest request) {
		if(request.getParameter("check") != null) {
				session.setAttribute("start", request.getParameter("start"));
				session.setAttribute("end", request.getParameter("end"));
				session.setAttribute("areaname", request.getParameter("areaname"));
				session.setAttribute("numPeople", request.getParameter("numPeople"));
				session.setAttribute("date", request.getParameter("date"));
				//return("WEB-INF/plannerInsert/plannerInsert2.jsp");
				return("getAreaList.do?areaname=" + request.getParameter("areaname"));
		}return("WEB-INF/views/plannerInsert/plannerInsert.jsp");
	}


//	내가 작성한 플래너 정보 가져오기
	@RequestMapping("/plannerinfo.do")
	public String plannerinfo(PlannerVO pvo, HttpSession session, Model model) {
		pvo.setUser_id((String)session.getAttribute("user_id"));
		pvo = plannerService.plannerinfo(pvo);
		System.out.println("플래너 정보: "+pvo);
		if (pvo != null) {
			String user_id = pvo.getUser_id();
			session.setAttribute("user_id", user_id);
			model.addAttribute("room_id", pvo.getRoom_id());
			model.addAttribute("room_name", pvo.getRoom_name());
			model.addAttribute("room_max", pvo.getRoom_max());
			model.addAttribute("planner_start", pvo.getPlanner_start());
			model.addAttribute("planner_end", pvo.getPlanner_end());
			model.addAttribute("planner_area", pvo.getPlanner_area());
			model.addAttribute("planner_title", pvo.getPlanner_title());
			model.addAttribute("planner_day", pvo.getPlanner_day());
			return "WEB-INF/views/myPlanner.jsp";
		} else {
			return "index.jsp";
		}
	}
	
}
