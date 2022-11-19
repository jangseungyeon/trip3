package com.springbook.biz.planner;

import java.util.List;

public interface AreaService {
	
	List<AreaVO> getAreaList();
	
	AreaVO getArea(AreaVO vo);
	
	public AreaVO getAreaNum(AreaVO vo);
}
