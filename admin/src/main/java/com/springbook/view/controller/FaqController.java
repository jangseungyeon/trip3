package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.faq.FaqService;
import com.springbook.biz.faq.FaqVO;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;

	// 관리자 공지 등록 폼 이동
	@RequestMapping("/manage_faqInsertForm.do")
	public String manage_faqInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_faqInsert.jsp";
	}

	// 관리자 공지 등록
	@RequestMapping("/manage_faqInsert.do")
	public String manage_faqInsert(@ModelAttribute FaqVO vo) throws IllegalStateException, IOException {
		System.out.println("manage_faqInsert");
		MultipartFile uplodFile = vo.getUploadFile();
		// 상대 경로 추가 시 realPath 추가
		// String realPath =
		// request.getSession().getServletContext().getRealPath("/img/");
		String realPath = "c:/swork/trip/src/main/webapp/resources/img/";
		String fileName = uplodFile.getOriginalFilename();
		if (!uplodFile.isEmpty()) {
			vo.setFilename(fileName);
			uplodFile.transferTo(new File(realPath + fileName));
		}
		faqService.manage_faqInsert(vo);
		return "redirect:manage_faqList.do";
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

	// 관리자 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}

	// 관리자 공지 조회
	@RequestMapping("/manage_faqList.do")
	public String manage_faqList(FaqVO vo, String nowPageBtn, Model model) {

		// 총 목록 수
		int totalPageCnt = faqService.totalFaqListCnt(vo);
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
		model.addAttribute("faqList", faqService.manage_faqList(vo));
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_faqList.jsp";
	}

	// 관리자 공지 상세
	@RequestMapping("/manage_faqInfo.do")
	public String manage_faqInfo(FaqVO vo, Model model) {
		model.addAttribute("FaqVO", faqService.manage_faqInfo(vo));
		return "WEB-INF/views/manage_faqInfo.jsp";
	}

}
