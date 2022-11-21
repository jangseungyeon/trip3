package com.springbook.biz.planner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.springbook.biz.planner.AreaService;
import com.springbook.biz.planner.AreaVO;

@Component
public class AreaServiceImpl implements AreaService{
	
	@Autowired
	private PlaceDAOMybatis areaService;
	
	@Override
	public List<AreaVO> getAreaList() {
		return areaService.getAreaList();
	}

	@Override
	public AreaVO getArea(AreaVO vo) {
		return areaService.getArea(vo);
	}
	
	@Override
	public AreaVO getAreaNum(AreaVO vo) {
		return areaService.getAreaNum(vo);
	}

}
