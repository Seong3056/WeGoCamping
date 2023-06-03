package com.camping.wego.campsite.mapper;

import java.util.List;
import java.util.Map;

import com.camping.wego.vo.CampsiteVO;

public interface ICampsiteMapper {

	// 캠핑장 데이터 집어넣기
	void insert(CampsiteVO vo);
	
	// 캠핑장 요금 입력
	void inputAmount(Map<String, Integer> map);
	
	int getCount();

	// 캠핑장 목록 불러오기
	List<CampsiteVO> getList();

	// 캠핑장 개수
	int getTotal();
	
	//캠핑장 정보
	CampsiteVO info(int cno);

	

	

}
