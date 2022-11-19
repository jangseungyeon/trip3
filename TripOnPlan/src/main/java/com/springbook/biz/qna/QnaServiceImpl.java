package com.springbook.biz.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.user.UserVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaDAOMybatis qnaDAOMybatis;//DAO에 접근하기위한 객체 생성.

	// 내가 질문한 내용들
	@Override
//Controller에서myQnaList(QnaVO vo)를QnaServiceImpl에서myQnaList(QnaVO vo)이동.
	public List<QnaVO> myQnaList(QnaVO vo) {
		return qnaDAOMybatis.myQnaList(vo);
	}

	//사용자가 질문할 때 사용
	@Override
	public int myQnaInsert(QnaVO vo) {
		return qnaDAOMybatis.myQnaInsert(vo);
	}

	//사용자가 질문을 수정할 때 사용
	@Override
	public int myQnaUpdate(QnaVO vo) {
		return qnaDAOMybatis.myQnaUpdate(vo);
	}

	//사용자가 질문을 삭제할 때 사용
	@Override
	public int myQnaDelete(QnaVO vo) {
		return qnaDAOMybatis.myQnaDelete(vo);
	}
	
	//사용자 정보 가져오기
	public UserVO myUserOne(UserVO vo) {
		return qnaDAOMybatis.myUserOne(vo);
	}

	//관리자페이지 전체 리스트
	@Override
	public List<QnaVO> adminQnaAllList() {
		return qnaDAOMybatis.adminQnaAllList();
	}

	//관리페이지 답변 완료 리스트
	@Override
	public List<QnaVO> adminQnaAnswerList() {
		return qnaDAOMybatis.adminQnaAnswerList();
	}

	//관리페이지 미답변 리스트
	@Override
	public List<QnaVO> adminQnaNoAnswerList() {
		return qnaDAOMybatis.adminQnaNoAnswerList();
	}
	
	//관리자 답글 할떄
	public int adminQnaAnswerUpdate(QnaVO vo) {
		return qnaDAOMybatis.adminQnaAnswerUpdate(vo);
	}

	//사용자가 질문한 내용 상세보기, 관리자 메뉴의 상세보기
	@Override
	public QnaVO qnaOne(QnaVO vo) {
		return qnaDAOMybatis.qnaOne(vo);
	}



}
