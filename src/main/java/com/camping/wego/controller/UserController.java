package com.camping.wego.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.wego.user.service.IUserService;
import com.camping.wego.util.MailAuthService;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {

	@Autowired
	private IUserService service;
	@Autowired
	private MailAuthService mailService;

	@GetMapping("/login")
	public void loginPage() {}
	
	

	@PostMapping("/login")
	public void loginProcess(String userId, String userPw, Model model) {
		log.info("userId: {}",userId);
		log.info("userPw: {}",userPw);
		model.addAttribute("user", service.login(userId, userPw));
	}
	
	

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        return "redirect:/";
	}

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

	@ResponseBody
	@PostMapping("/authMail")
	public String authMail(@RequestBody Map<String, String> user) {
		log.info("메일 인증요청");
		return mailService.authMail(user);

	}
	@GetMapping("/myBoard")
	public void myboard() {}
	
	@GetMapping("/reservation")
	public void resv() {}
	
	@GetMapping("/info")
	public void info() {}
}
