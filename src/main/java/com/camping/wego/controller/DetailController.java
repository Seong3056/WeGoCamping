package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.wego.campsite.service.ICampsiteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/detail")
@Slf4j
public class DetailController {

	@Autowired
	private ICampsiteService service;

	@GetMapping("")
	public String main() {
		return "/detail/detail";
	}

	@GetMapping("/{cno}")
	public String detail(@PathVariable int cno, Model model) {
		log.info(cno+"의 상세보기 페이지 이동");
		model.addAttribute("camp",service.info(cno));
		return "/detail/detail";
	}

}

