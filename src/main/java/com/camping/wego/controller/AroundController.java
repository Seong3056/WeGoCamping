package com.camping.wego.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


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
	public String main(@RequestParam String location, @RequestParam String theme, Model model) {
		
		log.info("------------------l: "+location);
		log.info("----------------------t: "+theme);
		if(location.equals("") && theme.equals(""))
		model.addAttribute("campList", service.getList());
		
		else 
		{
			Map<String, String> map = new HashMap<String, String>();
			map.put("location", location);
			map.put("theme", theme);
			model.addAttribute("campList", service.getList(map));
			model.addAttribute("location",location);
			model.addAttribute("theme",theme);
		}
		return "/around/around";

	}
	
	


}
