package com.springbook.biz.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.faq.FaqService;
import com.springbook.biz.faq.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDAOMybatis faqDAO;

//	관리자 공지 등록
	@Override
	public int manage_faqInsert(FaqVO vo) {
		System.out.println("공지 등록");
		return faqDAO.manage_faqInsert(vo);
	}

// 관리자 공지 수정
	@Override
	public void manage_faqUpdate(FaqVO vo) {
		faqDAO.manage_faqUpdate(vo);
	}

//	관리자 공지 삭제
	@Override
	public void manage_faqDelete(FaqVO vo) {
		faqDAO.manage_faqDelete(vo);
	}

// 	관리자 공지 조회
	@Override
	public List<FaqVO> manage_faqList(FaqVO vo) {
		return faqDAO.manage_faqList(vo);
	}

//	관리자 공지 상세
	@Override
	public FaqVO manage_faqInfo(FaqVO vo) {
		return faqDAO.manage_faqInfo(vo);
	}

//	관리자 공지 개수	
	@Override
	public int totalFaqListCnt(FaqVO vo) {
		return faqDAO.totalFaqListCnt(vo);
	}

}
