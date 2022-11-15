package com.springbook.biz.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.qna.QnaVO;
import com.springbook.biz.user.UserVO;

@Repository
public class QnaDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;

	// 사용자 질문한 내용들(리스트목록)
	//ServiceImpl의qnaDAOMybatis.myQnaList(vo)==myQnaList(QnaVO vo)이동
	public List<QnaVO> myQnaList(QnaVO vo) {
		// qna-mapping.xml파일의<mapper namespace="QnaDAO"==QnaDAO일치시킴.
		// qna-mapping.xml파일의<select id="myQnaList"==myQnaList일치시킴.
//mybatis.selectList("QnaDAO.myQnaList", vo)데이터베이스에서 데이터(값)가져옴.
		return mybatis.selectList("QnaDAO.myQnaList", vo);
	}

	// 사용자가 질문할 때 사용(추가하시)
	public int myQnaInsert(QnaVO vo) {
		return mybatis.insert("QnaDAO.myQnaInsert", vo);
	}

	// 사용자가 질문을 수정할 때 사용(업데이트)
	public int myQnaUpdate(QnaVO vo) {
		return mybatis.update("QnaDAO.myQnaUpdate", vo);
	}

	// 사용자가 질문을 삭제할 때 사용(딜리트)
	public int myQnaDelete(QnaVO vo) {
		return mybatis.delete("QnaDAO.myQnaDelete", vo);
	}

	// 사용자 정보를 가져올때(myUserOne)
	public UserVO myUserOne(UserVO vo) {
		return mybatis.selectOne("QnaDAO.myUserOne", vo);
	}

	// 관리자 페이지 전체 리스트(adminQnaAllList)
	public List<QnaVO> adminQnaAllList() {
		return mybatis.selectList("QnaDAO.adminQnaAllList");
	}

	// 관리자 페이지 답변 완료 리스트(adminQnaAnswerList)
	public List<QnaVO> adminQnaAnswerList() {
		return mybatis.selectList("QnaDAO.adminQnaAnswerList");
	}

	// 관리자 페이지 미답변 리스트(adminQnaNoAnswerList)
	public List<QnaVO> adminQnaNoAnswerList() {
		return mybatis.selectList("QnaDAO.adminQnaNoAnswerList");
	}

	// 사용자가 질문한 내용 상세보기, 관리자 메뉴의 상세보기
	public QnaVO qnaOne(QnaVO vo) {
		return mybatis.selectOne("QnaDAO.qnaOne", vo);
	}

	// 관리자 답글할떄
	public int adminQnaAnswerUpdate(QnaVO vo) {
		return mybatis.update("QnaDAO.adminQnaAnswerUpdate", vo);
	}
}
