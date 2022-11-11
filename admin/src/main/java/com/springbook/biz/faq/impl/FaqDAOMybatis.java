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

// 	관리자 공지 등록
	public int manage_faqInsert(FaqVO vo) {
		System.out.println("manage_faqInsert: " + vo);
		return mybatis.insert("FaqDAO.manage_faqInsert", vo);
	}

//	관리자 공지 수정	
	public void manage_faqUpdate(FaqVO vo) {
		System.out.println("manage_faqUpdate: " + vo);
		mybatis.update("FaqDAO.manage_faqUpdate", vo);
	}

//	관리자 공지 삭제
	public void manage_faqDelete(FaqVO vo) {
		System.out.println("manage_faqDelete: ");
		mybatis.delete("FaqDAO.manage_faqDelete", vo);
	}

// 	관리자 공지 조회	
	public List<FaqVO> manage_faqList(FaqVO vo) {
		System.out.println("manage_faqList: ");
		return mybatis.selectList("FaqDAO.manage_faqList", vo);
	}

//  관리자 공지 상세
	public FaqVO manage_faqInfo(FaqVO vo) {
		System.out.println("manage_faqInfo: " + vo);
		return mybatis.selectOne("FaqDAO.manage_faqInfo", vo);
	}

//	관리자 공지 개수
	public int totalFaqListCnt(FaqVO vo) {
		System.out.println("totalFaqListCnt() 기능처리");
		return mybatis.selectOne("FaqDAO.totalFaqListCnt", vo);
	}

}
