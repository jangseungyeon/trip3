package com.springbook.biz.review;

import java.util.List;

public interface ReviewService {

	void insertReview(ReviewVO rvo);
	
	void updateReview(ReviewVO rvo);
	
	void deleteReservation(ReviewVO rvo);
	
	//리뷰 예약 총 개수 조회
	int totalReviewListCntForHost(ReviewVO rvo);
	
	//리뷰 조회 (호스트용)
	List<ReviewVO> selectReviewListForHost(ReviewVO rvo);
	
	//리뷰 조회 (유저용)
	List<ReviewVO> selectReviewListForUser(ReviewVO rvo);
	
	//리뷰 조회 (관리자용)
	List<ReviewVO> selectReviewListForManager(ReviewVO rvo);
	
}
