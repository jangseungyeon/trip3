package com.springbook.view.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.planner.AreaService;

@Controller
public class PlaceController {

		@Autowired
		private AreaService areaService;
		
		@RequestMapping(value="/getAreaList.do")
		public String getAreaList(Model model , HttpSession session , HttpServletRequest request) {
			if(request.getParameter("start") != null && request.getParameter("end") != null) {
				session.setAttribute("start", request.getParameter("start"));
				session.setAttribute("end", request.getParameter("end"));
			}
			model.addAttribute("size" , areaService.getAreaList().size());
			model.addAttribute("AreaList", areaService.getAreaList());
			return "/NewFile1.jsp";
		}
}
