package com.springbook.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.review.ReviewService;
import com.springbook.biz.review.ReviewVO;
import com.springbook.biz.room.RoomService;
import com.springbook.biz.room.RoomVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping("/move_to_host_review.do")
	public String getReviewListForHost(ReviewVO rvo, String nowPageBtn, Model model, HttpSession session) {
		rvo.setHost_id((String) session.getAttribute("host_id"));
		//총 목록 수
		int totalPageCnt = reviewService.totalReviewListCntForHost(rvo);
		//현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		//한 페이지당 보여줄 목록 수
		int onePageCnt = 10;
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		model.addAttribute("paging", pvo);
		model.addAttribute("reviewListForHost", reviewService.selectReviewListForHost(rvo));
		return "WEB-INF/views/host_review_list.jsp";
	}
	
	@RequestMapping("/move_to_insert_review.do")
	public String moveToInsertReview(@RequestParam(value="room_id") String room_id, Model model) {
		RoomVO rvo = null;
		rvo = new RoomVO();
		rvo.setRoom_id(room_id);
		rvo = roomService.getRoom(rvo);
		model.addAttribute("u_room", rvo);
		return "WEB-INF/views/user_room/user_insert_review_n.jsp";
		
	}
	
	@ResponseBody
	@RequestMapping("/insertReview.do")
	public void insertReview(MultipartHttpServletRequest request, ReviewVO rvo, Model model) throws IllegalStateException, IOException {
		System.out.println("리뷰 등록 시작");
		
		MultipartFile uploadFile1 = rvo.getReview_img_uploadFile();
		
//		String realPath = "c:/Swork/trip/src/main/webapp/resources/review_img/";
		String realPath = request.getSession().getServletContext().getRealPath("/resources/review_img/");
		
		String review_img = uploadFile1.getOriginalFilename();
		
		if(!(uploadFile1.isEmpty())) {
			rvo.setReview_img(review_img);
			uploadFile1.transferTo(new File(realPath + review_img));
		}
		
		reviewService.insertReview(rvo);
		
		List <ReviewVO> rvo_list = reviewService.selectReviewForRoom(rvo);
		
		int review_counts = rvo_list.size();
		
		RoomVO roomvo = null;
		
		roomvo = new RoomVO();
		
		roomvo.setRoom_id(rvo.getRoom_id());
		
		roomvo = roomService.getRoom(roomvo);
		
		Double review_bf = 0.0;
		
		for (int i = 0; i < review_counts; i++) {
			
			review_bf += rvo_list.get(i).getStar_point();

		}
		
		review_bf = (double) (review_bf / review_counts);
		
		String avg_review_s = review_bf.toString();
		
		roomvo.setRoom_stars(avg_review_s);
		
		roomService.updateStarsRoom(roomvo);
	}
	
	@ResponseBody
	@RequestMapping("/updateReview.do")
	public void updateReview(MultipartHttpServletRequest request, ReviewVO rvo) throws IllegalStateException, IOException {
		System.out.println("리뷰 수정 시작");
		
		ReviewVO revo_bf = null;
		
		revo_bf = new ReviewVO();
		
		revo_bf = reviewService.selectReviewOneForUser(rvo);
		
		MultipartFile uploadFile1 = rvo.getReview_img_uploadFile();
		
//		String realPath = "c:/Swork/trip/src/main/webapp/resources/review_img/";
		String realPath = request.getSession().getServletContext().getRealPath("/resources/review_img/");
		
		String review_img = uploadFile1.getOriginalFilename();
		
		if(!(uploadFile1.isEmpty())) {
			
			ReviewVO rvo_d = reviewService.selectReviewOneForUser(rvo);
			
			if(rvo_d.getReview_img() != null) {
				System.out.println("파일 삭제: " + realPath + rvo_d.getReview_img());
				File f = new File(realPath + rvo_d.getReview_img());
				f.delete();
			}
			rvo.setReview_img(review_img);
			uploadFile1.transferTo(new File(realPath + review_img));
		} else {
			
			rvo.setReview_img(revo_bf.getReview_img());
		}
		reviewService.updateReview(rvo);
		
List <ReviewVO> rvo_list = reviewService.selectReviewForRoom(rvo);
		
		int review_counts = rvo_list.size();
		
		RoomVO roomvo = null;
		
		roomvo = new RoomVO();
		
		roomvo.setRoom_id(rvo.getRoom_id());
		
		roomvo = roomService.getRoom(roomvo);
		
		Double review_bf = 0.0;
		
		for (int i = 0; i < review_counts; i++) {
			
			review_bf += rvo_list.get(i).getStar_point();

		}
		
		review_bf = (double) (review_bf / review_counts);
		
		String avg_review_s = review_bf.toString();
		
		roomvo.setRoom_stars(avg_review_s);
		
		roomService.updateStarsRoom(roomvo);
		
		rvo_list = reviewService.selectReviewForRoom(rvo);
		
		review_counts = rvo_list.size();
		
		if(review_counts == 0) {
			roomvo.setRoom_stars("0");
			roomService.updateStarsRoom(roomvo);
		}
	}
	
	@ResponseBody
	@RequestMapping("/deleteReview.do")
	public void deleteReview(MultipartHttpServletRequest request, ReviewVO rvo) throws IllegalStateException, IOException {
		
		System.out.println("리뷰 삭제 시작");
		
		ReviewVO rvo_d = reviewService.selectReviewOneForUser(rvo);
		
//		String realPath = "c:/Swork/trip/src/main/webapp/resources/review_img/";
		String realPath = request.getSession().getServletContext().getRealPath("/resources/review_img/");
		
		if(rvo_d.getReview_img()!=null) {
			System.out.println("파일 삭제: " + realPath + rvo_d.getReview_img());
			File f = new File(realPath + rvo_d.getReview_img());
			f.delete();
		}
		
		reviewService.deleteReview(rvo_d);
		
List <ReviewVO> rvo_list = reviewService.selectReviewForRoom(rvo);
		
		int review_counts = rvo_list.size();
		
		RoomVO roomvo = null;
		
		roomvo = new RoomVO();
		
		roomvo.setRoom_id(rvo.getRoom_id());
		
		roomvo = roomService.getRoom(roomvo);
		
		Double review_bf = 0.0;
		
		for (int i = 0; i < review_counts; i++) {
			
			review_bf += rvo_list.get(i).getStar_point();

		}
		
		review_bf = (double) (review_bf / review_counts);
		
		String avg_review_s = review_bf.toString();
		
		roomvo.setRoom_stars(avg_review_s);
		
		roomService.updateStarsRoom(roomvo);
		
		rvo_list = reviewService.selectReviewForRoom(rvo);
		
		review_counts = rvo_list.size();
		
		if(review_counts == 0) {
			roomvo.setRoom_stars("0");
			roomService.updateStarsRoom(roomvo);
		}
		
	}
}
