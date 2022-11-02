package com.springbook.view.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Controller
public class PlannerController {
		
	@Autowired
	private PlannerService Service;
	
	
	@RequestMapping("/start.do") // 인덱스 페이지에서 들어올 때 
	public String start(HttpSession session , HttpServletRequest request) {
		if(request.getParameter("check") != null) {
				session.setAttribute("start", request.getParameter("start"));
				session.setAttribute("end", request.getParameter("end"));
				session.setAttribute("areaname", request.getParameter("areaname"));
				session.setAttribute("numPeople", request.getParameter("numPeople"));
				session.setAttribute("date", request.getParameter("date"));
				session.setAttribute("id", "KSY");
				return("getAreaList.do?areaname=" + request.getParameter("areaname"));
		}return("WEB-INF/views/plannerInsert/plannerInsert.jsp");
	}
	
	@RequestMapping("/testValue.do")
	public String test(@RequestParam(value="placeTab", required=false) String[] arr , HttpServletRequest request , HttpSession session) {
			int day = Integer.parseInt((String)session.getAttribute("date")) + 1;
			PlannerVO vop = new PlannerVO();
			vop.setPlanner_start((String)session.getAttribute("start"));
			vop.setPlanner_end((String)session.getAttribute("end"));
			vop.setUser_id("KSY");
			vop.setPlanner_title(request.getParameter("title"));
			vop.setRoom_name(request.getParameter("name"));
			vop.setPalnner_area((String)session.getAttribute("areaname"));
			vop.setPlanner_day(Integer.toString(day));
			
			Service.insertPlanner(vop);
			List<PlaceVO> tourList = new ArrayList<PlaceVO>();
			String[] tableArr = new String[6];
			for(int i=0; i<arr.length; i++) {
				PlaceVO vo = new PlaceVO();
				tableArr = arr[i].split("===");
				vo.setUser_id("KSY");
				vo.setPlanner_date(tableArr[0]);
				vo.setPlace_name(tableArr[1]);
				vo.setAddr(tableArr[2]);
				vo.setMapx(tableArr[3]);
				vo.setMapy(tableArr[4]);
				vo.setImg(tableArr[5]);
				
				tourList.add(vo);
			}
			Service.insertPlace(tourList);
		
	 return "";
	}
	
//	내가 작성한 플래너 정보 가져오기
	@RequestMapping("/plannerinfo.do")
	public String plannerinfo(PlannerVO pvo, HttpSession session, Model model) {
		pvo.setUser_id((String)session.getAttribute("user_id"));
		pvo = Service.plannerinfo(pvo);
		System.out.println("플래너 정보: "+pvo);
		if (pvo != null) {
			String user_id = pvo.getUser_id();
			session.setAttribute("user_id", user_id);
			model.addAttribute("room_name", pvo.getRoom_name());
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
