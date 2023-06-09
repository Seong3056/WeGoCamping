package com.camping.wego.campsite.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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

	//캠핑장 주소(도)리스트
	List<CampsiteVO> addrList(Map<String, String> map);
	
	//캠핑장 위치 코드(날씨)
	String addrCode(String addrName);

	List<CampsiteVO> selectSearch(Map<String, String> map);

	List<CampsiteVO> selectSearchPage(@Param("addr1") String addr1,@Param("addr2") String addr2, 
			@Param("theme") String theme,@Param("pageStart") int pageStart,@Param("cpp") int cpp);

	

	

}
