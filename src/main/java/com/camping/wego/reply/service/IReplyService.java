package com.camping.wego.reply.service;

import java.util.List;
import java.util.Map;

import com.camping.wego.vo.ReplyVO;

public interface IReplyService {
	
	void replyRegist(ReplyVO vo); // 댓글 등록
	List<ReplyVO> getList(int bno, int pageNum); // 목록 요청
	int getTotal(int bno); // 댓글 개수
	void update(ReplyVO vo); // 댓글 수정
	void delete(int rno); // 댓글 삭제

}
