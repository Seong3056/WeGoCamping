package com.camping.wego.campsite.mapper;

import java.util.List;

import com.camping.wego.vo.CampsiteVO;

public interface ICampsiteMapper {
	
	// 캠핑장 데이터 집어넣기
	void insert(CampsiteVO vo);
	
	// 캠핑장 목록 불러오기
	List<CampsiteVO> getList();
	
	// 캠핑장 개수
	int getTotal();
	
	CampsiteVO info(int cno);

}
