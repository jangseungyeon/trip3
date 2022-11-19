package com.springbook.biz.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.faq.FaqVO;

@Repository
public class FaqDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;	
	
	//faq 등록
	public void insertFaq(FaqVO vo) {
		System.out.println("===>mybatis insertFaq() 기능처리");
		mybatis.insert("FaqDAO.insertFaq", vo);
	}
	
	//faq 수정
	public void updateFaq(FaqVO vo) {
		System.out.println("===>mybatis updateFaq() 기능처리");
		mybatis.update("FaqDAO.updateFaq", vo);
	}
	
	//faq 삭제
	public void deleteFaq(FaqVO vo) {
		System.out.println("===>mybatis deleteFaq() 기능처리");
		mybatis.delete("FaqDAO.deleteFaq", vo);
	}
	
	//faq 상세 조회
	public FaqVO getFaq(FaqVO vo) {
		System.out.println("===>mybatis getFaq() 기능처리");
		return (FaqVO) mybatis.selectOne("FaqDAO.getFaq", vo);
	}
	
	//faq 목록 조회
	public List<FaqVO> getFaqList(FaqVO vo) {
		System.out.println("===>mybatis로 getFaqList() 기능처리");
		return mybatis.selectList("FaqDAO.getFaqList", vo);
	}

	//faq 글목록 개수
	public int totalFaqListCnt(FaqVO vo) {
		System.out.println("===>mybatis totalFaqListCnt() 기능처리");
		return mybatis.selectOne("FaqDAO.totalFaqListCnt", vo);
	}
	
}
