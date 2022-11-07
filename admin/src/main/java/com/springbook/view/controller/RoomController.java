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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Controller
@SessionAttributes("room")
public class RoomController {

	@Autowired
	private RoomService roomService;

	@ModelAttribute("roomListHeadMap")
	public Map<String, String> searchroomListHeadMap() {
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

	// 관리자 숙소 조회
	@RequestMapping(value = "/manage_roomList.do")
	public String manage_roomList(RoomVO rvo, Model model) {

		System.out.println("숙소 목록 검색 시작");
		List<RoomVO> list = roomService.manage_roomList(rvo);
		model.addAttribute("list", list);
		System.out.println("숙소 목록 출력 시작");

		return "WEB-INF/views/manage_roomList.jsp";
	}

	// 관리자 숙소 상세 보기
	@RequestMapping(value = "/manage_roomInfo.do")
	public String manage_roomInfo(RoomVO rvo, Model model) {
		System.out.println("숙소 상세 보기 시작");
		model.addAttribute("RoomVO", roomService.manage_roomInfo(rvo));
		System.out.println("숙소 상세 보기 성공");

		return "WEB-INF/views/manage_roomInfo.jsp";
	}

	// 관리자 숙소 수정 (새션에 저장한 업주 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value = "/manage_updateRoom.do")
	public String manage_updateRoom(@ModelAttribute RoomVO rvo, HttpSession session) {
		System.out.println("숙소 수정 시작");
		roomService.manage_updateRoom(rvo);
		System.out.println("숙소 수정 성공");

		return "manage_roomList.do";
	}

	// 관리자 숙소 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 업주 호스트 아이디와 세션의 업주 호스트 아이디가 일치하면
	// 삭제, 그후 숙소 목록으로 돌아감)
	@RequestMapping(value = "/manage_deleteRoom.do")
	public String manage_deleteRoom(RoomVO rvo, HttpSession session) {
		System.out.println("숙소 삭제 시작");
//		String realPath = "c:/Swork/trip/src/main/webapp/resources/room_img/";
		// 위는 테스트용, 아래는 실제 서버에 올리면 써야하는 경로 구하는 법 (컨트롤러 안에 어떤 request.getParameter가 들어가면
		// 안됨)
		// String realPath =
		// request.getSession().getServletContext().getRealPath("/resources/room_img/");

		roomService.manage_roomList(rvo);

		// 숙소 이미지 모두 삭제
//		if (rvo.getHost_id().equals(session.getAttribute("host_id").toString())) {
//			if (rvo.getRoom_img_no1() != null) {
//				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no1());
//				File f = new File(realPath + rvo.getRoom_img_no1());
//				f.delete();
//			}
//			if (rvo.getRoom_img_no2() != null) {
//				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no2());
//				File f = new File(realPath + rvo.getRoom_img_no2());
//				f.delete();
//			}
//			if (rvo.getRoom_img_no3() != null) {
//				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no3());
//				File f = new File(realPath + rvo.getRoom_img_no3());
//				f.delete();
//			}
//			if (rvo.getRoom_img_no4() != null) {
//				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no4());
//				File f = new File(realPath + rvo.getRoom_img_no4());
//				f.delete();
//			}
//			if (rvo.getRoom_img_no5() != null) {
//				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img_no5());
//				File f = new File(realPath + rvo.getRoom_img_no5());
//				f.delete();
//			}
			roomService.manage_deleteRoom(rvo);
			System.out.println("숙소 삭제 성공");
			return "manage_roomList.do";
//		} else {
//			return "manage_roomList.do?error=y";
//		}
	}

}
