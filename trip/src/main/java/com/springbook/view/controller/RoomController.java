package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@ModelAttribute("roomListHeadMap")
	public Map<String, String> searchroomListHeadMap(){
		Map<String, String> roomListHeadMap = new HashMap<String, String>();
		roomListHeadMap.put("RoomName", "숙박시설 이름");
		roomListHeadMap.put("RoomAddr", "숙박시설 주소");
		roomListHeadMap.put("RoomTumbnail", "숙박시설 대표 이미지");
		roomListHeadMap.put("RoomMax", "최대 수용 인원");
		roomListHeadMap.put("RoomTheme", "숙박 시설 테마");
		roomListHeadMap.put("RoomPrice", "숙박 1박당 가격");
		roomListHeadMap.put("RoomCat", "숙박시설 유형");
		roomListHeadMap.put("RoomWIFI", "와이파이 유무");
		roomListHeadMap.put("RoomPet", "애완견 동반 투숙 가능 유무");
		roomListHeadMap.put("RoomMeal", "조식 제공 유무");
		roomListHeadMap.put("RoomParking", "주차 가능 유무");
		roomListHeadMap.put("RoomSwpool", "수영장 보유 유무");
		return roomListHeadMap;
	}
	
	//숙소 등록 (숙소 이미지를 같이 받아야 하기에 Multipart 라이브러리 도입, 숙소 이미지는 webapp 아래 img 폴더에 저장, 등록 완료되면 숙소 리스트 페이지로 이동)
	@RequestMapping(value="/insertRoom.do")
	public String insertRoom(MultipartHttpServletRequest request, RoomVO rvo) throws IllegalStateException, IOException {
		System.out.println("숙소 등록 시작");
		MultipartFile uploadFile = rvo.getUploadFile();
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		//위는 테스트용, 아래는 실제 서버에 올리면 써야하는 경로 구하는 법 (컨트롤러 안에 어떤 request.getParameter가 들어가면 안됨)
//		String realPath = request.getSession().getServletContext().getRealPath("/resources/room_img/");
		String room_img = uploadFile.getOriginalFilename();
		if(!uploadFile.isEmpty()) {
			rvo.setRoom_img(room_img);
			uploadFile.transferTo(new File(realPath + room_img));
		}
		rvo.setRoom_price(rvo.getRoom_price().replace(",", ""));
		roomService.insertRoom(rvo);
		System.out.println("숙소 등록 성공");
		return "redirect:getRoomList.do";
	}
	
	@RequestMapping(value="/moveInsertRoom.do")
	public String moveInsertRoom() {
		return "WEB-INF/views/host_insert_room.jsp";
	}
	
	
	//숙소 수정 (새션에 저장한 업주 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value="/updateRoom.do")
	public String updateRoom(MultipartHttpServletRequest request, @ModelAttribute("room") RoomVO rvo, HttpSession session, SessionStatus sessionStatus) throws IllegalStateException, IOException {
		
		System.out.println("숙소 수정 시작");
		
		RoomVO rvo_bf = null;
		rvo_bf = new RoomVO();
		
		rvo_bf.setRoom_id(rvo.getRoom_id());
		rvo_bf.setHost_id(rvo.getHost_id());
		
		rvo_bf = roomService.getRoom(rvo_bf);
		
		MultipartFile uploadFile = rvo.getUploadFile();
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		String room_img = uploadFile.getOriginalFilename();
		
		if(rvo.getHost_id().equals(session.getAttribute("host_id").toString()) ) {
			if(!uploadFile.isEmpty()) {
				if(rvo_bf.getRoom_img() != null) {
					System.out.println("파일 삭제: " + realPath + rvo_bf.getRoom_img());
					File f = new File(realPath + rvo_bf.getRoom_img());
					f.delete();
				}
				rvo.setRoom_img(room_img);
				uploadFile.transferTo(new File(realPath + room_img));
			}
			rvo.setRoom_price(rvo.getRoom_price().replace(",", ""));
			roomService.updateRoom(rvo);
			System.out.println("숙소 수정 성공");
			sessionStatus.setComplete();
			//세션에서 "room" model 객체 지움 (객체 관리)
			return "redirect:getRoomList.do";
		} else {
			return "getRoom.do?error=y";
		}
	}
	
	//숙소 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 업주 호스트 아이디와 세션의 업주 호스트 아이디가 일치하면 삭제, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value="/deleteRoom.do")
	//public String deleteRoom(MultipartHttpServletRequest request, RoomVO rvo, HttpSession session) throws IllegalStateException, IOException {
	public String deleteRoom(RoomVO rvo, HttpSession session) {
		System.out.println("숙소 삭제 시작");
		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		//위는 테스트용, 아래는 실제 서버에 올리면 써야하는 경로 구하는 법 (컨트롤러 안에 어떤 request.getParameter가 들어가면 안됨)
		//String realPath = request.getSession().getServletContext().getRealPath("/resources/room_img/");
		rvo = roomService.getRoom(rvo);
		if(rvo.getHost_id().equals(session.getAttribute("host_id").toString()) ) {
			if(rvo.getRoom_img() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img());
				File f = new File(realPath + rvo.getRoom_img());
				f.delete();
			}
			roomService.deleteRoom(rvo);
			System.out.println("숙소 삭제 성공");
			return "redirect:getRoomList.do";
		} else {
			return "getRoom.do?error=y";
		}
	}
	
	//숙소 상세 페이지 보기
	@RequestMapping(value="/getRoom.do")
	public String getRoom(RoomVO rvo, Model model) {
		System.out.println("숙소 상세 보기 시작");
		model.addAttribute("room", roomService.getRoom(rvo));
		System.out.println("숙소 상세 보기 성공");
		return "WEB-INF/views/host_room_detail.jsp";
	}
	
	//숙소 목록
	@RequestMapping(value="/getRoomList.do")
	public String getRoomList(RoomVO rvo, String nowPageBtn, Model model, HttpSession session) {
		
		System.out.println("숙소 목록 검색 시작");
		
		if(session.getAttribute("host_id") != null) {
			rvo.setHost_id((String) session.getAttribute("host_id"));
		}
		
		int totalPageCnt = roomService.totalRoomListCnt(rvo);
		
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		
		int onePageCnt = 10;
		
		int oneBtnCnt = 5;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());
		
		model.addAttribute("paging", pvo);
		model.addAttribute("roomList", roomService.getRoomList(rvo));
		return "WEB-INF/views/host_room_list.jsp";
		
	}
	
	// 장승연 숙소목록
		@RequestMapping(value = "/u_getRoomList.do")
		public String u_getRoomList(RoomVO rvo, Model model) {
			System.out.println("u_getRoomList" + rvo);
			List<RoomVO> u = roomService.getRoomList(rvo);
			System.out.println(u);
			model.addAttribute("u_roomList", u);
			return "WEB-INF/views/roomlist.jsp";
		}

		// 장승연 숙소검색필터
		@RequestMapping(value = "/u_searchRoomList.do")
		public String u_searchRoomList(RoomVO rvo, Model model) {
			System.out.println("u_searchRoomList : " + rvo);
			List<RoomVO> u = roomService.u_searchRoomList(rvo);
			System.out.println(u);
			model.addAttribute("u_roomList", u);
			return "WEB-INF/views/roomlist.jsp";
		}
}
