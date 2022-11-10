package com.springbook.biz.review.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.review.ReviewService;
import com.springbook.biz.review.ReviewVO;

@Service("revivewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAOMybatis ReviewDAO;

	@Override
	public void insertReview(ReviewVO rvo) {
		ReviewDAO.insertReview(rvo);
		
	}

	@Override
	public void updateReview(ReviewVO rvo) {
		ReviewDAO.updateReview(rvo);
	}

	@Override
	public void deleteReview(ReviewVO rvo) {
		ReviewDAO.deleteReview(rvo);
	}
	
	//리뷰 조회 (호스트용)
	@Override
	public List<ReviewVO> selectReviewListForHost(ReviewVO rvo) {
		return ReviewDAO.selectReviewForHost(rvo);
	}
	
	//리뷰 조회 (회원용)
	@Override
	public List<ReviewVO> selectReviewListForUser(ReviewVO rvo) {
		return ReviewDAO.selectReviewForUser(rvo);
	}	
	
	//리뷰 조회 (관리자용)
	@Override
	public List<ReviewVO> selectReviewListForManager(ReviewVO rvo) {
		return ReviewDAO.selectReviewForManager(rvo);
	}
	
	//내 리뷰 조회 총 개수 (호스트용)
	@Override
	public int totalReviewListCntForHost(ReviewVO rvo) {
		return ReviewDAO.totalReviewListCntForHost(rvo);
	}
	
	//숙소 상세 보기에서 해당 숙소에 대한 리뷰 조회 (회원용)
	@Override
	public List<ReviewVO> selectReviewForRoom(ReviewVO rvo) {
		return ReviewDAO.selectReviewForRoom(rvo);
	}
	
	//해당 유저가 진짜 이 방에 대해 리뷰를 작성했는지 확인하는 조회 (리뷰 1건)
	@Override
	public ReviewVO selectReviewOneForUser(ReviewVO rvo) {
		return ReviewDAO.selectReviewOneForUser(rvo);
	}

}
