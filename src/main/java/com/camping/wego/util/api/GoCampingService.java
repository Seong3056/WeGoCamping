//package com.camping.wego.util.api;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Component;
//
//import com.camping.wego.vo.PageVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Component
//@Slf4j
//public class GoCampingService {
//
//	@Value("${GoCamping.serviceKey}")
//	private String serviceKey;
//
//	public String getBasedListUrl(PageVO paging) {
//
//		String condition = "/basedList";
//		String mobileOS = "ETC";
//		String mobileApp = "WeGoCamping";
//
//		String requestUrl = String.format("https://apis.data.go.kr/B551011/GoCamping%s?numOfRows=%d&pageNo=%d&MobileOS=%s&MobileApp=%s&serviceKey=%s&_type=json", paging.getCpp(), paging.getPageNum(), condition, mobileOS, mobileApp, serviceKey);
//
//		return requestUrl;
//	}
//
//}