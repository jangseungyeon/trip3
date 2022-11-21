package com.springbook.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.room.RoomService;

@Controller
public class MainController {

	
	@Autowired
	private PlannerService PlannerService;
	@Autowired
	private RoomService RoomService;
	
	@RequestMapping("/main.do")
	public String mainList(Model model) {
		model.addAttribute("roomList" , RoomService.mainRoomList());
		model.addAttribute("plannerList", PlannerService.mainPlannerList());
		return "WEB-INF/views/main.jsp";
	}
	
	
}
