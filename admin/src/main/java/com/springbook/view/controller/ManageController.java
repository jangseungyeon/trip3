package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.manage.ManageService;
import com.springbook.biz.manage.ManageUserVO;

@Controller
public class ManageController {

	@Autowired
	private ManageService manageService;

	// 관리자 로그인
	@RequestMapping("/manage_login.do")
	public String manage_login(ManageUserVO vo, HttpSession session) {
		System.out.println("manage_login" + vo);
		vo = manageService.login(vo);
		if (vo != null) {
			String manage_id = vo.getManage_id();
			String manage_name = vo.getManage_name();
			session.setAttribute("manage_id", manage_id);
			session.setAttribute("manage_name", manage_name);
			System.out.println("로그인성공");
			return "WEB-INF/views/admin_main.jsp";
		} else {
			System.out.println("로그인실패");
			return "manage_login.jsp";
		}

	}

	// 관리자 로그아웃
	@RequestMapping("/manage_logout.do")
	public String manage_logout(HttpSession session) {
		session.invalidate();
		return "manage_login.jsp";
	}

	
	
	

}
