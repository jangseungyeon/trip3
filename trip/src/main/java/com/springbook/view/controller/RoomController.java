package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Controller
@SessionAttributes("room")
public class RoomController {

	@Autowired
	private RoomService roomService;

	//(호스트) 업주용 숙박 목록, 업주용 숙박 상세 페이지 제목 라벨링
	@ModelAttribute("roomListHeadMap")
	public Map<String, String> searchroomListHeadMap() {
		Map<String, String> roomListHeadMap = new HashMap<String, String>();
		roomListHeadMap.put("RoomName", "숙박시설 이름");
		roomListHeadMap.put("RoomAddr", "숙박시설 주소");
		roomListHeadMap.put("RoomTumbnail", "숙박시설 대표 이미지");
		roomListHeadMap.put("RoomMax", "최대 수용 인원");
		roomListHeadMap.put("RoomTheme", "숙박 시설 테마");
		roomListHeadMap.put("RoomPrice", "숙박 1박당 가격");
		roomListHeadMap.put("RoomPoints", "숙박 마일리지 (숙박 1박당 가격의 8%로 자동 계산)");
		roomListHeadMap.put("RoomDesc", "숙박 시설 설명을 여기에 적어주세요");
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
		return "WEB-INF/views/host_insert_room.jsp";
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
	public String updateRoom(MultipartHttpServletRequest request, @ModelAttribute("room") RoomVO rvo, HttpSession session, SessionStatus sessionStatus) throws IllegalStateException, IOException {
		
		System.out.println("숙소 수정 시작");
		
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
			}
			
			if(!uploadFile2.isEmpty()) {
				if(rvo_bf.getRoom_img_no2() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no2());
					File f = new File(realPath + rvo_bf.getRoom_img_no2());
					f.delete();
				}
				rvo.setRoom_img_no2(room_img_no2);
				uploadFile2.transferTo(new File(realPath + room_img_no2));
			}
			
			if(!uploadFile3.isEmpty()) {
				if(rvo_bf.getRoom_img_no3() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no3());
					File f = new File(realPath + rvo_bf.getRoom_img_no3());
					f.delete();
				}
				rvo.setRoom_img_no3(room_img_no3);
				uploadFile3.transferTo(new File(realPath + room_img_no3));
			}
			
			if(!uploadFile4.isEmpty()) {
				if(rvo_bf.getRoom_img_no4() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no4());
					File f = new File(realPath + rvo_bf.getRoom_img_no4());
					f.delete();
				}
				rvo.setRoom_img_no4(room_img_no4);
				uploadFile4.transferTo(new File(realPath + room_img_no4));
			}
			
			if(!uploadFile5.isEmpty()) {
				if(rvo_bf.getRoom_img_no5() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img_no5());
					File f = new File(realPath + rvo_bf.getRoom_img_no5());
					f.delete();
				}
				rvo.setRoom_img_no5(room_img_no5);
				uploadFile5.transferTo(new File(realPath + room_img_no5));
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

	//(호스트) 업주용 숙소 상세 페이지 보기
	@RequestMapping(value = "/getRoom.do")
	public String getRoom(RoomVO rvo, Model model) {
		System.out.println("숙소 상세 보기 시작");
		model.addAttribute("room", roomService.getRoom(rvo));
		System.out.println("숙소 상세 보기 성공");
		return "WEB-INF/views/host_room_detail.jsp";
	}

	//(호스트) 업주용 숙소 목록
	@RequestMapping(value = "/getRoomList.do")
	public String getRoomList(RoomVO rvo, String nowPageBtn, Model model, HttpSession session) {

		System.out.println("숙소 목록 검색 시작");

		if (session.getAttribute("host_id") != null) {
			rvo.setHost_id((String) session.getAttribute("host_id"));
		}

		int totalPageCnt = roomService.totalRoomListCnt(rvo);

		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);

		int onePageCnt = 10;

		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("roomList", roomService.getRoomList(rvo));
		return "WEB-INF/views/host_room_list.jsp";

	}

	//(회원) 장승연 회원용 숙소목록
	@RequestMapping(value="/u_getRoomList.do")
	public String u_getRoomList(RoomVO rvo, Model model) {
		System.out.println("u_getRoomList: " + rvo);
		List<RoomVO> u_list = roomService.u_getRoomList(rvo);
		System.out.println(u_list);
		model.addAttribute("u_roomList", u_list);
		return "WEB-INF/views/user_room_list.jsp";
	}
	
	//(회원) 장승연 회원용 숙소 검색 필터
	@RequestMapping(value="/u_searchRoomList.do")
	public String u_searchRoomList(RoomVO rvo, Model model) {
		System.out.println("u_getRoomList: " + rvo);
		List<RoomVO> u_list = roomService.u_searchRoomList(rvo);
		System.out.println(u_list);
		model.addAttribute("u_roomList", u_list);
		model.addAttribute("rvo", rvo);
		return "WEB-INF/views/user_room_list.jsp";
	}
	
	//(회원) 회원용 숙소 상세페이지 이동
	@RequestMapping(value="/u_getRoom.do")
	public String u_getRoom(RoomVO rvo, Model model) {
		System.out.println("u_getRoom: " + rvo);
		RoomVO u_room = roomService.getRoom(rvo);
		System.out.println(u_room);
		model.addAttribute("u_room", u_room);
		return "WEB-INF/views/user_room_detail.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/mainRoomThemeList.do")
	public List<RoomVO> mainRoomThemeList(RoomVO vo , String theme , Model model) {
		vo.setRoom_theme(theme);
		model.addAttribute("size", roomService.mainRoomThemeList(vo).size());
		return roomService.mainRoomThemeList(vo);
	}
}