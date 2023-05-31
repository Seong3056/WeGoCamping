package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.wego.board.service.IBoardService;
import com.camping.wego.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	
	@Autowired
	private IBoardService service;
	
	//게시글 목록 
	@GetMapping("/boardList")
	public void main(Model model) {
		model.addAttribute("boardList", service.list());
	}
	
	//게시글 등록
	@GetMapping("/boardWrite")
	public void write() {}
	
	@PostMapping("/boardWrite")
	public String insert(BoardVO vo){
		log.info(vo.toString());
		
		service.insert(vo);
		return "redirect:/board/boardList";
	}
	@GetMapping("/content/{bno}")
	public String detail(@PathVariable int bno, Model model) {		
		model.addAttribute("vo",service.detail(bno));
		return "board/boardDetail";
	}
	@GetMapping("/board/{bno}")
	public void view (@PathVariable int bno) {
		
	}
	
}
