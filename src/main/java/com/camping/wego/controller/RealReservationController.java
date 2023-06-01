package com.camping.wego.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/rrsv")
@Slf4j
public class RealReservationController {

	
	@GetMapping("")
	public static String main(String[] args) {
		return "/rrsv/rrsv";
	}

}


