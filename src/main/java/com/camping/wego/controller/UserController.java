package com.camping.wego.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String loginProcess(@Param("userId") String userId, @Param("userPw") String userPw,
			HttpServletRequest request, HttpServletResponse response) {
		log.info("userId: {}",userId);
		log.info("userPw: {}",userPw);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("user", service.login(userId, userPw));
		log.info("컨트롤러내 모델에 담긴 정보"+session.toString());
		if(session.getAttribute("user") == null) return "redirect:/user/login";
		
		else {
			Cookie c = new Cookie("loginExpired", userId);
			c.setMaxAge(60);
			c.setPath("localhost");
			response.addCookie(c);
			return "/main/main";
		}
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
}
