package com.springbook.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
		
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
	
}
