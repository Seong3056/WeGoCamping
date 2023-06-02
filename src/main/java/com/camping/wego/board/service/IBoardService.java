package com.camping.wego.board.service;

import java.util.List;

import com.camping.wego.vo.BoardVO;

public interface IBoardService {

	//게시물 등록
	void insert(BoardVO vo);

	//게시물 보기
	BoardVO detail(int bno);

	//게시물 수정
	void modify(BoardVO vo);

	//게시물 삭제
	void delete(int bno);

	//게시물 목록 요청
	List<BoardVO> list();

	//게시물 업데이트
	void update(BoardVO vo);

	//말머리 게시물 갯수
	List<BoardVO> clsList(String cls);



}
