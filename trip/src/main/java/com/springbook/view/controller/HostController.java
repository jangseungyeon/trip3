package com.springbook.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbook.biz.host.HostChartVO;
import com.springbook.biz.host.HostLoginVO;
import com.springbook.biz.host.HostService;
import com.springbook.biz.host.HostVO;

@Controller
public class HostController {
	@Autowired
	private HostService hostService;


	// 호스트 회원가입 페이지로 이동
	@RequestMapping("/move_to_host_insert.do")
	public String moveToHostInsert() {
		return "WEB-INF/views/host_insert.jsp";
	}

	// 호스트 회원가입
	@RequestMapping("/host_insert.do")
	public String hostInsert(HostVO vo) {
		int insert = hostService.insert(vo);
		if (insert == 0) {
			return "move_to_host_login.do";
		} else {
			return "move_to_host_login.do";
		}
	}

	// 아이디중복체크
	@RequestMapping("/host_id_check.do")
	@ResponseBody
	public int hostIdCheck(HostVO vo) {
		System.out.println(vo);
		return hostService.idCheck(vo);
	}
	
	



	// 호스트 로그인
	@RequestMapping("/host_login.do")
	public String hostLogin(HostVO vo, HttpSession session) {
		vo = hostService.login(vo);
		if (vo != null) {
			String host_id = vo.getHost_id();
			String host_bizname = vo.getHost_bizname();
			session.setAttribute("host_id", host_id);
			session.setAttribute("host_bizname", host_bizname);
			return "move_to_host_index.do";
		} else {
			return "move_to_host_login.do";
		}
	}

	// 호스트 아이디 찾기 페이지로 이동
	@RequestMapping("/move_to_host_find_id.do")
	public String moveToUserFind() {
		return "WEB-INF/views/host_find_id.jsp";
	}

	// 호스트 비밀번호 찾기 페이지로 이동
	@RequestMapping("/move_to_host_find_pw.do")
	public String moveToUserPwfind() {
		return "WEB-INF/views/host_find_pw.jsp";
	}

	// 로그아웃
	@RequestMapping("/host_logout.do")
	public String hostLogout(HttpSession session) {
		session.invalidate();
		return "move_to_host_login.do";
	}
	
	// 호스트 로그인 페이지로 이동할 때 데이터 가져오기
	@RequestMapping("/move_to_host_login.do")
	public String moveToHostLogin(HostVO vo2, HostLoginVO vo, Model model, HttpSession session) {
			vo2.setHost_id((String) session.getAttribute("host_id"));
			if (session.getAttribute("host_id") != null) {
				return "move_to_host_index.do";
			} else {
				vo = hostService.hostCount (vo);
				model.addAttribute("hostCount", vo);
				vo = hostService.hostAvgIncome (vo);
				model.addAttribute("hostAvgIncome", vo);
				List<HostLoginVO> listvo = hostService.hostMaxIncome (vo);
				model.addAttribute("hostMaxIncome", listvo);
//				listvo = hostService.bestRoomName(vo);
//				model.addAttribute("bestRoomName", listvo);
//				listvo = hostService.bestRoomImg(vo);
//				model.addAttribute("bestRoomImg", listvo);
				listvo = hostService.bestRoomIncome(vo);
				model.addAttribute("bestRoomIncome", listvo);
				vo = hostService.reservationCountLast10days(vo);
				model.addAttribute("reservationCountLast10days", vo);
				vo = hostService.reservationCount(vo);
				model.addAttribute("reservationCount", vo);
				vo = hostService.roomCount(vo);
				model.addAttribute("roomCount", vo);

			return "WEB-INF/views/host_login.jsp";
			}
		
	}
	
	// 호스트 헤더 > 인덱스 홈으로 이동, 이동할 때 차트 데이터(최근 10일 매출), 인덱스에 뿌려줄 데이터 가져오기
	@RequestMapping("/move_to_host_index.do")
	public String moveToHostIndex(HostChartVO vo, Model model, HttpSession session) {
		vo.setHost_id((String) session.getAttribute("host_id"));
		List<HostChartVO> listvo = hostService.hostIndexChartSelect(vo);
		List<HostChartVO> listvo2 = hostService.hostIndexChart2Select(vo);
		List<HostChartVO> listvo3 = hostService.hostIndexRoomSelect(vo);
		model.addAttribute("hostIndexChartSelect", listvo);
		model.addAttribute("hostIndexChart2Select", listvo2);
		model.addAttribute("hostIndexRoomSelect", listvo3);
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
		return "WEB-INF/views/host_index.jsp";
	}
	
//	// 호스트 헤더 > 리뷰 모아보기 페이지로 이동
//	@RequestMapping("/move_to_host_review.do")
//	public String moveToHostReview() {
//		return "WEB-INF/views/host_review_list.jsp";
//	}
			
	
	// 호스트 헤더 > 호스트 정보 수정 페이지로 이동
	@RequestMapping("/move_to_host_update.do")
	public String moveToHostUpdate() {
		return "WEB-INF/views/host_update.jsp";
	}
	
	// 호스트 헤더 > 호스트 정보 수정 페이지 > 수정 전 비밀번호 재 확인 +정보 가져오기
	@RequestMapping("/host_pw_check.do")
	public String hostPwCheck(HostVO vo, HttpSession session, Model model) {
		vo.setHost_id((String) session.getAttribute("host_id"));
		
		vo.setHost_pw(vo.getHost_pw_check());
		String host_pw_check2 = vo.getHost_pw_check();
		vo = hostService.login(vo);
		
		if (vo == null) {
			return "move_to_host_update.do?fail=1";
		} else if (vo != null) {
				String host_pw2 = vo.getHost_pw();
				if (host_pw_check2.equals(host_pw2)) {
					model.addAttribute("host", vo);
				}
				return "host_info_select.do";
		}else {
			return "move_to_host_update.do?fail=1";
		}
	}
	
	//한 줄 데이터 가져오기
	@RequestMapping("/host_info_select.do")
	public String hostInfoSelect(HostVO vo, HttpSession session, Model model) {
		vo.setHost_id((String) session.getAttribute("host_id"));
		vo = hostService.hostInfoSelect(vo);
		if (vo != null ) {
			model.addAttribute("host", hostService.hostInfoSelect(vo));
			return "WEB-INF/views/host_update_detail.jsp";
		} else {
			return "WEB-INF/views/host_update_detail.jsp?fail=1";
		}
	}
	
	
	// 호스트 헤더 > 호스트 정보 수정 페이지 > 비밀번호 재 확인 > 수정
	@RequestMapping("/host_update.do")
	public String hostUpdate(HostVO vo, HttpSession session, Model model) {
		hostService.update(vo);
		return "host_info_select.do?success=1";

	}
	
	// 호스트 비밀번호 변경
	@RequestMapping("/host_pw_update.do")
	public String hostPwUpdate(HostVO vo, HttpSession session, Model model) {
		hostService.updatePw(vo);
		String host_id=(String)session.getAttribute("host_id");
		HostVO vo1 = new HostVO();
		vo1.setHost_id(host_id);
		vo=	hostService.hostInfoSelect(vo1);
		if(vo != null) {
			model.addAttribute("host", vo);
			return "WEB-INF/views/host_update_detail.jsp?success=1";
		} else {
			return "WEB-INF/views/host_update_detail.jsp?fail=1";
		}
	}
	
	// 호스트 회원 탈퇴 (host_staus를 'leave'로 변경, 로그인 시 leave True일 때 로그인 불가)
	@RequestMapping("/host_leave.do")
	public String hostLeave(HostVO vo, HttpSession session) {
		hostService.leave(vo);
		session.invalidate();
		return "WEB-INF/views/host_leave_success.jsp";
	}
	
	// 호스트 아이디 찾기 폼
	@RequestMapping("/host_find_id_form.do")
	public String host_find_id(HostVO vo, Model model) {
		vo = hostService.hostFind(vo);
		System.out.println("찾은결과: " + vo);
		if (vo != null) {
			model.addAttribute("host", vo.getHost_id());
			return "WEB-INF/views/host_find_id.jsp";
		} else {
			return "WEB-INF/views/host_find_id.jsp";
		}

	}
	
	// 호스트 비밀번호 찾기 폼
	@RequestMapping("/host_find_pw_form.do")
	public String host_find_pw(HostVO vo, Model model) {
		vo = hostService.hostFind(vo);
		if (vo != null) {
			model.addAttribute("host", vo.getHost_id());
			return "WEB-INF/views/host_find_pw.jsp";
		} else {
			return "WEB-INF/views/host_find_pw.jsp";
		}
	}
	
	// 호스트 비밀번호 변경하기
	@RequestMapping("/host_change.do")
	public String host_change(HostVO vo, Model model) {
		int a = hostService.change(vo);
		return "WEB-INF/views/host_find_pw.jsp?complete=1";
	}


}
