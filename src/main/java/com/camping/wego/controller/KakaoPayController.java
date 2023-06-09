package com.camping.wego.controller;


import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.camping.wego.util.KakaoPay;

import com.camping.wego.vo.PayVO;

@Controller
@Slf4j
public class KakaoPayController {
	
	
	@Autowired
    private KakaoPay kakaopay;
	

    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {}
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(PayVO vo) {
    	log.info(vo.toString());
        log.info("kakaoPay post............................................");        
        return "redirect:" + kakaopay.kakaoPayReady(vo);

         
    }
    
    @GetMapping("/kakaoPaySuccess/")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, 
    		Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);    

        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "/rrsv/payment";
        
    }
}
