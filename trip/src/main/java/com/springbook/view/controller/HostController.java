package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;
	
	//호스트추가
	@RequestMapping("/host_insert.do")
	public String hostInsert(HostVO vo) {
		int insert = hostService.insert(vo);
		if (insert == 0) {
			return "host_insert.jsp?insert=0";
		} else {
			return "host_login.jsp?insert=1";
		}
	}
	
	
	//아이디중복체크
	@RequestMapping("/host_id_check.do")
	@ResponseBody
	public int hostIdCheck(HostVO vo) {
		return hostService.idCheck(vo);
	}
	
	//호스트로그인
	@RequestMapping("/host_login.do")
	public String hostLogin(HostVO vo, HttpSession session) {
		vo = hostService.login(vo);
		System.out.println("111");
		if (vo != null) {
			String host_id = vo.getHost_id();
			String host_bizname = vo.getHost_bizname();
			session.setAttribute("host_id", host_id);
			session.setAttribute("host_bizname", host_bizname);
			return "host_index.jsp";
		} else {
			return "host_login.jsp?fail=1";
		}	
	}
	
	//로그아웃
	@RequestMapping("/host_logout.do")
	public String host_logout (HttpSession session) {
		session.invalidate();
		return "host_login.jsp";
	}
	
}
