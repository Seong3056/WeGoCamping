package com.camping.wego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/around")
@Slf4j
public class AroundController {
	
	// 둘러보기 페이지로 이동 요청
	@GetMapping("/around")
	public void main() {
		// 고캠핑 API 요청 URL
		
	}

}
