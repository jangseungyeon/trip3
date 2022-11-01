package com.springbook.biz.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaDAO qnaDAO;

	@Override
	public List<QnaVO> selectList() {
		return qnaDAO.selectList();
	}

	@Override
	public QnaVO selectOne(QnaVO vo) {
		return qnaDAO.selectOne(vo);
	}

	@Override
	public int selectCnt() {
		return qnaDAO.selectCnt();
	}

	@Override
	public void updateOne(QnaVO vo) {
		qnaDAO.updateOne(vo);
	}

	@Override
	public void deleteOne(QnaVO vo) {
	qnaDAO.deleteOne(vo);	
	}

	@Override
	public void insertList(QnaVO vo) {
		qnaDAO.insertList(vo);
	}

	@Override
	public void selectList(QnaVO vo) {
		qnaDAO.selectList(vo);
	}

	@Override
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);
	}

	@Override
	public Object getQna(String qnavo) {
		
		return null;
	}

	@Override
	public Object getQnaList(QnaVO bvo, String keyword, String condition) {
		return null;
	}
	

}
