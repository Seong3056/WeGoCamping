package com.camping.wego.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.info("List호출");
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
	
	@GetMapping("/boardModify/{bno}")
	public String modify(@PathVariable int bno,Model model) {
		model.addAttribute("vo",service.detail(bno));
		return "board/boardModify";
	}
	
	@PostMapping("/update")
	public String update(BoardVO vo) {
		service.update(vo);
		return "redirect:/board/content/" + vo.getBno();
	}
	
	@GetMapping("/cls/{cls}")
	@ResponseBody
	public List<BoardVO> clsLength(@PathVariable String cls) {
		log.info("cls 서비스 호출");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("clsNo", Integer.parseInt(cls));
//		map.put("clsLength", 3);
		
		
		return service.clsList(cls); 
	}
	
	@PostMapping("/delete")
	public String delete(int bno) {
		service.delete(bno);
		return "redirect:/board/boardList";
	}


}
