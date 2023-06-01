package com.camping.wego.board.mapper;

import java.util.List;

import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.UserVO;

public interface IBoardMapper {
	//게시물 등록
		void insert(BoardVO vo); 
		
		//게시물 보기
		BoardVO detail(int bno);
		
		//게시물 수정
		void modify(BoardVO vo); 
		
		//게시물 삭제
		void delete(BoardVO vo); 
		
		//게시물 목록 요청
		List<BoardVO> list();
		
		//게시물 업데이트
		void update(BoardVO vo);
		
	
	
}
