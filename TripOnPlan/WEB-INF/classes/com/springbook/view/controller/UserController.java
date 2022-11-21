package com.springbook.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
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
	
	// 약관동의로이동
		@RequestMapping("/step1.do")
		public String step() {
			System.out.println("step");
			return "WEB-INF/views/step1.jsp";
		}
		
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
			boolean pwCheck;
			String user_password = vo.getUser_password();
			System.out.println("user_login" + vo);
			vo = userService.login(vo);
			System.out.println("vo널체크" + vo);
			if (vo != null && vo.getUser_status().equals("0")) {
				System.out.println("암호화비교");
				pwCheck = BCrypt.checkpw(user_password, vo.getUser_password());
				System.out.println(vo.getUser_status() + pwCheck);
				if (pwCheck) {
					String user_id = vo.getUser_id();
					String user_name = vo.getUser_name();
					session.setAttribute("user_id", user_id);
					session.setAttribute("user_name", user_name);
					System.out.println("로그인성공");
					return "redirect:index.jsp";
				} else {
					System.out.println("로그인실패");
					return "WEB-INF/views/user_login.jsp";
				}
			} else if (vo == null) {
				System.out.println("로그인실패");
				return "WEB-INF/views/user_login.jsp";
			} else if (vo.getUser_status().equals("1")) {
				System.out.println("탈퇴회원");
				return "WEB-INF/views/user_login.jsp";
			} else {
				System.out.println("로그인실패");
				return "WEB-INF/views/user_login.jsp";
			}
		}
		
		// 카카오로그인
		@RequestMapping("/kakao_loginform.do")
		public String kakao_login(UserVO vo, HttpSession session, HttpServletResponse response) {
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
			} else if (vo.getUser_status().equals("0")) {
				System.out.println("탈퇴회원");
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
		public String naver_login(UserVO vo, HttpSession session, HttpServletResponse response) {
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
			} else if (vo.getUser_status().equals("0")) {
				System.out.println("탈퇴회원");
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


//회원 삭제
		@RequestMapping("/delete.do")
		public String delete(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
			vo.setUser_id((String)session.getAttribute("user_id"));
			System.out.println("회원탈퇴 컨트롤러 입장" + vo);
				userService.delete(vo);
				System.out.println("쿼리문 끝나고 컨트롤러" + vo);
				session.invalidate(); 
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('회원 탈퇴가 완료되었습니다.')");
				out.println("location.href='index.jsp'");
				out.println("</script>");
				out.flush();
				
				return "index.jsp";
			} 



//	회원수정
	@RequestMapping("/user_update.do")
	public String user_update(Model model, UserVO vo, HttpServletResponse response) throws IOException {
		System.out.println("컨트롤러 입장");
		userService.update(vo);
		System.out.println("컨트롤러 vo : " +vo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('수정이 완료되었습니다..')");
		out.println("location.href='user_info.do'");
		out.println("</script>");
		out.flush();
		return "user_info.do";
	}

	//내 정보 갈때 비밀번호 치기
		@RequestMapping("/myinfogo.do")
		public String myinfogo(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
			vo.setUser_id((String) session.getAttribute("user_id"));
			String pw =vo.getUser_password();
			boolean pwCheck;
			vo = userService.info(vo);
			String user_password = vo.getUser_password();
			pwCheck=BCrypt.checkpw(pw,user_password);
			System.out.println(pwCheck);
			if(pwCheck) {
			return "user_info.do";
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.')");
				out.println("location.href='myinfo.do'");
				out.println("</script>");
				out.flush();
				return "WEB-INF/views/my/my_Check.jsp";
			}
		}
	
	@RequestMapping("/myinfo.do")
	public String mycheck(UserVO vo, HttpSession session) {
		return "WEB-INF/views/my/my_Check.jsp";
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
			return "WEB-INF/views/my/my_info.jsp";
		} else {
			return "index.jsp";
		}
	}

	// 회원추가
		@RequestMapping("/user_insertform.do")
		public String user_insert(UserVO vo, HttpServletResponse response) {
			String pw = BCrypt.hashpw(vo.getUser_password(), BCrypt.gensalt());
			System.out.println("isnsertuser" + pw);
			vo.setUser_type("own");
			vo.setUser_password(pw);
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
		List<UserVO> user =  userService.find(vo);
		System.out.println("찾은결과: " + user);
		if (user != null) {
//			for(UserVO vo1 : user) {
			model.addAttribute("user", user);
//			}
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
		List<UserVO> user = (List<UserVO>) userService.find(vo);
		System.out.println("찾은결과: " + vo);
		if (user != null) {
			model.addAttribute("user", user);
			return "WEB-INF/views/user_pwfind.jsp";
		} else {
			return "WEB-INF/views/user_pwfind.jsp";
		}

	}
	// 비밀번호 변경하기
		@RequestMapping("/user_change.do")
		public String user_change(UserVO vo, Model model) {
			String pw = BCrypt.hashpw(vo.getUser_password(), BCrypt.gensalt());
			vo.setUser_password(pw);
			System.out.println("비밀번호변경" + vo);
			int a = userService.change(vo);
			System.out.println("변경여부:" + a);
			return "WEB-INF/views/user_login.jsp";
		}

	}
