package com.springbook.biz.faq;

import java.util.List;

public interface FaqService {

	// 공지 등록
	void insertFaq(FaqVO vo);
	
	// 공지 수정
	void updateFaq(FaqVO vo);
	
	// 공지 삭제
	void deleteFaq(FaqVO vo);
	
	// 공지 목록 조회
	List<FaqVO> getFaqList(FaqVO vo);
	
	// 공지 상세 조회
	FaqVO getFaq(FaqVO vo);

	// 전체 공지 목록 개수
	int totalFaqListCnt(FaqVO vo);
	
}
