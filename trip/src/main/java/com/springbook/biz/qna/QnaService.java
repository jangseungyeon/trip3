package com.springbook.biz.qna;

import java.util.List;

public interface QnaService {
	public List<QnaVO> selectList();
	
	public QnaVO selectOne(QnaVO vo); 
	
	public int selectCnt(); 
	
	public void updateOne(QnaVO vo) ;

	public void deleteOne(QnaVO vo) ;
	
	public void insertList(QnaVO vo);
		
	public void selectList(QnaVO vo);
		
	public void insertQna(QnaVO vo);

	public Object getQna(String qnavo);

	public Object getQnaList(QnaVO bvo, String keyword, String condition);
		
}
