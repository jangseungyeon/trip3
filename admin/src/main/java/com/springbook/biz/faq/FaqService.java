package com.springbook.biz.faq;

import java.util.List;

public interface FaqService {

//	관리자 공지 등록 
	int manage_faqInsert(FaqVO vo);

//  관리자 공지 수정
	void manage_faqUpdate(FaqVO vo);

// 	관리자 공지 삭제
	void manage_faqDelete(FaqVO vo);

//	관리자 공지 조회
	List<FaqVO> manage_faqList(FaqVO vo);

//  관리자 공지 상세
	FaqVO manage_faqInfo(FaqVO vo);

//  관리자 공지 개수
	int totalFaqListCnt(FaqVO vo);
	
}
