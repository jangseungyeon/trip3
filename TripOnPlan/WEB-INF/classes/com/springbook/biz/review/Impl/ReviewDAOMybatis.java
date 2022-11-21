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
	
	//내 리뷰 조회 총 개수 (호스트용)
	public int totalReviewListCntForHost(ReviewVO rvo) {
		return mybatis.selectOne("ReviewDAO.totalReviewListCntForHost", rvo);
	}
	
	//숙소 상세 보기에서 해당 숙소에 대한 리뷰 조회 (회원용)
	public List<ReviewVO> selectReviewForRoom(ReviewVO rvo) {
		return mybatis.selectList("ReviewDAO.selectReviewForRoom", rvo);
	}
	
	//해당 유저가 진짜 이 방에 대해 리뷰를 작성했는지 확인하는 조회 (리뷰 1건)
	public ReviewVO selectReviewOneForUser(ReviewVO rvo) {
		return mybatis.selectOne("ReviewDAO.selectReviewOneForUser", rvo);
	}
	
}
