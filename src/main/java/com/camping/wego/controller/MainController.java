package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import com.camping.wego.campsite.service.ICampsiteService;


@Controller
public class MainController {
	
	@Autowired
	private ICampsiteService campService;
	
	@GetMapping("")
	public String main() {
		return "/main/main";
	}
	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/info";
	}
	
	@GetMapping("/rsv/{cno}")
	public String rsvPage(@PathVariable int cno, Model model) {
		model.addAttribute("camp",campService.info(cno));
		return "/rrsv/rrsv";
	}
	@GetMapping("/rrsv/payment")
	public void paymentPage() {}

	
}
