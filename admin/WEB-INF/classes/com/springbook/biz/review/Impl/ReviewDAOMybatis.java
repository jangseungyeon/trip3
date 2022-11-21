package com.springbook.biz.review.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.reservation.ReservationVO;
import com.springbook.biz.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//리뷰 등록
	public void insertReview(ReviewVO rvo) {
		mybatis.insert("ReviewDAO.insertReview", rvo);
	}
	
	//리뷰 수정
	public void updateReview(ReviewVO rvo) {
		mybatis.update("ReviewDAO.updateReview", rvo);
	}
	
	//리뷰 삭제
	public void deleteReview(ReviewVO rvo) {
		mybatis.delete("ReviewDAO.deleteReview", rvo);
	}
	
	//리뷰 조회 (호스트용)
	public List<ReviewVO> selectReviewForHost(ReviewVO rvo){
		return mybatis.selectList("ReviewDAO.selectReviewForHost", rvo);
	}
	
	//리뷰 조회 (유저용)
	public List<ReviewVO> selectReviewForUser(ReviewVO rvo){
		return mybatis.selectList("ReviewDAO.selectReviewForUser", rvo);
	}
	
	//리뷰 조회 (관리자용)
	public List<ReviewVO> selectReviewForManager(ReviewVO rvo){
		return mybatis.selectList("ReviewDAO.selectReviewForManager", rvo);
	}
	
}
