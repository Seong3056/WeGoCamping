package com.camping.wego.util;

import org.springframework.stereotype.Service;

import com.camping.wego.campsite.mapper.ICampsiteMapper;
import com.camping.wego.vo.CampsiteVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WeatherService {
	
	private ICampsiteMapper mapper;
	
	public String WeatherInfo(String addrName) {
		CampsiteVO vo =  mapper.info(491);
		String addr = vo.getAddr();
		
		String ar[] = addr.split(" ");
		
		log.info(ar[1].substring( 0,
				(ar[1].indexOf("군")>0?ar[1].indexOf("군"):ar[1].indexOf("시"))
				));
		return addr;
	}
}
