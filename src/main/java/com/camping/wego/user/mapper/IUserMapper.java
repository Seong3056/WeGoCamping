package com.camping.wego.user.mapper;

import com.camping.wego.vo.UserVO;

public interface IUserMapper {

		//회원가입
		void join(UserVO vo);

		//회원정보 수정
		void update(UserVO vo);

		//회원탈퇴
		void delete(UserVO vo);

		//아이디 중복체크
		int idCheck(String userId);

		//로그인
		String login(String userId);


}
