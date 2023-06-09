package com.camping.wego.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.camping.wego.reply.service.IReplyService;
import com.camping.wego.vo.ReplyVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/reply")
@Slf4j
public class ReplyController {

	@Autowired
	private IReplyService service;

	// 댓글 등록 요청
	@PostMapping("/regist")
	public String replyRegist(@RequestBody ReplyVO vo) {
		service.replyRegist(vo);
		log.info(vo.getUserId());
		return "replyRegSuccess";
	}

	// 목록 요청
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int bno, @PathVariable int pageNum) {

		List<ReplyVO> list = service.getList(bno, pageNum);
		int total = service.getTotal(bno);

		Map<String, Object> map = new HashMap<>();
		map.put("list", list); // 댓글 목록
		map.put("total", total); // 게시글에 달려있는 댓글의 총 개수

		return map;
	}

	// 댓글 수정 요청
	@PutMapping("/{rno}")
	public String update(@PathVariable int rno, @RequestBody ReplyVO vo) {
		vo.setRno(rno);
		service.update(vo);
		return "updateSuccess";
	}

	// 댓글 삭제 요청
	@DeleteMapping("/{rno}")
	public String delete(@PathVariable int rno) {
		service.delete(rno);
		return "deleteSuccess";
	}

}
