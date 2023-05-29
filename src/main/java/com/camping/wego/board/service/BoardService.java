package com.camping.wego.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.board.mapper.IBoardMapper;
import com.camping.wego.vo.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modify(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

}
