package com.camping.wego.campsite.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.camping.wego.vo.CampsiteVO;

public interface ICampsiteMapper {
	
	// 캠핑장 데이터 집어넣기
	void insert(CampsiteVO vo);

}
