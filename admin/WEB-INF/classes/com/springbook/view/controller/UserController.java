package com.springbook.view.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// 관리자 회원 가입 폼 이동
	@RequestMapping("/manage_userInsertForm.do")
	public String manage_userInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_userInsert.jsp";
	}

	// 관리자 회원 등록
	@RequestMapping("/manage_userInsert.do")
	public String manage_userInsert(@ModelAttribute UserVO vo) {
		System.out.println("manage_userInsert");
		String pw = BCrypt.hashpw(vo.getUser_password(), BCrypt.gensalt());
		vo.setUser_password(pw);
		vo.setUser_type("own");
		userService.manage_userInsert(vo);
		return "redirect:manage_userList.do";
	}

	// 관리자 회원 정보 수정
	@RequestMapping("/manage_userUpdate.do")
	public String manage_userUpdate(@ModelAttribute UserVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		String pw = BCrypt.hashpw(vo.getUser_password(), BCrypt.gensalt());
		vo.setUser_password(pw);
		userService.manage_userUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);
		return "manage_userList.do";
	}

	// 관리자 회원 삭제
	@RequestMapping("/manage_userDelete.do")
	public String manage_userDelete(UserVO vo, HttpSession session) {
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		userService.manage_userDelete(vo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		session.invalidate();
		return "manage_userList.do";
	}

	// 관리자 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("이름", "NAME");
		return conditionMap;
	}

	// 관리자 회원 조회
	@RequestMapping("/manage_userList.do")
	public String manage_userList(UserVO vo, String nowPageBtn, Model model) {

		// 총 목록 수
		int totalPageCnt = userService.totalUserListCnt(vo);
		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt : " + totalPageCnt + ", nowPage : " + nowPage);
		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("userList", userService.manage_userList(vo));
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_userList.jsp";
	}

	// 관리자 회원 상세 조회
	@RequestMapping("/manage_userInfo.do")
	public String manage_userInfo(UserVO vo, Model model) {
		model.addAttribute("UserVO", userService.manage_userInfo(vo));
		return "WEB-INF/views/manage_userInfo.jsp";
	}

	// 아이디중복체크
	@RequestMapping("/user_idCheck.do")
	@ResponseBody
	public int user_idCheck(UserVO vo) {
		System.out.println("idcheck" + vo);
		return userService.idCheck(vo);
	}

}
