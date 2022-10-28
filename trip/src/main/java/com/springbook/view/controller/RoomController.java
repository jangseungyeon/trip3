package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	
	//숙소 등록 (숙소 이미지를 같이 받아야 하기에 Multipart 라이브러리 도입, 숙소 이미지는 webapp 아래 img 폴더에 저장, 등록 완료되면 숙소 리스트 페이지로 이동)
	@RequestMapping(value="/insertRoom.do")
	public String insertRoom(MultipartHttpServletRequest request, RoomVO rvo) throws IllegalStateException, IOException {
		System.out.println("숙소 등록 시작");
		MultipartFile uploadFile = rvo.getUploadFile();
		String realPath = request.getSession().getServletContext().getRealPath("/img/");
		String room_img = uploadFile.getOriginalFilename();
		if(!uploadFile.isEmpty()) {
			rvo.setRoom_img(room_img);
			uploadFile.transferTo(new File(realPath + room_img));
		}
		roomService.insertRoom(rvo);
		System.out.println("숙소 등록 성공");
		return "getRoomList.do";
	}
	
	//숙소 수정 (새션에 저장한 업주 호스트 아이디와 숙소 상세 페이지의 아이디와 일치해야 수정, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value="/updateRoom.do")
	public String updateRoom(@ModelAttribute("room") RoomVO rvo, HttpSession session) {
		System.out.println("숙소 수정 시작");
//		if(rvo.getHost_id().equals(session.getAttribute("host_id").toString()) ) {
			roomService.updateRoom(rvo);
			System.out.println("숙소 수정 성공");
			return "redirect:getRoomList.do";
//		} else {
//			return "getRoom.do?error=y";
//		}
	}
	
	//숙소 삭제 (숙소 이미지 파일 먼저 삭제 후 숙소 조회 후 가지고 온 업주 호스트 아이디와 세션의 업주 호스트 아이디가 일치하면 삭제, 그 후 숙소 목록으로 돌아감)
	@RequestMapping(value="/deleteRoom.do")
	public String deleteRoom(RoomVO rvo, HttpSession session) {
		System.out.println("숙소 삭제 시작");
		String realPath = "c:/Swork/trip/src/main/webapp/img/";
		rvo = roomService.getRoom(rvo);
//		if(rvo.getHost_id().equals(session.getAttribute("host_id").toString()) ) {
			if(rvo.getRoom_img() != null) {
				System.out.println("파일 삭제: " + realPath + rvo.getRoom_img());
				File f = new File(realPath + rvo.getRoom_img());
				f.delete();
			}
			roomService.deleteRoom(rvo);
			System.out.println("숙소 삭제 성공");
			return "redirect:getRoomList.do";
//		} else {
//			return "getRoom.do?error=y";
//		}
	}
	
	//숙소 상세 페이지 보기
	@RequestMapping(value="/getRoom.do")
	public String getRoom(RoomVO rvo, Model model) {
		System.out.println("숙소 상세 보기 시작");
		model.addAttribute("room", roomService.getRoom(rvo));
		System.out.println("숙소 상세 보기 성공");
		return "getRoom.jsp";
	}
	
	//숙소 목록
	@RequestMapping(value="/getRoomList.do")
	public String getRoomList(RoomVO rvo, String nowPageBtn, Model model) {
		
		System.out.println("숙소 목록 검색 시작");
		
		int totalPageCnt = roomService.totalRoomListCnt(rvo);
		
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		
		int onePageCnt = 10;
		
		int oneBtnCnt = 5;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());
		
		model.addAttribute("paging", pvo);
		model.addAttribute("roomList", roomService.getRoomList(rvo));
		return "getRoomList.jsp";
		
	}
	
	
}
