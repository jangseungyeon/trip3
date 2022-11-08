package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.faq.FaqService;
import com.springbook.biz.faq.FaqVO;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;

	// 관리자 공지 조회
	@RequestMapping("/manage_faqList.do")
	public String manage_faqList(Model model) {

		// 서비스에서 공지 리스트 조회
		List<FaqVO> list = faqService.manage_faqList();
		model.addAttribute("list", list);
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_faqList.jsp";
	}

	// 관리자 공지 등록 폼 이동
	@RequestMapping("/manage_faqInsertForm.do")
	public String manage_faqInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_faqInsert.jsp";
	}

	// 관리자 공지 등록
	@RequestMapping("/manage_faqInsert.do")
	public String manage_faqInsert(@ModelAttribute FaqVO vo) {
		System.out.println("manage_faqInsert");
		faqService.manage_faqInsert(vo);
		return "redirect:manage_faqList.do";
	}

	// 관리자 공지 상세 
	@RequestMapping("/manage_faqInfo.do")
	public String manage_faqInfo(FaqVO vo, Model model) {
		model.addAttribute("FaqVO", faqService.manage_faqInfo(vo));
		return "WEB-INF/views/manage_faqInfo.jsp";
	}

	// 관리자 공지 수정
	@RequestMapping("/manage_faqUpdate.do")
	public String manage_faqUpdate(@ModelAttribute FaqVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		faqService.manage_faqUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);

		return "manage_faqList.do";
	}

	// 관리자 공지 삭제
	@RequestMapping("/manage_faqDelete.do")
	public String manage_faqDelete(FaqVO vo, HttpSession session) {
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		faqService.manage_faqDelete(vo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		session.invalidate();

		return "manage_faqList.do";
	}

}
