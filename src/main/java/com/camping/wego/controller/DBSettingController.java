package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.wego.campsite.service.ICampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/db")
public class DBSettingController {
	
	@Autowired
	private ICampsiteService service;
	
	@GetMapping("/main")
	public String dbset() {
		return "db/dbSettings";
	}
	
	@PostMapping("/set/{num}")
	public String dbset(@PathVariable int num, RedirectAttributes ra) {
		service.readOpenStoresFromJson(num);
		log.info("{}번째 Json 파일 DB에 입력됨!", num);
		ra.addFlashAttribute("num", num);
		
		return "redirect:/db/main";
	}
	
}
