package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.planner.LikeService;
import com.springbook.biz.planner.LikeVO;
import com.springbook.biz.reservation.ReservationService;
import com.springbook.biz.reservation.ReservationVO;
import com.springbook.biz.review.ReviewService;
import com.springbook.biz.review.ReviewVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Controller
@SessionAttributes("room")
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@Autowired
	private LikeService Service;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReservationService reservationService;
	

	//(호스트) 업주용 숙박 목록, 업주용 숙박 상세 페이지 제목 라벨링
	@ModelAttribute("roomListHeadMap")
	public Map<String, String> searchroomListHeadMap() {
		Map<String, String> roomListHeadMap = new HashMap<String, String>();
		roomListHeadMap.put("RoomName", "숙박시설 이름");
		roomListHeadMap.put("RoomAddr", "숙박시설 주소");
		roomListHeadMap.put("RoomTumbnail", "숙박시설 이미지 수정/추가");
		roomListHeadMap.put("RoomMax", "최대 수용 인원");
		roomListHeadMap.put("RoomTheme", "숙박 시설 테마");
		roomListHeadMap.put("RoomPrice", "숙박 1박당 가격");
		roomListHeadMap.put("RoomDesc", "숙박 시설 설명");
		roomListHeadMap.put("RoomCat", "숙박시설 유형");
		roomListHeadMap.put("RoomWIFI", "와이파이 유무");
		roomListHeadMap.put("RoomPet", "애완견 동반 투숙 가능 유무");
		roomListHeadMap.put("RoomMeal", "조식 제공 유무");
		roomListHeadMap.put("RoomParking", "주차 가능 유무");
		roomListHeadMap.put("RoomSwpool", "수영장 보유 유무");
		return roomListHeadMap;
	}
	
	//(호스트) 업주용 숙소 등록 폼 페이지 이동
	@RequestMapping(value="/moveInsertRoom.do")
	public String moveInsertRoom() {
		return "WEB-INF/views/host_room/host_room_insert.jsp";
	}

	// (호스트) 숙소 등록 (숙소 이미지를 같이 받아야 하기에 Multipart 라이브러리 도입, 숙소 이미지는 webapp 아래 img 폴더에 저장,
	// 등록 완료되면 숙소 리스트 페이지로 이동)
	@RequestMapping(value="/insertRoom.do")
	public String insertRoom(MultipartHttpServletRequest request, RoomVO rvo) throws IllegalStateException, IOException {
		System.out.println("숙소 등록 시작");
		
		String room_area = rvo.getRoom_addr().split(" ")[0];
		
		rvo.setRoom_area(room_area);
		
		MultipartFile uploadFile1 = rvo.getRoom_img_no1_multi();
		MultipartFile uploadFile2 = rvo.getRoom_img_no2_multi();
		MultipartFile uploadFile3 = rvo.getRoom_img_no3_multi();
		MultipartFile uploadFile4 = rvo.getRoom_img_no4_multi();
		MultipartFile uploadFile5 = rvo.getRoom_img_no5_multi();
		
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		
		//위는 테스트용, 아래는 실제 서버에 올리면 써야하는 경로 구하는 법 (컨트롤러 안에 어떤 request.getParameter가 들어가면 안됨)
		//String realPath = request.getSession().getServletContext().getRealPath("/resources/room_img/");
		
		String room_img_no1 = uploadFile1.getOriginalFilename();
		String room_img_no2 = uploadFile2.getOriginalFilename();
		String room_img_no3 = uploadFile3.getOriginalFilename();
		String room_img_no4 = uploadFile4.getOriginalFilename();
		String room_img_no5 = uploadFile5.getOriginalFilename();
		
		//숙소 이미지 5개 (첫번째 uploadeFile1, room_img_no1 대표 이미지, 나머지 4개는 서브 이미지)
		
		if(!(uploadFile1.isEmpty())){
			rvo.setRoom_img_no1(room_img_no1);
			uploadFile1.transferTo(new File(realPath + room_img_no1));
			if(!(uploadFile2.isEmpty())){
				rvo.setRoom_img_no2(room_img_no2);
				uploadFile2.transferTo(new File(realPath + room_img_no2));
				if(!(uploadFile3.isEmpty())){
					rvo.setRoom_img_no3(room_img_no3);
					uploadFile3.transferTo(new File(realPath + room_img_no3));
						if(!(uploadFile4.isEmpty())){
							rvo.setRoom_img_no4(room_img_no4);
							uploadFile4.transferTo(new File(realPath + room_img_no4));
								if(!(uploadFile5.isEmpty())){
									rvo.setRoom_img_no5(room_img_no5);
									uploadFile5.transferTo(new File(realPath + room_img_no5));
							}
						}
					}
				}
			}
		
		rvo.setRoom_price(rvo.getRoom_price().replace(",", ""));
		roomService.insertRoom(rvo);
		System.out.println("숙소 등록 성공");
		return "redirect:getRoomList.do";
		}
		
	//(호스트) 숙소 수정 (새션에 저장한 업주 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value="/updateRoom.do")
	public String updateRoom(MultipartHttpServletRequest request, RoomVO rvo, HttpSession session, Model model) throws IllegalStateException, IOException {
		
		System.out.println("숙소 수정 시작");
		
		RoomVO room_s = null;
		
		room_s = new RoomVO();
		
		room_s = (RoomVO) model.getAttribute("room");
		
		RoomVO rvo_bf = null;
		rvo_bf = new RoomVO();
		
		rvo_bf.setRoom_id(rvo.getRoom_id());
		rvo_bf.setHost_id(rvo.getHost_id());
		
		rvo_bf = roomService.getRoom(rvo_bf);
		
		//변경될 숙소 이미지 변경이 안되었든 (null), 아니든 상관없이 받고
		
		MultipartFile uploadFile1 = rvo.getRoom_img_no1_multi();
		MultipartFile uploadFile2 = rvo.getRoom_img_no2_multi();
		MultipartFile uploadFile3 = rvo.getRoom_img_no3_multi();
		MultipartFile uploadFile4 = rvo.getRoom_img_no4_multi();
		MultipartFile uploadFile5 = rvo.getRoom_img_no5_multi();
		
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		
		String room_img_no1 = uploadFile1.getOriginalFilename();
		String room_img_no2 = uploadFile2.getOriginalFilename();
		String room_img_no3 = uploadFile3.getOriginalFilename();
		String room_img_no4 = uploadFile4.getOriginalFilename();
		String room_img_no5 = uploadFile5.getOriginalFilename();
		
		if(rvo.getHost_id().equals(session.getAttribute("host_id").toString()) ) {
			
			//변경한 사진 empty 체크와 기존 이미지 파일 업로드 여부 일일이 확인후 기존 이미지 삭제 + 변경될 새로운 이미지 업로드
			
			if(!uploadFile1.isEmpty()) {
				if(rvo_bf.getRoom_img_no1() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no1());
					File f = new File(realPath + rvo_bf.getRoom_img_no1());
					f.delete();
				}
				rvo.setRoom_img_no1(room_img_no1);
				uploadFile1.transferTo(new File(realPath + room_img_no1));
			} else {
				rvo.setRoom_img_no1(room_s.getRoom_img_no1());
			}
			
			if(!uploadFile2.isEmpty()) {
				if(rvo_bf.getRoom_img_no2() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no2());
					File f = new File(realPath + rvo_bf.getRoom_img_no2());
					f.delete();
				}
				rvo.setRoom_img_no2(room_img_no2);
				uploadFile2.transferTo(new File(realPath + room_img_no2));
			} else {
				rvo.setRoom_img_no2(room_s.getRoom_img_no2());
			}
			
			if(!uploadFile3.isEmpty()) {
				if(rvo_bf.getRoom_img_no3() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no3());
					File f = new File(realPath + rvo_bf.getRoom_img_no3());
					f.delete();
				}
				rvo.setRoom_img_no3(room_img_no3);
				uploadFile3.transferTo(new File(realPath + room_img_no3));
			} else {
				rvo.setRoom_img_no3(room_s.getRoom_img_no3());
			}
			
			if(!uploadFile4.isEmpty()) {
				if(rvo_bf.getRoom_img_no4() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no4());
					File f = new File(realPath + rvo_bf.getRoom_img_no4());
					f.delete();
				}
				rvo.setRoom_img_no4(room_img_no4);
				uploadFile4.transferTo(new File(realPath + room_img_no4));
			} else {
				rvo.setRoom_img_no4(room_s.getRoom_img_no4());
			}
			
			if(!uploadFile5.isEmpty()) {
				if(rvo_bf.getRoom_img_no5() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no5());
					File f = new File(realPath + rvo_bf.getRoom_img_no5());
					f.delete();
				}
				rvo.setRoom_img_no5(room_img_no5);
				uploadFile5.transferTo(new File(realPath + room_img_no5));
			} else {
				rvo.setRoom_img_no5(room_s.getRoom_img_no5());
			}
			
			rvo.setRoom_price(rvo.getRoom_price().replace(",", ""));
			roomService.updateRoom(rvo);
			System.out.println("숙소 수정 성공");
			return "redirect:getRoomList.do";
		} else {
			return "getRoom.do?error=y";
		}
	}

	//(호스트) 숙소 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 업주 호스트 아이디와 세션의 업주 호스트 아이디가 일치하면 삭제, 
	// 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value = "/deleteRoom.do")
	// public String deleteRoom(MultipartHttpServletRequest request, RoomVO rvo,
	// HttpSession session) throws IllegalStateException, IOException {
	public String deleteRoom(RoomVO rvo, HttpSession session) {
		System.out.println("숙소 삭제 시작");
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		// 위는 테스트용, 아래는 실제 서버에 올리면 써야하는 경로 구하는 법 (컨트롤러 안에 어떤 request.getParameter가 들어가면 안됨)
		// String realPath =
		// request.getSession().getServletContext().getRealPath("/resources/room_img/");
		rvo = roomService.getRoom(rvo);
		
		//숙소 이미지 모두 삭제
		if (rvo.getHost_id().equals(session.getAttribute("host_id").toString())) {
			if(rvo.getRoom_img_no1() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no1());
				File f = new File(realPath + rvo.getRoom_img_no1());
				f.delete();
			}
			if(rvo.getRoom_img_no2() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no2());
				File f = new File(realPath + rvo.getRoom_img_no2());
				f.delete();
			}
			if(rvo.getRoom_img_no3() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no3());
				File f = new File(realPath + rvo.getRoom_img_no3());
				f.delete();
			}
			if(rvo.getRoom_img_no4() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no4());
				File f = new File(realPath + rvo.getRoom_img_no4());
				f.delete();
			}
			if(rvo.getRoom_img_no5() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no5());
				File f = new File(realPath + rvo.getRoom_img_no5());
				f.delete();
			}
			roomService.deleteRoom(rvo);
			System.out.println("숙소 삭제 성공");
			return "redirect:getRoomList.do";
		} else {
			return "getRoom.do?error=y";
		}
	}
	
	@ResponseBody
	@RequestMapping("/deleteRoomImageTwo.do")
	public void deleteRoomImageTwo(@RequestParam("room_id") String room_id) {
		System.out.println("숙소 이미지 하나 삭제 시작");
		RoomVO rvo_I2 = null;
		rvo_I2 = new RoomVO();
		
		rvo_I2.setRoom_id(room_id);
		
		roomService.deleteRoomImageOne2(rvo_I2);
		
		System.out.println("숙소 이미지 하나 삭제 완료");
	}
	
	@ResponseBody
	@RequestMapping("/deleteRoomImageThree.do")
	public void deleteRoomImageThree(@RequestParam("room_id") String room_id) {
		System.out.println("숙소 이미지 하나 삭제 시작");
		RoomVO rvo_I3 = null;
		rvo_I3 = new RoomVO();
		
		rvo_I3.setRoom_id(room_id);
		
		roomService.deleteRoomImageOne3(rvo_I3);
		
		System.out.println("숙소 이미지 하나 삭제 완료");
	}
	
	@ResponseBody
	@RequestMapping("/deleteRoomImageFour.do")
	public void deleteRoomImageFour(@RequestParam("room_id") String room_id) {
		System.out.println("숙소 이미지 하나 삭제 시작");
		RoomVO rvo_I4 = null;
		rvo_I4 = new RoomVO();
		
		rvo_I4.setRoom_id(room_id);
		
		roomService.deleteRoomImageOne4(rvo_I4);
		
		System.out.println("숙소 이미지 하나 삭제 완료");
	}
	
	@ResponseBody
	@RequestMapping("/deleteRoomImageFive.do")
	public void deleteRoomImageFive(@RequestParam("room_id") String room_id) {
		System.out.println("숙소 이미지 하나 삭제 시작");
		RoomVO rvo_I5 = null;
		rvo_I5 = new RoomVO();
		
		rvo_I5.setRoom_id(room_id);
		
		roomService.deleteRoomImageOne5(rvo_I5);
		
		System.out.println("숙소 이미지 하나 삭제 완료");
	}

	//(호스트) 업주용 숙소 상세 페이지 보기
	@RequestMapping(value = "/getRoom.do")
	public String getRoom(RoomVO rvo, Model model) {
		System.out.println("숙소 상세 보기 시작");
		model.addAttribute("room", roomService.getRoom(rvo));
		System.out.println("숙소 상세 보기 성공");
		return "WEB-INF/views/host_room/host_room_detail.jsp";
	}

	//(호스트) 업주용 숙소 목록
	@RequestMapping(value = "/getRoomList.do")
	public String getRoomList(RoomVO rvo, String nowPageBtn, Model model, HttpSession session) {

		System.out.println("숙소 목록 검색 시작");

		if (session.getAttribute("host_id") != null) {
			rvo.setHost_id((String) session.getAttribute("host_id"));
		}
		
		if(rvo.getSearchCondition() == null) {
			rvo.setSearchCondition("RoomName");
		}
		
		if(rvo.getSearchKeyword() == null) {
			rvo.setSearchKeyword("");
		}
		
		model.addAttribute("roomList", roomService.getRoomList(rvo));
		return "WEB-INF/views/host_room/host_room_list.jsp";

	}

	//(회원) 장승연 회원용 숙소목록
	@RequestMapping(value="/u_getRoomList.do")
	public String u_getRoomList(RoomVO rvo, Model model) {
		System.out.println("u_getRoomList: " + rvo);
		List<RoomVO> u_list = roomService.u_getRoomList(rvo);
		System.out.println(u_list);
		model.addAttribute("u_roomList", u_list);
		return "WEB-INF/views/user_room/user_room_list.jsp";
	}
	
	//(회원) 장승연 회원용 숙소 검색 필터
	@RequestMapping(value="/u_searchRoomList.do")
	public String u_searchRoomList(RoomVO rvo, Model model) {
		System.out.println("u_getRoomList: " + rvo);
		List<RoomVO> u_list = roomService.u_searchRoomList(rvo);
		System.out.println(u_list);
		model.addAttribute("u_roomList", u_list);
		model.addAttribute("rvo", rvo);
		
		if(u_list.size() != 0) {
			model.addAttribute("moveCards", "Y");
		} else {
			model.addAttribute("moveNone", "Y");
		}
		
		return "WEB-INF/views/user_room/user_room_list.jsp";
	}
	
	//(회원) 회원용 숙소 상세페이지 이동
	@RequestMapping(value="/u_getRoom.do")
	public String u_getRoom(RoomVO rvo, Model model, HttpSession session) throws Exception {
		System.out.println("u_getRoom: " + rvo);
		RoomVO u_room = roomService.getRoom(rvo);
		System.out.println(u_room);
		LikeVO lvo = null;
		ReviewVO revo = null;
		ReservationVO rsvo = null;
		rsvo = new ReservationVO();
		revo = new ReviewVO();
		lvo = new LikeVO();
		lvo.setUser_id((String) session.getAttribute("user_id"));
		rsvo.setUser_id((String) session.getAttribute("user_id"));
		revo.setRoom_id(u_room.getRoom_id());
		lvo.setLike_id(u_room.getRoom_id());
		lvo = Service.likeselectRoom(lvo);
		List<ReviewVO> revo_list = reviewService.selectReviewForRoom(revo);
		System.out.println(revo_list);
		List<ReservationVO> rsvo_list = reservationService.getReservationList(rsvo);
		
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
		for(ReservationVO rvo_f : rsvo_list) {
			
			
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
				
				//위의 조건은 체크인 3일전보다 더 시간이 지났고 체크아웃보다 지나지 않은 오늘 날짜 상태
				
				
				//res_ci3_ok => true값이면 예약 변경 가능 (기본값 true, 예약 변경 불가능이면 false)
				//res_co_ok => false이면 리뷰 쓰기 버튼 비활성화 아직 오늘 날짜가 체크 아웃 날짜보다 지나지 않았음 (기본값 false, true면 리뷰 쓰기 버튼 기능 활성화)
				
				
				rvo_f.setRes_ci3_ok("false");
			} 
			
			if ((dayDiff_toco >= 0) == true) {
				
				// 체크 아웃 날짜보다 오늘 날짜가 같거나 지난 상태
				
				rvo_f.setRes_ci3_ok("false");
				rvo_f.setRes_co_ok("true");
				
			}
			
		}
		
		for(int i = 0; i < rsvo_list.size(); i++) {
			if((rvo.getRoom_id()).equals((rsvo_list.get(i).getRoom_id()))) {
				rsvo = rsvo_list.get(i);
			}
		}
		model.addAttribute("u_room", u_room);
		model.addAttribute("lvo", lvo);
		model.addAttribute("revo_list", revo_list);
		model.addAttribute("rsvo", rsvo);
		return "WEB-INF/views/user_room/user_room_detail.jsp";
	}}