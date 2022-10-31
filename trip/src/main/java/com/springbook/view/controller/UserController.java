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

	// 아이디중복체크
	@RequestMapping("/user_idCheck.do")
	@ResponseBody
	public int user_idCheck(UserVO vo) {
		System.out.println("idcheck" + vo);
		return userService.idCheck(vo);
	}

	// 로그인페이지이동
	@RequestMapping("/user.login.do")
	public String user_login() {
		System.out.println("로그인페이지로이동");
		return "WEB-INF/views/user_login.jsp";
	}

	// 로그인
	@RequestMapping("/user_loginform.do")
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
			return "WEB-INF/views/user_login.jsp?fail=1";
		}

	}

	// 카카오로그인
	@RequestMapping("/kakao_loginform.do")
	public String kakao_login(UserVO vo, HttpSession session) {
		vo.setUser_type("kakao");
		System.out.println("kakao_login" + vo);
		String user_id = vo.getUser_id();
		String user_name = vo.getUser_name();
		if (userService.login(vo) == null) {
			System.out.println("카카오회원추가");
			userService.insert(vo);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			return "redirect:index.jsp";
		} else {
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			System.out.println("카카오로그인");
			return "redirect:index.jsp";
		}

	}

	// 네이버로그인
	@RequestMapping("/naver_login.do")
	public String naver_login(UserVO vo, HttpSession session) {
		vo.setUser_type("naver");
		System.out.println("네이버로그인" + vo);
		String user_id = vo.getUser_id();
		String user_name = vo.getUser_name();
		if (userService.login(vo) == null) {
			System.out.println("네이버회원추가");
			userService.insert(vo);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			return "redirect:index.jsp";
		} else {
			System.out.println("네이버로그인");
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			return "redirect:index.jsp";
		}
	}

	

	

	// 회원가입
	@RequestMapping("/user_insert.do")
	public String user_insert() {
		System.out.println("회원가입로이동");
		return "WEB-INF/views/user_insert.jsp";
	}

//	회원수정
	@RequestMapping("/user_update.do")
	public String user_update(Model model, UserVO vo) {
		System.out.println("컨트롤러 입장");
		userService.update(vo);
		System.out.println("컨트롤러 vo : " + vo);
		return "user_info.do";
	}

//	내 정보 확인
	@RequestMapping("/user_info.do")
	public String user_info(UserVO vo, HttpSession session, Model model) {
		vo.setUser_id((String) session.getAttribute("user_id"));
		vo = userService.info(vo);
		System.out.println("내정보확인: " + vo);
		if (vo != null) {
			String user_id = vo.getUser_id();
			String user_name = vo.getUser_name();
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", user_name);
			model.addAttribute("user_password", vo.getUser_password());
			model.addAttribute("user_birth", vo.getUser_birth());
			model.addAttribute("user_gender", vo.getUser_gender());
			model.addAttribute("user_email", vo.getUser_email());
			model.addAttribute("user_phone", vo.getUser_phone());
			model.addAttribute("user_address1", vo.getUser_address1());
			model.addAttribute("user_address2", vo.getUser_address2());
			return "myinfo.jsp";
		} else {
			return "myinfo.jsp";
		}
	}

	// 회원추가
	@RequestMapping("/user_insertform.do")
	public String user_insert(UserVO vo) {
		System.out.println("isnsertuser");
		vo.setUser_type("own");
		int insert = userService.insert(vo);
		if (insert == 0) {
			return "redirect:index.jsp";
		} else {
			return "redirect:index.jsp";
		}

	}

	// 로그아웃
	@RequestMapping("/user_logout.do")
	public String user_logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	// 아이디찾기
		@RequestMapping("/user_find.do")
		public String user_find() {
			System.out.println("아이디찾기로이동");
			return "WEB-INF/views/user_find.jsp";
		}

	// 아이디찾기폼
	@RequestMapping("/user_findform.do")
	public String user_find(UserVO vo, Model model) {
		vo.setUser_type("own");
		System.out.println("아이디찾기" + vo);
		vo = userService.find(vo);
		System.out.println("찾은결과: " + vo);
		if (vo != null) {
			model.addAttribute("user", vo.getUser_id());
			return "WEB-INF/views/user_find.jsp";
		} else {
			return "WEB-INF/views/user_find.jsp";
		}

	}
	// 비밀번호찾기
		@RequestMapping("/user_pwfind.do")
		public String user_pwfind() {
			System.out.println("비밀번호찾기로이동");
			return "WEB-INF/views/user_pwfind.jsp";
		}

	// 비밀번호찾기폼
	@RequestMapping("/user_pwfindform.do")
	public String user_pwfind(UserVO vo, Model model) {
		vo.setUser_type("own");
		System.out.println("비밀번호찾기" + vo);
		vo = userService.find(vo);
		System.out.println("찾은결과: " + vo);
		if (vo != null) {
			model.addAttribute("user", vo.getUser_id());
			return "WEB-INF/views/user_pwfind.jsp";
		} else {
			return "WEB-INF/views/user_pwfind.jsp";
		}

	}
	// 비밀번호 변경하기

	@RequestMapping("/user_change.do")
	public String user_change(UserVO vo, Model model) {
		System.out.println("비밀번호변경" + vo);
		int a = userService.change(vo);
		System.out.println("변경여부:" + a);
		return "WEB-INF/views/user_pwfind.jsp";
	}

}
