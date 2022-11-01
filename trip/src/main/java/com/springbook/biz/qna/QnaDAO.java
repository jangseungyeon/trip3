package com.springbook.biz.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<QnaVO> selectList() {
		return mybatis.selectList("QnaDAO.selectList");

	}

	public QnaVO selectOne(QnaVO vo) {
		return mybatis.selectOne("QnaDAo.selectOne",vo);
		
	}
	public int selectCnt() {
		return mybatis.selectOne("QnaDAO.selectOne");
	}
	public void updateOne(QnaVO vo) {
		mybatis.update("QnaDAO.updateOne", vo);
	}

	public void deleteOne(QnaVO vo) {
		mybatis.delete("QnaDAO.deleteOne", vo);
	}
	public void insertList(QnaVO vo) {
		mybatis.insert("QnaDAO.insertList", vo);
	}
	public void selectList(QnaVO vo) {
		mybatis.selectList("QnaDAO.selectList", vo);
	}

	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaDAO.insertQna", vo);
	}
}



