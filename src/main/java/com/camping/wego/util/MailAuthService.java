package com.camping.wego.util;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MailAuthService {
	@Autowired
	private JavaMailSender mail;
	private int authNum;
	
	private int randomAuthNum() {
		Random r = new Random();
		int num = r.nextInt(899999) + 100000; //100000~999999
		log.info("인증번호: "+num);
		return num;
	}
	
	public String authMail(Map<String, String> user) {
		authNum = randomAuthNum();
		String email=  user.get("userEmail1") + user.get("userEmail2");
		log.info(email);
		String setFrom = "aktnf207@naver.com"; //email-config에 설정한 발신용 이메일 주소 입력.
		String toMail = email; //수신받을 이메일(가입하고자 하는 사람의 이메일)
		String title = "회원 가입 인증 이메일 입니다."; //이메일 제목
		String content = "WeGoCamping 회원가입을 환영합니다." +
				 "<br><br>" + 
				 user.get("userId")+"님의 인증 번호는 <strong>" + authNum + "</strong> 입니다." +
				 "<br>" +
				 "해당 인증 번호를 인증번호 확인란에 입력해주세요.";
		mailSend(setFrom, toMail, title, content); //주석비활성화시 실제로 메일 발송.
		return Integer.toString(authNum);
	}
	private void mailSend(String setFrom, String toMail, String title, String content) {
		
		try {			
			MimeMessage message = mail.createMimeMessage();			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true -> html 형식으로 전송, 값을 안주면 단순 텍스트로 전달.
			helper.setText(content, true);
			
			//메일 전송
			mail.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}
