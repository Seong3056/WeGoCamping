package com.camping.wego.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.camping.wego.user.mapper.IUserMapper;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder endcoder;
	
	@Override
	public void join(UserVO vo) {
		String pwEncry = endcoder.encode(vo.getUserPw());
		vo.setUserPw(pwEncry);
		mapper.join(vo);
		}

	@Override
	public void update(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String userId) {
		

	}
	
	@Override
	public String idCheck(String userId) {
		log.info("service의 idCheck 요청");
		
		int result = mapper.idCheck(userId);
		
		log.info("result: {}",result);
		if(result == 1) return "duplicated";
		else return "able";
	}
	
	@Override
	public UserVO login(String userId, String userPw) {
		log.info("서비스의 로그인 호출");
		Map<String, String> user = new HashMap<>();
		
		user.put("userId", userId);
		user.put("userPw", userPw);
		
		
		UserVO vo = mapper.login(user);		
		return vo;
				
	}
	
	

}
