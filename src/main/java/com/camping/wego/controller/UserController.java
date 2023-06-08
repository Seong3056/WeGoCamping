package com.camping.wego.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.wego.campsite.service.ICampsiteService;
import com.camping.wego.pay.service.IPaymentService;
import com.camping.wego.user.service.IUserService;
import com.camping.wego.util.MailAuthService;
import com.camping.wego.util.PageCreator;
import com.camping.wego.vo.PageVO;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {

	@Autowired
	private IUserService service;
	@Autowired
	private IPaymentService payService;
	@Autowired
	private MailAuthService mailService;

	// 로그인 페이지 이동
	@GetMapping("/login")
	public void login () {}
	
	// 로그인 요청
	@PostMapping("/login")
	public void loginProcess(String userId, String userPw, Model model) {
		log.info("userId: {}", userId);
		log.info("userPw: {}", userPw);
		model.addAttribute("user", service.login(userId, userPw));
		model.addAttribute("name", service.getName(userId));
	}
	
	// 로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response,
				SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/";
	}

	// 가입 페이지 이동
	@GetMapping("/join")
	public void joinPage() {}

	// id 중복 확인
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		log.info("userController의 idCheck 요청");
		log.info("페이지에서 넘어온 값:{}", userId);
		String result = service.idCheck(userId); // 중복이면 duplicated 중복이아니면 able
		log.info(result);
		return result;
	}

	// 회원 가입 요청
	@PostMapping("/join")
	public String join(UserVO vo) {
		log.info("회원가입 요청이 들어옴: POST");
		log.info(vo.toString());
		service.join(vo);
		return "board/boardList";
	}

	// 이메일 인증 요청
	@ResponseBody
	@PostMapping("/authMail")
	public String authMail(@RequestBody Map<String, String> user) {
		log.info("메일 인증요청");
		return mailService.authMail(user);
	}

	// 회원 탈퇴
	@PostMapping("/withdrawal")
	@ResponseBody
	public String withdrawal(@RequestBody UserVO vo, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("삭제 요청");
		if (service.withdrawal(vo)) {
			new SecurityContextLogoutHandler().logout(request, response,
					SecurityContextHolder.getContext().getAuthentication());
			return "true";
		} else {
			log.info("탈퇴 실패");
			return "false";
		}
	}

	// 내 게시글 보기
	@PostMapping("/myBoard")
	public void myboard(String userId, PageVO vo, Model model) {
		PageCreator pc = new PageCreator(vo, service.getMyTotal(userId, vo));
		log.info("마이페이지 게시글 목록 : {}", service.myContentList(userId, vo).toString());
		log.info(pc.toString());
		model.addAttribute("list", service.myContentList(userId, vo));
		model.addAttribute("pc", pc);
	}

	// 내 예약내역
	@PostMapping("/reservation")
	public void resv(Model model, HttpSession session) {
		
		log.info(session.getAttribute("login").toString());
		String userId = session.getAttribute("login").toString();
		model.addAttribute("payList",payService.getList(userId));
		
	}

	// 마이페이지 이동 (회원정보 수정탭이 기본 페이지)
	@GetMapping("/info")
	public void info(HttpSession session, Model model) {
		log.info(service.info((String) session.getAttribute("login")).toString());
		model.addAttribute("info", service.info((String) session.getAttribute("login")));
	}
	
	// 회원정보 수정 요청
	@PostMapping("/update")
	public String update(UserVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/user/info";
	}

}
