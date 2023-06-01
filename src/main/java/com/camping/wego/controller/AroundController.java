package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.wego.campsite.service.ICampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/around")
@Slf4j
public class AroundController {
	
	@Autowired
	private ICampsiteService service;
	
	// 둘러보기 페이지로 이동 요청
	@GetMapping("")
	public String main(Model model) {
		model.addAttribute("campList", service.getList());
		return "/around/around";
		
	}

}
