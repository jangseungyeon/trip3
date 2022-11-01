package com.springbook.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// 관리자 회원 조회
	@RequestMapping("/manage_userList.do")
	public String manage_userList(Model model) {

		// 서비스에서 사용자 리스트 조회
		List<UserVO> list = userService.manage_userList();
		model.addAttribute("list", list);
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_userList.jsp";

	}
	
	
	 @RequestMapping("/manage_userInsertForm.do")
		public String boardWriteForm(ModelAndView mv) {
			
			return "WEB-INF/views/manage_userInsert.jsp";
		}
	
	
	// 관리자 회원 추가
	@RequestMapping("/manage_userInsert.do")
	public String manage_userInsert(UserVO vo) {
		System.out.println("manage_userInsert");
		vo.setUser_type("own");
		int insert = userService.manage_userInsert(vo);
		if (insert == 0) {
			return "manage_userInsert.jsp?insert=0";
		} else {
			return "WEB-INF/views/manage_userList.jsp?insert=1";
		}

	}
	
	
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
	
	
	
	
	
	
	// 회원 삭제
	@RequestMapping("/delete.do")
	public String delete(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
//			vo.setUser_id((String)session.getAttribute("user_id"));
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		userService.delete(vo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('회원 탈퇴가 완료되었습니다.')");
		out.println("location.href='admin_index.jsp'");
		out.println("</script>");
		out.flush();

		return "index.jsp";
	}

//	
////	회원수정
//	@RequestMapping("/user_update.do")
//	public String user_update(Model model, UserVO vo, HttpServletResponse response) throws IOException {
//		System.out.println("컨트롤러 입장");
//		userService.update(vo);
//		System.out.println("컨트롤러 vo : " +vo);
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//
//		out.println("<script>");
//		out.println("alert('수정이 완료되었습니다..')");
//		out.println("location.href='user_info.do'");
//		out.println("</script>");
//		out.flush();
//		return "user_info.do";
//	}
//	
//	
////	내 정보 확인
//	@RequestMapping("/user_info.do")
//	public String user_info(UserVO vo, HttpSession session, Model model) {
//		System.out.println("내정보확인: "+vo);
//		vo.setUser_id((String)session.getAttribute("user_id"));
//		vo = userService.info(vo);
//		System.out.println("내정보확인: "+vo);
//		if (vo != null) {
//			String user_id = vo.getUser_id();
//			String user_name = vo.getUser_name();
//			session.setAttribute("user_id", user_id);
//			session.setAttribute("user_name", user_name);
//			model.addAttribute("user_password", vo.getUser_password());
//			model.addAttribute("user_birth", vo.getUser_birth());
//			model.addAttribute("user_gender", vo.getUser_gender());
//			model.addAttribute("user_email", vo.getUser_email());
//			model.addAttribute("user_phone", vo.getUser_phone());
//			model.addAttribute("user_address1", vo.getUser_address1());
//			model.addAttribute("user_address2", vo.getUser_address2());
//			return "WEB-INF/views/myinfo.jsp";
//		} else {
//			return "WEB-INF/views/myinfo.jsp";
//		}
//	}
//	

	// 아이디중복체크
	@RequestMapping("/user_idCheck.do")
	@ResponseBody
	public int user_idCheck(UserVO vo) {
		System.out.println("idcheck" + vo);
		return userService.idCheck(vo);
	}


//
//	// 카카오로그인
//	@RequestMapping("/kakao_login.do")
//	public String kakao_login(UserVO vo) {
//		vo.setUser_type("kakao");
//		System.out.println("kakao_login" + vo);
//		if (userService.login(vo) == null) {
//			System.out.println("카카오회원추가");
//			userService.insert(vo);
//			return "user_login.do";
//		} else {
//			System.out.println("카카오로그인");
//			return "user_login.do";
//		}
//
//	}
//	
//	
//	//네이버로그인
//	@RequestMapping("/naver_login.do")
//	public String naver_login(UserVO vo) {
//		vo.setUser_type("naver");
//		System.out.println("네이버로그인"+vo);
//		if (userService.login(vo) == null) {
//			System.out.println("네이버회원추가");
//			userService.insert(vo);
//			return "user_login.do";
//		} else {
//			System.out.println("네이버로그인");
//			return "user_login.do";
//		}
//	}
//	
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
//		@RequestMapping("/user_logout.do")
//		public String user_logout(HttpSession session) {
//			System.out.println("로그아웃");
//				session.invalidate();
//			return "redirect:index.jsp";
//		}
//	//아이디찾기
//	@RequestMapping("/user_find.do")
//	public String user_find(UserVO vo,Model model) {
//		vo.setUser_type("own");
//		System.out.println("아이디찾기"+vo);
//		vo=userService.find(vo);
//		System.out.println("찾은결과: "+vo);
//		if(vo!=null) {
//			model.addAttribute("user", vo.getUser_id());
//			return "user_find.jsp";}else {
//				return "user_find.jsp";
//			}
//			
//	}
//	
//	//비밀번호찾기
//		@RequestMapping("/user_pwfind.do")
//		public String user_pwfind(UserVO vo,Model model) {
//			vo.setUser_type("own");
//			System.out.println("비밀번호찾기"+vo);
//			vo=userService.find(vo);
//			System.out.println("찾은결과: "+vo);
//			if(vo!=null) {
//				model.addAttribute("user", vo.getUser_id());
//				return "user_pwfind.jsp";}else {
//					return "user_pwfind.jsp";
//				}
//				
//		}
//		//비밀번호 변경하기
//		
//		@RequestMapping("/user_change.do")
//		public String user_change(UserVO vo,Model model) {
//			System.out.println("비밀번호변경"+vo);
//			int a=userService.change(vo);
//			System.out.println("변경여부:" +a);
//			return "user_pwfind.jsp";			
//		}


}
