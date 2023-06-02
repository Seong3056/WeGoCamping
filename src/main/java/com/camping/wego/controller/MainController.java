package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.PathVariable;

>>>>>>> f9394474b62d966753b522fefa5f261301a73fff

import com.camping.wego.campsite.service.ICampsiteService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	private ICampsiteService service;

	@GetMapping("")
	public String main(Model model) {
		log.info(service.getList().toString());
		log.info("info");
		model.addAttribute("campList", service.getList());
		return "/main/main";
	}

	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/info";
	}
<<<<<<< HEAD

=======
	
	@GetMapping("/rsv/{cno}")
	public String rsvPage(@PathVariable int cno, Model model) {
		model.addAttribute("camp",service.info(cno));
		return "/rrsv/rrsv";
	}
	@GetMapping("/rrsv/payment")
	public void paymentPage() {}

	
>>>>>>> f9394474b62d966753b522fefa5f261301a73fff
}
