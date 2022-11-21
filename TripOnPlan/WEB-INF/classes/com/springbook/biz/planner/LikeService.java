package com.springbook.biz.planner;

import java.util.List;

public interface LikeService {
	
	int likeinsert(LikeVO vo);
	
	void likeupdate(LikeVO vo);
	
	void likedalete(LikeVO vo);
	
	int likeSelect(LikeVO vo);

	void likeinsertRoom(LikeVO vo);
	
	void likeupdateRoom(LikeVO vo);
	
	void likedeleteRoom(LikeVO vo);
	
	LikeVO likeselectRoom(LikeVO vo);
	
	//좋아요 리스트로 불러오기(호텔)
	List<LikeVO> likeslist(LikeVO lvo);
	
	//좋아요 리스트로 불러오기(플래너)
	List<LikeVO> likeslist2(LikeVO lvo);
}
