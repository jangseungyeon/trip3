package com.springbook.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.host.HostChartVO;
import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;

	// 관리자 호스트 가입 폼 이동
	@RequestMapping("/manage_hostInsertForm.do")
	public String manage_hostInsertForm(ModelAndView mv) {
		return "WEB-INF/views/manage_hostInsert.jsp";
	}

	// 관리자 호스트 등록
	@RequestMapping("/manage_hostInsert.do")
	public String manage_hostInsert(@ModelAttribute HostVO vo) {
		System.out.println("manage_hostInsert");
		hostService.manage_hostInsert(vo);
		return "redirect:manage_hostList.do";
	}

	// 관리자 호스트 정보 수정
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

	// 관리자 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("숙소명", "BIZNAME");
		return conditionMap;
	}

	// 관리자 호스트 조회
	@RequestMapping("/manage_hostList.do")
	public String manage_hostList(HostVO vo, String nowPageBtn, Model model) {

		// 총 목록 수
		int totalPageCnt = hostService.totalHostListCnt(vo);
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
		model.addAttribute("hostList", hostService.manage_hostList(vo));
		System.out.println("리스트 출력");
		return "WEB-INF/views/manage_hostList.jsp";
	}

	// 관리자 호스트 상세 조회
	@RequestMapping("/manage_hostInfo.do")
	public String manage_hostInfo(HostVO vo, Model model) {
		model.addAttribute("HostVO", hostService.manage_hostInfo(vo));
		return "WEB-INF/views/manage_hostInfo.jsp";
	}

	// 아이디중복체크
	@RequestMapping("/host_idCheck.do")
	@ResponseBody
	public int host_idCheck(HostVO vo) {
		return hostService.idCheck(vo);
	}

	// 호스트 헤더 > 인덱스 홈으로 이동, 이동할 때 차트 데이터(최근 10일 매출), 인덱스에 뿌려줄 데이터 가져오기
	@RequestMapping("/manage_indexChart.do")
	public String moveToHostIndex(HostChartVO vo, Model model, HttpSession session) {
		vo.setHost_id((String) session.getAttribute("host_id"));
		List<HostChartVO> listvo = hostService.hostIndexChartSelect(vo);
		List<HostChartVO> listvo2 = hostService.hostIndexChart2Select(vo);
		List<HostChartVO> listvo3 = hostService.hostIndexRoomSelect(vo);
		List<HostChartVO> listvo4 = hostService.hostIndexChart3Select(vo);
		model.addAttribute("hostIndexChartSelect", listvo);
		model.addAttribute("hostIndexChart2Select", listvo2);
		model.addAttribute("hostIndexRoomSelect", listvo3);
		model.addAttribute("hostIndexChart3Select", listvo4);
		vo = hostService.indexRoomCount(vo);
		model.addAttribute("indexRoomCount", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexReviewCount(vo);
		model.addAttribute("indexReviewCount", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexLikeCount(vo);
		model.addAttribute("indexLikeCount", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexCheckout(vo);
		model.addAttribute("indexCheckout", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexTodayCheckin(vo);
		model.addAttribute("indexTodayCheckin", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexStaying(vo);
		model.addAttribute("indexStaying", vo);
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.indexCheckinAble(vo);
		model.addAttribute("indexCheckinAble", vo);
		return "WEB-INF/views/manage_main.jsp";
	}

}
