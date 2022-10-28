package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// 회원추가
	@RequestMapping("/user_insert.do")
	public String user_insert(UserVO vo) {
		System.out.println("isnsertuser");
		vo.setUser_type("own");
		int insert = userService.insert(vo);
		if (insert == 0) {
			return "insert.jsp?insert=0";
		} else {
			return "index.jsp?insert=1";
		}

	}

	// 아이디중복체크
	@RequestMapping("/user_idCheck.do")
	@ResponseBody
	public int user_idCheck(UserVO vo) {
		System.out.println("idcheck" + vo);
		return userService.idCheck(vo);
	}

	// 로그인
	@RequestMapping("/user_login.do")
	public String user_login(UserVO vo, HttpSession session) {
		System.out.println("user_login" + vo);
		vo = userService.login(vo);
		if (vo != null) {
			String user_id = vo.getUser_id();
			String user_name = vo.getUser_name();
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			System.out.println("로그인성공");
			return "redirect:index.jsp";
		} else {
			System.out.println("로그인실패");
return "redirect:user_login.jsp?fail=1";
		}
		

	}

	// 카카오로그인
	@RequestMapping("/kakao_login.do")
	public String kakao_login(UserVO vo) {
		vo.setUser_type("kakao");
		System.out.println("kakao_login" + vo);
		if (userService.login(vo) == null) {
			System.out.println("카카오회원추가");
			userService.insert(vo);
			return "user_login.do";
		} else {
			System.out.println("카카오로그인");
			return "user_login.do";
		}

	}
	
	
	//네이버로그인
	@RequestMapping("/naver_login.do")
	public String naver_login(UserVO vo) {
		vo.setUser_type("naver");
		System.out.println("네이버로그인"+vo);
		if (userService.login(vo) == null) {
			System.out.println("네이버회원추가");
			userService.insert(vo);
			return "user_login.do";
		} else {
			System.out.println("네이버로그인");
			return "user_login.do";
		}
	}
	
	// 체크중로그아웃
//	@RequestMapping("/user_logout.do")
//	public String user_logout(HttpSession session,Model model) {
//		String id=(String)session.getAttribute("user_id");
//		System.out.println("로그아웃"+id);
//		UserVO vo=new UserVO();
//		vo.setUser_id(id);
//		vo=userService.logout(vo);
//		if(vo.getUser_type().equals("kakao")) {
//			
//		}else if(vo.getUser_type().equals("naver")){
//			model.addAttribute("user_type","naver");
//			System.out.println("네이버로그아웃");
//			session.invalidate();
//			return "redirect:index.jsp";
//		}
//		session.invalidate();
//		return "redirect:index.jsp";
//	}
	// 로그아웃
		@RequestMapping("/user_logout.do")
		public String user_logout(HttpSession session) {
			System.out.println("로그아웃");
				session.invalidate();
			return "redirect:index.jsp";
		}
	//아이디찾기
	@RequestMapping("/user_find.do")
	public String user_find(UserVO vo,Model model) {
		vo.setUser_type("own");
		System.out.println("아이디찾기"+vo);
		vo=userService.find(vo);
		System.out.println("찾은결과: "+vo);
		if(vo!=null) {
			model.addAttribute("user", vo.getUser_id());
			return "user_find.jsp";}else {
				return "user_find.jsp";
			}
			
	}
	
	//비밀번호찾기
		@RequestMapping("/user_pwfind.do")
		public String user_pwfind(UserVO vo,Model model) {
			vo.setUser_type("own");
			System.out.println("비밀번호찾기"+vo);
			vo=userService.find(vo);
			System.out.println("찾은결과: "+vo);
			if(vo!=null) {
				model.addAttribute("user", vo.getUser_id());
				return "user_pwfind.jsp";}else {
					return "user_pwfind.jsp";
				}
				
		}
		//비밀번호 변경하기
		
		@RequestMapping("/user_change.do")
		public String user_change(UserVO vo,Model model) {
			System.out.println("비밀번호변경"+vo);
			int a=userService.change(vo);
			System.out.println("변경여부:" +a);
			return "user_pwfind.jsp";			
		}
		
		
}
