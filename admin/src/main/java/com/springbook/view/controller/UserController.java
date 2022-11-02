package com.springbook.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	// 관리자 회원 가입 폼 이동
	@RequestMapping("/manage_userInsertForm.do")
	public String boardWriteForm(ModelAndView mv) {
		return "WEB-INF/views/manage_userInsert.jsp";
	}

	// 관리자 회원 등록
	@RequestMapping("/manage_userInsert.do")
	public String manage_userInsert(@ModelAttribute UserVO vo) {
		System.out.println("manage_userInsert");
		vo.setUser_type("own");
		userService.manage_userInsert(vo);
		return "redirect:manage_userList.do";
	}

	// 관리자 회원 상세 조회
	@RequestMapping("/manage_userInfo.do")
	public String manage_userInfo(UserVO vo, Model model) {
		model.addAttribute("UserVO", userService.manage_userInfo(vo));
		return "WEB-INF/views/manage_userInfo.jsp";
	}

	//	관리자 회원 정보 수정
	@RequestMapping("/manage_userUpdate.do")
	public String manage_userUpdate(@ModelAttribute UserVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		userService.manage_userUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);
		
		
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//
//		out.println("<script>");
//		out.println("alert('수정이 완료되었습니다..')");
//		out.println("location.href='manage_userInfo.do'");
//		out.println("</script>");
//		out.flush();

		return "WEB-INF/views/manage_userInfo.jsp";
	}

	//	관리자 회원 삭제
	@RequestMapping("/manage_userDelete.do")
	public String manage_userDelete(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		vo.setUser_id((String) session.getAttribute("user_id"));
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		userService.manage_userDelete(vo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<script>");
		out.println("alert('회원 탈퇴가 완료되었습니다.')");
		out.println("location.href='manage_userInfo.do'");
		out.println("</script>");
		out.flush();

		return "manage_userInfo.do";
	}
	
	// 	아이디중복체크
	@RequestMapping("/user_idCheck.do")
	@ResponseBody
	public int user_idCheck(UserVO vo) {
		System.out.println("idcheck" + vo);
		return userService.idCheck(vo);
	}

}
