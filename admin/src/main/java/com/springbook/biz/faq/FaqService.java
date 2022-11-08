package com.springbook.biz.faq;

import java.util.List;

public interface FaqService {

//	관리자 공지 조회
	List<FaqVO> manage_faqList();

//	관리자 공지 등록 
	int manage_faqInsert(FaqVO vo);

//  관리자 공지 상세 조회
	FaqVO manage_faqInfo(FaqVO vo);

//  관리자 공지 정보 수정
	void manage_faqUpdate(FaqVO vo);

// 	관리자 공지 삭제
	void manage_faqDelete(FaqVO vo);

	
}
