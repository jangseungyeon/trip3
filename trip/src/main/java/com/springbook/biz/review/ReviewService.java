package com.springbook.biz.review;

import java.util.List;

public interface ReviewService {

	void insertReview(ReviewVO rvo);
	
	void updateReview(ReviewVO rvo);
	
	void deleteReview(ReviewVO rvo);
	
	//리뷰 예약 총 개수 조회 (호스트용)
	int totalReviewListCntForHost(ReviewVO rvo);
	
	//리뷰 조회 (호스트용)
	List<ReviewVO> selectReviewListForHost(ReviewVO rvo);
	
	//리뷰 조회 (유저용)
	List<ReviewVO> selectReviewListForUser(ReviewVO rvo);
	
	//리뷰 조회 (관리자용)
	List<ReviewVO> selectReviewListForManager(ReviewVO rvo);
	
	//숙소 상세보기 해당 숙소의 리뷰 조회 (회원용)
	List<ReviewVO> selectReviewForRoom(ReviewVO rvo);

	//해당 유저가 진짜 이 방에 대해 리뷰를 작성했는지 확인하는 조회 (리뷰 1건)
	ReviewVO selectReviewOneForUser(ReviewVO rvo);
	
}