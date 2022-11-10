package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.faq.FaqService;
import com.springbook.biz.faq.FaqVO;

@Controller
@SessionAttributes("faq")
public class FaqController {

	@Autowired
	private FaqService faqService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}

	// 상대경로 추가시
//	public String insertFaq(MultipartHttpServletRequest request, FaqVO vo) throws IllegalStateException, IOException {
//	@PostMapping(value = "/insertFaq.do")
//	public String insertFaq(FaqVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
//		// 상대 경로 추가 시 realPath 추가
//		// String realPath =
//		// request.getSession().getServletContext().getRealPath("/img/");
//		String realPath = "c:/swork/trip/src/main/webapp/resources/img/";
//		String fileName = uplodFile.getOriginalFilename();
//		if (!uplodFile.isEmpty()) {
//			vo.setFaq_filename(fileName);
//			uplodFile.transferTo(new File(realPath + fileName));
//		}
//		faqService.insertFaq(vo);
//		return "getFaqList.do";
//	}

	// 글 수정
//	@RequestMapping("/updateFaq.do")
//	public String updateFaq(@ModelAttribute("faq") FaqVO vo, HttpSession session) {
//		if (vo.getWriter().equals(session.getAttribute("userName").toString())) {
//			faqService.updateFaq(vo);
//			return "getFaqList.do";
//		} else {
//			return "getFaq.do?error=1";
//		}
//
//	}

	// 글 삭제
//	@RequestMapping("/deleteFaq.do")
//	public String deleteFaq(FaqVO vo, HttpSession session) {
//		String realPath = "c:/swork/trip/src/main/webapp/resources/img/";
//		vo = faqService.getFaq(vo);
//		if (vo.getWriter().equals(session.getAttribute("userName").toString())) {
//			if (vo.getFilename() != null) {
//				System.out.println("파일삭제: " + realPath + vo.getFilename());
//				File f = new File(realPath + vo.getFilename());
//				f.delete();
//			}
//			faqService.deleteFaq(vo);
//			return "getFaqList.do";
//		} else {
//			return "getFaq.do?error=1";
//		}
//	}

	// 글 상세 조회
	@RequestMapping("/getFaq.do")
	public String getFaq(FaqVO vo, Model model) {
		model.addAttribute("faq", faqService.getFaq(vo));
		return "WEB-INF/views/faq_detail.jsp";
	}

	// 글 목록
	@RequestMapping("/getFaqList.do")
	public String getFaqListPost(FaqVO vo, String nowPageBtn, Model model) {
		System.out.println("글 목록 검색 처리");

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
		model.addAttribute("faqList", faqService.getFaqList(vo));
		return "WEB-INF/views/faq_list.jsp";
	}

	// 파일다운로드
	@GetMapping(value = "/download.do")
	public void fileDownLoad(@RequestParam(value = "filename", required = false) String filename,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("파일 다운로드");
		if (!(filename == null || filename.equals(""))) {
			// 요청파일 정보 불러오기
			String realPath = "c:/swork/trip/src/main/webapp/resources/img/";
			// String realPath =
			// request.getSession().getServletContext().getRealPath("/img/");
			File file = new File(realPath + filename);

			// 한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
			String fn = new String(file.getName().getBytes(), "iso_8859_1");

			// ContentType설정
			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
			response.setContentLength(bytes.length);
			// response.setContentType("image/jpeg");

			response.getOutputStream().write(bytes);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}
}
