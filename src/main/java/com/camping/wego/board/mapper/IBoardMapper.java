package com.camping.wego.board.mapper;

import com.camping.wego.vo.BoardVO;

public interface IBoardMapper {
	//게시물 등록
		void insert(BoardVO vo); 
		
		//게시물 수정
		void modify(BoardVO vo); 
		
		//게시물 삭제
		void delete(BoardVO vo); 
}
