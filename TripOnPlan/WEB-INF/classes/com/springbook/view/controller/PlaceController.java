package com.springbook.view.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.planner.AreaService;
import com.springbook.biz.planner.AreaVO;
import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerMemoVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Controller
public class PlaceController {

		@Autowired
		private AreaService areaService;
		
		@Autowired
		private PlannerService Service;
		
		@RequestMapping(value="/getAreaList.do")
		public String getAreaList(Model model , HttpSession session , HttpServletRequest request , PlannerVO pvo , PlaceVO place
			,	PlannerMemoVO memo) {
			AreaVO vo = new AreaVO();
			vo.setArea_name(request.getParameter("areaname"));
			model.addAttribute("size" , areaService.getAreaList().size());
			model.addAttribute("AreaList", areaService.getAreaList());
			model.addAttribute("Area", areaService.getArea(vo));
			if(request.getParameter("area") != null) {
				vo.setArea_name(request.getParameter("area"));
				model.addAttribute("planner", Service.plannerinfo(pvo));
				model.addAttribute("place" , Service.getPlace(place));
				model.addAttribute("count" , Service.getPlace(place).size());
				model.addAttribute("size" , areaService.getAreaList().size());
				model.addAttribute("AreaList", areaService.getAreaList());
				model.addAttribute("Area", areaService.getArea(vo));
				model.addAttribute("memo", Service.selectMemo(memo));
				return "WEB-INF/views/plannerInsert/plannerInsert3.jsp";
			}
			return "WEB-INF/views/plannerInsert/plannerInsert2.jsp";
		}
}
