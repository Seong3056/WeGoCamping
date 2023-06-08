package com.camping.wego.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.camping.wego.user.mapper.IUserMapper;
import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.PageVO;
import com.camping.wego.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Override
	public void join(UserVO vo) {
		String pwEncry = encoder.encode(vo.getUserPw());
		vo.setUserPw(pwEncry);
		mapper.join(vo);
	}

	@Override
	public void update(UserVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean withdrawal(UserVO vo) {

		String dbPw = mapper.login(vo.getUserId());

		log.info(dbPw);

//		log.info(encoder.matches(dbPw, vo.getUserPw())?"true":"false");
		log.info(vo.getUserPw());
		if (encoder.matches(vo.getUserPw(), dbPw)) {
			mapper.withdrawal(vo.getUserId());
			log.info("비밀번호가 일치한당계");
			return true;
		} else
			return false;

	}

	@Override
	public String idCheck(String userId) {
		log.info("service의 idCheck 요청");

		int result = mapper.idCheck(userId);

		log.info("result: {}", result);
		if (result == 1)
			return "duplicated";
		else
			return "able";
	}

	@Override
	public String login(String userId, String userPw) {
		log.info("서비스의 로그인 호출");
		String dbPw = mapper.login(userId);

		if (dbPw != null) {
			// 날 것의 비밀번호와 암호화된 비밀번호의 일치 여부를 알려주는 matches()
			if (encoder.matches(userPw, dbPw)) {
				return userId;
			}
		}
		return null;
	}
	
	@Override
	public String getName(String userId) {
		return mapper.getName(userId);
	}

	@Override
	public List<BoardVO> myContentList(String userId, PageVO vo) {
		return mapper.myContentList(userId, vo);
	}

	@Override
	public int getMyTotal(String userId, PageVO vo) {
		return mapper.getMyTotal(userId, vo);
	}

}
