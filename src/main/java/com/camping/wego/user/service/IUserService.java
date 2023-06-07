package com.camping.wego.user.service;





import java.util.List;

import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.PageVO;
import com.camping.wego.vo.UserVO;


public interface IUserService {

	//회원가입
	void join(UserVO vo);

	//회원정보 수정
	void update(UserVO vo);

	//회원탈퇴
	boolean withdrawal(UserVO vo);

	//아이디 중복체크
	String idCheck(String userId);

	//로그인
	String login(String userId, String userPw);
	
	//내 게시글 목록
	List<BoardVO> myContentList(String userId, PageVO vo);

}
