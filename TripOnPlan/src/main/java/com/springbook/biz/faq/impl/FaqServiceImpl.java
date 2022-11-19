package com.springbook.biz.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.springbook.biz.faq.FaqService;
import com.springbook.biz.faq.FaqVO;

@Component("faqService")
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAOMybatis faqDAO;
	
	@Override
	public void insertFaq(FaqVO vo) {
		faqDAO.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		faqDAO.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		faqDAO.deleteFaq(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {
		return faqDAO.getFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo){
		return faqDAO.getFaqList(vo);
	}

	@Override
	public int totalFaqListCnt(FaqVO vo) {
		return faqDAO.totalFaqListCnt(vo);
	}

}
