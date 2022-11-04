package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;

	// 관리자 회원 조회
	@RequestMapping("/manage_hostList.do")
	public String manage_hostList(Model model) {

		// 서비스에서 사용자 리스트 조회
		List<HostVO> list = hostService.manage_hostList();
		model.addAttribute("list", list);
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_hostList.jsp";
	}

	// 관리자 회원 가입 폼 이동
	@RequestMapping("/manage_hostInsertForm.do")
	public String boardWriteForm(ModelAndView mv) {
		return "WEB-INF/views/manage_hostInsert.jsp";
	}

	// 관리자 회원 등록
	@RequestMapping("/manage_hostInsert.do")
	public String manage_hostInsert(@ModelAttribute HostVO vo) {
		System.out.println("manage_hostInsert");
		hostService.manage_hostInsert(vo);
		return "redirect:manage_hostList.do";
	}

	// 관리자 회원 상세 조회
	@RequestMapping("/manage_hostInfo.do")
	public String manage_hostInfo(HostVO vo, Model model) {
		model.addAttribute("HostVO", hostService.manage_hostInfo(vo));
		return "WEB-INF/views/manage_hostInfo.jsp";
	}

	// 관리자 회원 정보 수정
	@RequestMapping("/manage_hostUpdate.do")
	public String manage_hostUpdate(@ModelAttribute HostVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		hostService.manage_hostUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);

		return "manage_hostList.do";
	}

	// 관리자 회원 삭제
	@RequestMapping("/manage_hostDelete.do")
	public String manage_hostDelete(HostVO vo, HttpSession session) {
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		hostService.manage_hostDelete(vo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		session.invalidate();

		return "manage_hostList.do";
	}

	// 아이디중복체크
	@RequestMapping("/host_idCheck.do")
	@ResponseBody
	public int host_idCheck(HostVO vo) {
		return hostService.idCheck(vo);
	}

}
