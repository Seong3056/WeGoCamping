package com.camping.wego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/detail")
@Slf4j
public class DetailController {
	
	@GetMapping("")
	public String main() {
		return "/detail/detail";
	}
	
	@GetMapping("/{cno}")
	public String detail(@PathVariable int cno) {
		log.info("{}번 캠핑장", cno);
		return "detail/detail";
	}

}

