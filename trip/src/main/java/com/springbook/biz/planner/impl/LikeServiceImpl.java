package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.LikeService;
import com.springbook.biz.planner.LikeVO;

@Service("LikeService")
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDAOMybatis likeDAO;
	
	@Override
	public int likeinsert(LikeVO vo) {
		return likeDAO.likeinsert(vo);
	}

	@Override
	public void likeupdate(LikeVO vo) {
		likeDAO.likeupdate(vo);
	}

	@Override
	public void likedalete(LikeVO vo) {
		likeDAO.likedelete(vo);
	}
	
	@Override
	public List<LikeVO> likeslist(LikeVO lvo) {
		return likeDAO.likeslist(lvo);
	}
	

	@Override
	public List<LikeVO> likeslist2(LikeVO lvo) {
		return likeDAO.likeslist2(lvo);
	}

}
