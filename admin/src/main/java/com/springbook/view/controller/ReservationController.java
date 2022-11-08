package com.springbook.view.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

//@SessionAttributes("reservation")
@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	// 아래 숙소 예약 결제 폼 페이지로 넘어갈때 숙소 기본 정보와 유저 기본 정보를 끌고 오기 위해
	// RoomService형 객체와 UserService형 객체가 필요해서 사용

	@Autowired
	private RoomService roomService;

	@Autowired
	private UserService userService;

	// 관리자 예약 등록 폼 이동
//	@RequestMapping("/manage_reservInsertForm.do")
//	public String manage_reservInsertForm(ModelAndView mv) {
//		return "WEB-INF/views/manage_reservInsert.jsp";
//	}
	
	// 관리자 예약 등록
//	@RequestMapping("/manage_reservInsert.do")
//	public String manage_reservInsert(@ModelAttribute ReservationVO rvo) {
//		System.out.println("manage_reservInsert");
//		reservationService.manage_reservInsert(rvo);
//		return "redirect:manage_reservList.do";
//	}

	// 관리자 예약 조회
	@RequestMapping(value = "/manage_reservList.do")
	public String manage_reservList(ReservationVO rvo, Model model) {

		System.out.println("예약 목록 검색 시작");
		List<ReservationVO> list = reservationService.manage_reservList(rvo);
		model.addAttribute("list", list);
		System.out.println("예약 목록 출력 시작");

		return "WEB-INF/views/manage_reservList.jsp";
	}

	// 관리자 예약 상세 보기
	@RequestMapping(value = "/manage_reservInfo.do")
	public String manage_reservInfo(ReservationVO rvo, Model model) {
		System.out.println("예약 상세 보기 시작");
		model.addAttribute("ReservationVO", reservationService.manage_reservInfo(rvo));
		System.out.println("예약 상세 보기 성공");

		return "WEB-INF/views/manage_reservInfo.jsp";
	}

	// 관리자 예약 수정 (새션에 저장한 업주 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 예약 목록으로 돌아감)
	@RequestMapping(value = "/manage_reservUpdate.do")
	public String manage_reservUpdate(@ModelAttribute ReservationVO rvo, HttpSession session) {
		System.out.println("예약 수정 시작");
		reservationService.manage_reservUpdate(rvo);
		System.out.println("예약 수정 성공");

		return "manage_reservList.do";
	}

	// 관리자 예약 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 업주 호스트 아이디와 세션의 업주 호스트 아이디가 일치하면
	// 삭제, 그후 숙소 목록으로 돌아감)
	@RequestMapping(value = "/manage_reservDelete.do")
	public String manage_reservDelete(ReservationVO rvo, HttpSession session) {
		System.out.println("예약 삭제 시작");
		reservationService.manage_reservDelete(rvo);
		System.out.println("예약 삭제 성공");
		
		return "manage_reservList.do";
	}
	
//	내 예약 확인
	@RequestMapping("/check.do")
	public String user_info(ReservationVO rvo, HttpSession session, Model model) {
		System.out.println("rvo: " + rvo);
		rvo.setUser_id((String) session.getAttribute("user_id"));
		rvo = reservationService.check(rvo);
		System.out.println("결제정보확인: " + rvo);
		if (rvo != null) {
			String user_id = rvo.getUser_id();
			session.setAttribute("user_id", user_id);
			model.addAttribute("res_id", rvo.getRes_id());
			model.addAttribute("host_id", rvo.getHost_id());
			model.addAttribute("room_id", rvo.getRoom_id());
			model.addAttribute("room_name", rvo.getRoom_name());
			model.addAttribute("room_img", rvo.getRoom_img());
			model.addAttribute("pay_date", rvo.getPay_date());
			model.addAttribute("pay_amount", rvo.getPay_amount());
			model.addAttribute("res_num", rvo.getRes_num());
			model.addAttribute("res_count", rvo.getRes_count());
			model.addAttribute("res_status", rvo.getRes_status());
			model.addAttribute("res_checkin", rvo.getRes_checkin());
			model.addAttribute("res_checkout", rvo.getRes_checkout());
			return "WEB-INF/views/myReservationList.jsp";
		} else {
			return "index.jsp";
		}
	}

	// 숙소 예약 결제 페이지 이동 (하면서 해당 숙소의 기본 정보 및 유저 정보 끌고 옴)
	@RequestMapping(value = "/moveInsertReservation.do")
	public String moveInsertReservation(RoomVO rovo, ReservationVO revo, Model model, HttpSession session) {

		model.addAttribute("room", roomService.manage_roomList(rovo));

		model.addAttribute("reservation", revo);

		UserVO uvo = null;

		uvo = new UserVO();

		uvo.setUser_id((String) session.getAttribute("user_id"));

		model.addAttribute("userInfo", userService.manage_userInfo(uvo));

		return "WEB-INF/views/user_insert_reservation.jsp";
	}

	// 숙소 예약 등록 (숙소 상세 페이지에서 숙소 예약 => 최대한 넘겨줄수 있는 값들 다 넘겨줘야 함)
	@RequestMapping(value = "/insertReservation.do")
	public String insertReservation(ReservationVO rvo) {
		System.out.println("숙소 예약 등록 시작");
		reservationService.insertReservation(rvo);
		System.out.println("숙소 예약 등록 성공");
		return "getReservationList.do";
	}

	// 숙소 예약 수정, 변경 (GET 요청, 날짜에 따라 예약 변경이 불가능하게 하거나 시간이 지나면 자동적으로 사용 완료라고 변경하게 하거나
	// 할때 이 수정 메소드를 타야함)
	@GetMapping(value = "/updateReservation.do")
	public String updateReservation(@RequestParam(value = "user_id") String user_id, HttpServletResponse response)
			throws Exception {
		System.out.println("숙소 예약 수정 GET 시작");
		if (user_id != null) {

			ReservationVO rvo = null;
			rvo = new ReservationVO();

			rvo.setUser_id(user_id); // 쿼리스트링으로 받아온 user_id를 rvo 객체 안에 세팅
			List<ReservationVO> rvo_t = reservationService.getReservationList(rvo);
			// rvo를 목록 불러오는 메소드에 넣어 일단
			// user_id에 해당하는 목록 불러옴

			// Date 자료형 변수 미리 세팅
			Date res_cancel_ci = null;
			Date res_cancel_co = null;
			Date res_cancel_cim3 = null;
			Date today = null;

			// 오늘 날짜 끌어옴
			today = new Date();

			// 날짜 계산을 위해 Calendar 클래스 객체 생성
			Calendar cal = Calendar.getInstance();

			// Date 자료형 객체를 받기 위해 포맷 형식 객체 만듬, yyyy-mm-dd로 형식 맞춤
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");

			// 유저 아이디 기준으로 구해온 예약 목록 현황을 하나 하나 돌면서 체크
			for (ReservationVO rvo_t1 : rvo_t) {
				// 체크인 날짜 문자열에서 Date 자료형으로 변환하면서
				res_cancel_ci = formatter.parse(rvo_t1.getRes_checkin());
				res_cancel_co = formatter.parse(rvo_t1.getRes_checkout());

//				//체크인 날짜를 Calendar 객체에 주입
				cal.setTime(res_cancel_ci);

				// 체크인 날짜에서 3일 전 (수정/취소 변경 가능 기한) 계산
				cal.add(Calendar.DATE, -3);

				// 계산한 날짜를 Date 자료형으로 다시 받음
				res_cancel_cim3 = cal.getTime();

				// 아래에서 today 오늘날짜와 체크인 날짜 3일전 res_cancel_cim3과 비교해
				// 시간이 지나지 않았다면 예약 변경이 가능하게끔 하고
				// 시간이 지났다면 예약 변경이 불가능하게끔 한다

				// 또, 오늘 날짜와 체크아웃 날짜 res_cancel_co와 비교해 시간이 지났으면 사용 완료 리뷰 작성 가능하게끔 한다

				// 예약 변경 가능 상태 => '1' == 예약 변경 가능, '2' == 예약 변경 불가,
				// '3' == 예약 취소 완료, '4' == 사용 완료 (리뷰 작성 가능)

				if (today.compareTo(res_cancel_cim3) <= 0) {
					System.out.println("숙소 예약 수정 GET 성공");
					return "getReservationList.do";
				} else if (today.compareTo(res_cancel_cim3) >= 0) {
					rvo.setRes_status("2");
					reservationService.updateReservation(rvo);
				} else if (today.compareTo(res_cancel_co) > 0) {
					rvo.setRes_status("4");
					reservationService.updateReservation(rvo);
				}
			}
		}
		System.out.println("숙소 예약 수정 GET 성공");
		return "getReservationList.do";
	}

	// 숙소 예약 수정, 변경(POST 요청, 미리 정해둔 예약 기간을 똑같이 가져가면서 날짜를 바꿀때 이 수정을 씀)
	@PostMapping(value = "/updateReservation.do")
	public String updateReservation(@ModelAttribute("reservation") ReservationVO rvo, HttpSession session) {
//		if(rvo.getUser_id().equals(session.getAttribute("user_id")) ) {
		System.out.println("숙소 예약 수정 POST 시작");
		reservationService.updateReservation(rvo);
		System.out.println("숙소 예약 수정 POST 성공");
		return "redirect:getReservationList.do";
//		} else {
//			return "getReservationList.do?error=y";
//		}
	}

	// 숙소 예약 삭제 (일정 크게 변경해야하기 때문에(기존 일정보다 며칠 추가하거나 삭제하거나 등등) 그래서 아예 삭제후 재등록)
	@RequestMapping(value = "/deleteReservation.do")
	public String deleteReservation(ReservationVO rvo, HttpSession session) {
//		if(rvo.getUser_id().equals(session.getAttribute("user_id")) ){
		System.out.println("숙소 예약 삭제 시작");
		reservationService.deleteReservation(rvo);
		System.out.println("숙소 예약 삭제 성공");
		return "redirect:getReservationList.do";
//		} else {
//		return "getReservationList.do?error=y";
//		}	
	}

	// 숙소 예약 목록 조회
	@RequestMapping(value = "/getReservationList.do")
	public String getReservationList(ReservationVO rvo, HttpSession session, String nowPageBtn, Model model) {
		rvo.setUser_id((String) session.getAttribute("user_id"));

		System.out.println("숙소 예약 목록 조회 시작");

		System.out.println("글 목록 검색 처리");

		// 총 목록 수
		int totalPageCnt = reservationService.totalReservationListCnt(rvo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("reservationList", reservationService.getReservationList(rvo));
		return "WEB-INF/views/myReservationList.jsp";

	}
}
