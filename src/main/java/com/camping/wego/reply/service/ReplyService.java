package com.camping.wego.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.reply.mapper.IReplyMapper;
import com.camping.wego.vo.PageVO;
import com.camping.wego.vo.ReplyVO;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(5);
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("bno", bno);
		data.put("pageStart", vo.getPageStart());
		data.put("cpp",vo.getCpp());
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}
