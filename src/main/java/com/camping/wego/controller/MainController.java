package com.camping.wego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@GetMapping("")
	public String main() {
		return "/main/main";
	}
	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/info";
	}
	
	

	
}
