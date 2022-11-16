package com.springbook.biz.qna;

import java.util.List;

import com.springbook.biz.user.UserVO;

public interface QnaService {

	// 내가 질문한 내용들
		public List<QnaVO> myQnaList(QnaVO vo);

		// 사용자가 질문할 때 사용
		public int myQnaInsert(QnaVO vo);

		// 사용자가 질문을 수정할 때 사용
		public int myQnaUpdate(QnaVO vo);

		// 사용자가 질문을 삭제할 때 사용
		public int myQnaDelete(QnaVO vo);

		// 사용자정보가져오기
		public UserVO myUserOne(UserVO vo);

		// 관리자페이지 전체 리스트
		public List<QnaVO> adminQnaAllList();

		// 관리페이지 답변 완료 리스트
		public List<QnaVO> adminQnaAnswerList();

		// 관리페이지 미답변 리스트
		public List<QnaVO> adminQnaNoAnswerList();
	    
		//관리자 답글할떄
		public int adminQnaAnswerUpdate(QnaVO vo);
		
		// 사용자가 질문한 내용 상세보기, 관리자 메뉴의 상세보기
		public QnaVO qnaOne(QnaVO vo);

}
