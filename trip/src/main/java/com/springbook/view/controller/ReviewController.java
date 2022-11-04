package com.springbook.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.common.PagingVO;
import com.springbook.biz.review.ReviewService;
import com.springbook.biz.review.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
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

}
