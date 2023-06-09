package com.camping.wego.campsite.service;

import java.util.List;
import java.util.Map;

import com.camping.wego.vo.CampsiteVO;
import com.camping.wego.vo.PageVO;

public interface ICampsiteService {

	// 캠핑장 데이터 집어넣기
	void readOpenStoresFromJson(int num);
	
	// 캠핑장 요금 입력
	void inputAmount();

	// 캠핑장 목록 불러오기
	List<CampsiteVO> getList();

	// 캠핑장 개수
	int getTotal();

	//캠핑장 정보
	CampsiteVO info(int cno);
	
	//캠핑장 주소 지역 따오기
	String[] addr(int cno);
	
	//캠핑장 주소(도) 리스트
	List<CampsiteVO> getList(Map<String,String> map);

	//캠핑장 주소 코드
	String addrCode(String addrName);

	

	List<CampsiteVO> getList(Map<String, String> map, PageVO vo);

	
	

	
	

}
