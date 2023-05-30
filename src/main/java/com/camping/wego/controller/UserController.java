package com.camping.wego.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.wego.user.service.IUserService;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@GetMapping("/join")
	public void joinPage() {}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		
		log.info("userController의 idCheck 요청");
		log.info("페이지에서 넘어온 값:{}",userId);
		String result = service.idCheck(userId); //중복이면 duplicated 중복이아니면 able
		log.info(result);
		return result;
		
		
	}
	
	@PostMapping("/join")
	public String join(UserVO vo) {
		log.info("회원가입 요청이 들어옴: POST");
		log.info(vo.toString());
		service.join(vo);
		return "board/boardList";
	}
}
