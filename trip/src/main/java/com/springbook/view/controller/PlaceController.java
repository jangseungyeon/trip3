package com.springbook.view.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.planner.AreaService;
import com.springbook.biz.planner.AreaVO;

@Controller
public class PlaceController {

		@Autowired
		private AreaService areaService;
		
		@RequestMapping(value="/getAreaList.do")
		public String getAreaList(Model model , HttpSession session , HttpServletRequest request) {
			AreaVO vo = new AreaVO();
			vo.setArea_name(request.getParameter("areaname"));
			model.addAttribute("size" , areaService.getAreaList().size());
			model.addAttribute("AreaList", areaService.getAreaList());
			model.addAttribute("Area", areaService.getArea(vo));
			return "WEB-INF/views/plannerInsert/plannerInsert2.jsp";
		}
}
