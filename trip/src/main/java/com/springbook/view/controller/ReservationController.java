package com.springbook.view.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;
import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;

import java.util.Calendar;

@Controller
@SessionAttributes("reservation")
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	//(회원) 	내 예약 확인
	@RequestMapping("/check.do")
	public String user_info(ReservationVO rvo, HttpSession session, Model model) {
		System.out.println("rvo: "+rvo);
		rvo.setUser_id((String)session.getAttribute("user_id"));
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
			return "WEB-INF/views/my_ReservationList.jsp";
		} else {
			return "index.jsp";
		}
	}
	
	//(회원) 숙소 예약 수정, 변경 (GET 요청, 날짜에 따라 예약 변경이 불가능하게 하거나 시간이 지나면 자동적으로 사용 완료 및 리뷰 쓰기 가능 상태로 변경하게 할때 이 수정 메소드를 타야함)
	@GetMapping(value="/updateReservation.do")
	public String updateReservation(HttpSession session) throws Exception {
		
		String user_id = (String) session.getAttribute("user_id");
		//세션에서 user_id를 긁어옴
		
		if(user_id != null) {
			
		System.out.println("숙소 예약 수정 GET 시작");
		
		ReservationVO rvo = null;
		
		rvo = new ReservationVO();
		
		rvo.setUser_id(user_id);
		
		List<ReservationVO> rvo_list = reservationService.getReservationList(rvo);
		//rvo를 유저 아이디에 해당하는 예약 목록 전체를 불러오는 메소드에 넣어 일단 user_id에 해당하는 예약 목록 불러옴
		
		
		//Date 자료형 변수 미리 세팅
		Date res_cancel_ci = null;
		Date res_cancel_co = null;
		Date today = null;
		
		
		//오늘 날짜 끌어옴
		today = new Date();

		
		//날짜 계산을 위해 Calendar 클래스 객체 생성
		Calendar cal = Calendar.getInstance();

		
		//DB에 있는 체크인 및 체크아웃 날짜를 Date 자료형 객체로 받기 위해 포맷 형식 객체 만듬, yyyy-mm-dd로 형식 맞춤
		//Date 자료형으로 해야 현재 시간과 계산 가능
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		
		//유저 아이디 기준으로 구해온 예약 목록 현황을 하나 하나 돌면서 체크
		for(ReservationVO rvo_f : rvo_list) {
			
			
			//일단 변경 기준이 되는 현재 날짜-체크인 날짜 3일전 기준 변수와 현재 날짜-체크아웃 날짜 기준 변수를 디폴트값으로 초기화 시켜줌
			rvo_f.setRes_ci3_ok("true");
			rvo_f.setRes_co_ok("false");
			
			
			//예약 데이터의 체크인 날짜 및 체크아웃 날짜 출력 (yyyy-MM-dd)
			System.out.println(rvo_f.getRes_checkin());
			System.out.println(rvo_f.getRes_checkout());
			
			
			//DB에 저장된 체크인과 체크아웃 날짜를 Date형으로 변환
			res_cancel_ci = formatter.parse(rvo_f.getRes_checkin());
			res_cancel_co = formatter.parse(rvo_f.getRes_checkout());
			
			
			//Date형으로 변환된 체크인 체크아웃 날짜 출력 (요일 월 일 시 분 초)
			System.out.println(res_cancel_ci);
			System.out.println(res_cancel_co);
			
			
			//calendar 객체에 오늘 날짜 세팅
			cal.setTime(today);
			
			
			//getTimeInMillis 메소드를 통해 long 자료형으로 오늘 날짜 밀리세컨드 형식으로 구함
			long today_long = cal.getTimeInMillis();
			
			
			//다시 calendar 객체에 체크인 날짜 세팅후 
			//getTimeInMillis 메소드를 통해 long 자료형으로 체크인 날짜 밀리세컨드 형식으로 구함
			cal.setTime(res_cancel_ci);
			long res_cancel_ci_long = cal.getTimeInMillis();
			
			
			//또다시 calendar 객체에 체크아웃 날짜 세팅후 
			//getTimeInMillis 메소드를 통해 long 자료형으로 체크아웃 날짜 밀리세컨드 형식으로 구함
			cal.setTime(res_cancel_co);
			long res_cancel_co_long = cal.getTimeInMillis();
			
			
			//마이페이지 - 예약 현황을 누른 오늘 시간과 체크인 날짜 사이 간격을 구함 
			//밀리세컨드이기에 1000 (1초) * 60초 (1분) * 60분(1시간) * 24시간 (1일)로 나눠야 결과가 일자로 나옴
			//오늘 날짜 기준 - 체크인 날짜 빼기
			long dayDiff_toci = (today_long - res_cancel_ci_long) / (1000*60*60*24);
			
			
			//마찬가지로 오늘 시간과 체크아웃 날짜 사이 간격을 구함
			//오늘 날짜 기준 - 체크아웃 날짜 빼기
			long dayDiff_toco = (today_long - res_cancel_co_long) / (1000*60*60*24);
			
			
			//그 두 간격을 출력
			System.out.println(dayDiff_toci);
			System.out.println(dayDiff_toco);
			
			
			//아래에서 today 오늘날짜와 체크인 날짜 res_cancel_ci과 비교해
			//시간이 지나지 않았다면 예약 변경이 가능하게끔 하고 (dayDiff_toci <= -3)
			//시간이 지났다면 예약 변경이 불가능하게끔 한다 (dayDiff_toci > -3)
			
			
			//또, 오늘 날짜와 체크아웃 날짜 res_cancel_co와 비교해 시간이 지났으면 사용 완료 리뷰 작성 가능하게끔 한다
			//(dayDiff_toco >= 0)
			

			//예약 상태 변경 조건이 되는것들을 출력
			//첫번째 + 두번째 모두가 true가 나와야 예약 변경 불가능 상태로 변경되고
			//세번째가 true가 나와야 리뷰 쓰기 가능 상태로 변경된다
			System.out.println(dayDiff_toci > -3);
			System.out.println(dayDiff_toco < 0);
			System.out.println(dayDiff_toco >= 0);
			
			if (((dayDiff_toci > -3) == true) && ((dayDiff_toco < 0) == true)){
				
				
				//예약 변경 가능 상태 => '1' == 예약 변경 가능, '2' == 예약 변경 불가, 
				//'3' == 예약 취소 완료, '4' == 사용 완료 (리뷰 작성 가능)
				
				
				rvo_f.setRes_status("2");
				rvo_f.setRes_ci3_ok("false");
				reservationService.updateReservationGet(rvo_f);
				
			} 
			
			if ((dayDiff_toco >= 0) == true) {
				rvo_f.setRes_status("4");
				rvo_f.setRes_ci3_ok("false");
				rvo_f.setRes_co_ok("true");
				reservationService.updateReservationGet(rvo_f);
				
			}
			
		}
		//위 조건들에 걸리지 않은 것들은 그냥 예약 목록 불러오는 컨트롤러를 타고
		//걸리는것들은 모두 변경된 상태 값을 가진 상태로 변경 기준점 변수들이 그에 맞춰
		//잡힌뒤 예약 목록 컨트롤러를 탄다.
		return "getReservationList.do";
		}
		else {
			//혹여나 user_id가 없으면 (로그인 x) 메인 페이지로 이동 
		return "main.do?error=y";
		}
	}
	
	//(회원) 숙소 예약 취소 (결제 환불 되자마자 이 컨트롤러를 탐)
	@PostMapping(value="/cancelReservation.do")
	public String cancelReservation(ReservationVO rvo, HttpSession session) {
		
		if(rvo.getUser_id().equals(session.getAttribute("user_id")) ) {
			
			System.out.println("숙소 예약 결제 취소 시작");
			
			rvo.setRes_status("3");
			
			reservationService.updateReservationCancel(rvo);
			
			System.out.println("숙소 예약 결제 취소 성공");
			
			return "redirect:getReservationList.do";
		} else {
			
			return "getReservationList.do?error=y";
			
		}
	}

	
	
	//(회원) 숙소 예약 수정, 변경(POST 요청, 미리 정해둔 예약 기간을 똑같이 가져가면서 날짜를 바꿀때 이 수정을 씀)
	
	//주의할것 => 반드시 이 컨트롤러 타기 이전에 예약 상세보기 같은 컨트롤러 메소드를 탐과 동시에
	
	//model.addAttribute("해당 예약 1건 정보를 지칭하는 키값 sessionAttributes에 지정된 키값과 동일해야함",
	
	//"해당 예약 1건 정보를 담은 밸류값")을
	
	//꼭 return 구문 직전에 넣어야 함 그래야 sessionAttributes 에러가 안남
	
	//(해당 에러는 sessionAttributes에 지정된 키값에 해당하는 정보가 없어서 나는것임)
	
	//(그래서 꼭 위 조건으로 model.addAttribute를 실행해야 세션에서 sessionAttributes로 해당하는 정보를 가지고 있음)
	
	
	@PostMapping(value="/updateReservation.do")
	public String updateReservation(@ModelAttribute("reservation") ReservationVO rvo, HttpSession session) {
		
		if(rvo.getUser_id().equals(session.getAttribute("user_id")) ) {
			
			System.out.println("숙소 예약 수정 POST 시작");
			
			reservationService.updateReservationPost(rvo);
			
			System.out.println("숙소 예약 수정 POST 성공");
			
			return "redirect:getReservationList.do";
		
		} else {
			
			return "getReservationList.do?error=y";
			
		}
	}
		
	//(회원) 숙소 예약 삭제 (일정 크게 변경해야하기 때문에(기존 일정보다 며칠 추가하거나 삭제하거나 등등) 그래서 아예 삭제후 재등록)
	//또한 관리자의 경우 문제가 있을시 비상상황에 예약 삭제가 가능해야함 결국 관리자도 씀
	@RequestMapping(value="/deleteReservation.do")
	public String deleteReservation(ReservationVO rvo) {
		
		System.out.println("숙소 예약 삭제 시작");
		
		reservationService.deleteReservation(rvo);
		
		System.out.println("숙소 예약 삭제 성공");
		
		return "redirect:getReservationList.do";
	}
	
	//(회원) 주어진 아이디에만 해당하는 숙소 예약 목록 조회
	@RequestMapping(value="/getReservationList.do")
	public String getReservationList(ReservationVO rvo, HttpSession session, String nowPageBtn, Model model){
		
		rvo.setUser_id((String)session.getAttribute("user_id"));

		System.out.println("해당 아이디 숙소 예약 목록 조회 시작");
			
		System.out.println("글 목록 검색 처리");
			
		//총 목록 수 
		int totalPageCnt = reservationService.totalReservationListCnt(rvo);
			
		//현재 페이지 설정 
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
			
		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;
			
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
			
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());
			
		model.addAttribute("paging", pvo);
		model.addAttribute("reservationList", reservationService.getReservationList(rvo));
		return "WEB-INF/views/my_ReservationList.jsp";
			
	}
		
	// (호스트) 호스트 헤더 > 호스트용 예약현황 조회 페이지로 이동 (현성규)
	@RequestMapping("/move_to_host_reservation.do")
	public String getReservationListForHost(ReservationVO rvo, String nowPageBtn, Model model, HttpSession session){
		
		rvo.setHost_id((String) session.getAttribute("host_id"));
			
		//총 목록 수 
			
		int totalPageCnt = reservationService.totalReservationListCntForHost(rvo);
			
		//현재 페이지 설정 
			
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
			
		//한페이지당 보여줄 목록 수
			
		int onePageCnt = 10;
			
		//한 번에 보여질 버튼 수
			
		int oneBtnCnt = 5;
			
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
			
		rvo.setOffset(pvo.getOffset());
			
		model.addAttribute("paging", pvo);
			
		model.addAttribute("reservationListForHost", reservationService.getReservationListForHost(rvo));
			
		return "WEB-INF/views/host_reservation_list.jsp";
			
	}
}
