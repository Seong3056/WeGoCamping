package com.camping.wego.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.wego.campsite.service.ICampsiteService;
import com.camping.wego.vo.CampsiteVO;
import com.camping.wego.vo.PageVO;

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
		
		log.info("------------------llll: "+location);
		log.info("----------------------t: "+theme);
		if(location.equals("") && theme.equals(""))
		model.addAttribute("campList", service.getList());
		
		else 
		{
			Map<String, String> map = new HashMap<>();
			map.put("location", location);
			map.put("theme", theme);
			model.addAttribute("campList", service.getList(map));
			model.addAttribute("location",location);
			model.addAttribute("theme",theme);
		}
		return "/around/around";

	}
	
	@GetMapping("/{page}")
	@ResponseBody
	public List<CampsiteVO> getList(@PathVariable int page, @RequestParam String location, @RequestParam String theme){
		
		PageVO vo = new PageVO();
		Map<String, String> map = new HashMap<>();
		log.info("------------------l: "+location);
		log.info("----------------------t: "+theme);
		vo.setPageNum(page);
		vo.setCpp(12);
		
		if(location.equals("") && theme.equals("")) {
			map.put("location", "");
			map.put("theme", "");
			
			return service.getList(map,vo);
		}
		map.put("location", location);
		map.put("theme", theme);
		
		
		log.info("----------------"+map.toString());
		
		return service.getList(map,vo);
	}
	
	


}
