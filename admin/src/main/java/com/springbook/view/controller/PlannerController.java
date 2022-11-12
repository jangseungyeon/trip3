package com.springbook.view.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.planner.PlaceVO;
import com.springbook.biz.planner.PlannerService;
import com.springbook.biz.planner.PlannerVO;

@Controller
public class PlannerController {

	@Autowired
	private PlannerService plannerService;

//	@Autowired
//	private com.springbook.biz.planner.CommentService CommentService;

	// 관리자 플레너 가입 폼 이동
	@RequestMapping("/manage_plannerInsertForm.do")
	public String manage_plannerInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_plannerInsert.jsp";
	}

	// 관리자 플레너 등록
	@RequestMapping("/manage_plannerInsert.do")
	public String manage_plannerInsert(@ModelAttribute PlannerVO vo) {
		System.out.println("manage_plannerInsert");
		plannerService.manage_plannerInsert(vo);
		return "redirect:manage_plannerList.do";
	}

	// 관리자 플레너 수정
	@RequestMapping("/manage_plannerUpdate.do")
	public String manage_plannerUpdate(@ModelAttribute PlannerVO vo, HttpSession session) {
		System.out.println("컨트롤러 입장");
		plannerService.manage_plannerUpdate(vo);
		System.out.println("컨트롤러 vo : " + vo);
		return "manage_plannerList.do";
	}

	// 관리자 플레너 삭제
	@RequestMapping("/manage_plannerDelete.do")
	public String manage_plannerDelete(PlannerVO vo, PlaceVO pvo) {
		System.out.println("회원탈퇴 컨트롤러 입장" + vo);
		plannerService.manage_plannerDelete(vo);
		plannerService.manage_placeDelete(pvo);
		System.out.println("쿼리문 끝나고 컨트롤러" + vo);
		return "manage_plannerList.do";
	}

	// 관리자 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("아이디", "USERID");
		return conditionMap;
	}

	// 관리자 플레너 조회
	@RequestMapping("/manage_plannerList.do")
	public String manage_plannerList(PlannerVO vo, String nowPageBtn, Model model) {

		// 총 목록 수
		int totalPageCnt = plannerService.totalPlannerListCnt(vo);
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
		model.addAttribute("plannerList", plannerService.manage_plannerList(vo));
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_plannerList.jsp";
	}

	// 관리자 플레너 상세
	@RequestMapping("/manage_plannerInfo.do")
	public String manage_plannerInfo(PlannerVO vo, Model model) {
		model.addAttribute("PlannerVO", plannerService.manage_plannerInfo(vo));
		return "WEB-INF/views/manage_plannerInfo.jsp";
	}

}
