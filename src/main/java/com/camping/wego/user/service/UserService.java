package com.camping.wego.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.user.mapper.IUserMapper;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public void join(UserVO vo) {
		// TODO Auto-generated method stub

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

}
