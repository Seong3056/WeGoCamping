package com.camping.wego.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.PageVO;
import com.camping.wego.vo.UserVO;

public interface IUserMapper {

	// 회원가입
	void join(UserVO vo);

	// 회원정보 수정
	void update(UserVO vo);

	// 회원탈퇴
	void withdrawal(String userId);

	// 아이디 중복체크
	int idCheck(String userId);

	// 로그인
	String login(String userId);
	
	// 이름
	String getName(String userId);

	// 유저정보 가져오기
	UserVO info(String userId);

	// 내 게시글 목록
	List<BoardVO> myContentList(@Param("userId") String userId, @Param("paging") PageVO vo);

	// 내 게시글 개수
	int getMyTotal(@Param("userId") String userId, @Param("paging") PageVO vo);

}
