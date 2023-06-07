package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.wego.board.service.IBoardService;
import com.camping.wego.util.PageCreator;
import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.PageVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {

	@Autowired
	private IBoardService service;

	//게시글 목록
	@GetMapping("/boardList")
	public void boardList(PageVO vo, Model model) {
		PageCreator pc = new PageCreator(vo, service.getTotal(vo));
		log.info("List 호출");
		log.info(vo.toString());
		model.addAttribute("boardList", service.list(vo));
		model.addAttribute("pc", pc);
	}

	//게시글 등록 페이지로 이동
	@GetMapping("/boardWrite")
	public void write() {}

	//게시글 등록 요청
	@PostMapping("/boardWrite")
	public String insert(BoardVO vo){
		log.info(vo.toString());
		service.insert(vo);
		return "redirect:/board/boardList";
	}
	
	//게시글 상세보기
	@GetMapping("/content/{bno}")
	public String detail(@PathVariable int bno, Model model) {
		model.addAttribute("vo", service.detail(bno));
		return "board/boardDetail";
	}

	//게시글 수정 페이지 이동
	@GetMapping("/boardModify/{bno}")
	public String modify(@PathVariable int bno,Model model) {
		model.addAttribute("vo",service.detail(bno));
		return "board/boardModify";
	}

	//게시글 수정 요청
	@PostMapping("/update")
	public String update(BoardVO vo) {
		service.update(vo);
		return "redirect:/board/content/" + vo.getBno();
	}

	//게시글 삭제
	@PostMapping("/delete")
	public String delete(int bno) {
		service.delete(bno);
		return "redirect:/board/boardList";
	}

}
