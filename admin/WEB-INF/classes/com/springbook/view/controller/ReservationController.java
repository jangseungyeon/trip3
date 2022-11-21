package com.springbook.view.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;

//@SessionAttributes("reservation")
@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	// 아래 숙소 예약 결제 폼 페이지로 넘어갈때 숙소 기본 정보와 유저 기본 정보를 끌고 오기 위해
	// RoomService형 객체와 UserService형 객체가 필요해서 사용
//
//	@Autowired
//	private RoomService roomService;
//
//	@Autowired
//	private UserService userService;

	// 관리자 예약 수정 (새션에 저장한 호스트 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 예약 목록으로 돌아감)
	@RequestMapping(value = "/manage_reservUpdate.do")
	public String manage_reservUpdate(@ModelAttribute ReservationVO rvo, HttpSession session) {
		System.out.println("예약 수정 시작");
		reservationService.manage_reservUpdate(rvo);
		System.out.println("예약 수정 성공");
		return "manage_reservList.do";
	}

	// 관리자 예약 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 호스트 호스트 아이디와 세션의 호스트 호스트 아이디가 일치하면
	// 삭제, 그후 숙소 목록으로 돌아감)
	@RequestMapping(value = "/manage_reservDelete.do")
	public String manage_reservDelete(ReservationVO rvo, HttpSession session) {
		System.out.println("예약 삭제 시작");
		reservationService.manage_reservDelete(rvo);
		System.out.println("예약 삭제 성공");
		return "manage_reservList.do";
	}

	// 관리자 검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("예약번호", "RESID");
		conditionMap.put("이름", "NAME");
		return conditionMap;
	}

	// 관리자 예약 조회
	@RequestMapping(value = "/manage_reservList.do")
	public String manage_reservList(ReservationVO rvo, String nowPageBtn, Model model) {

		// 총 목록 수
		int totalPageCnt = reservationService.totalReservationListCnt(rvo);
		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt : " + totalPageCnt + ", nowPage : " + nowPage);
		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("reservList", reservationService.manage_reservList(rvo));
		System.out.println("예약 목록 출력 시작");
		return "WEB-INF/views/manage_reservList.jsp";
	}

	// 관리자 예약 상세
	@RequestMapping(value = "/manage_reservInfo.do")
	public String manage_reservInfo(ReservationVO rvo, Model model) {
		System.out.println("예약 상세 보기 시작");
		model.addAttribute("ReservationVO", reservationService.manage_reservInfo(rvo));
		System.out.println("예약 상세 보기 성공");

		return "WEB-INF/views/manage_reservInfo.jsp";
	}

}
