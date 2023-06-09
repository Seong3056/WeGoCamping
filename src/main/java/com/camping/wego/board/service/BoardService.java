package com.camping.wego.board.service;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchUpdateUtils;
import org.springframework.stereotype.Service;

import com.camping.wego.board.mapper.IBoardMapper;
import com.camping.wego.vo.BoardVO;
import com.camping.wego.vo.PageVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;

	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
	}

	@Override
	public BoardVO detail(int bno) {
		BoardVO vo = new BoardVO();
		vo = mapper.detail(bno);
		int hit = vo.getHit();
		hit ++;
		vo.setHit(hit);
		mapper.update(vo);
		return mapper.detail(bno);
	}

	@Override
	public List<BoardVO> list(PageVO vo){
		return mapper.list(vo);
	}
	
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public void modify(BoardVO vo) {
		mapper.modify(vo);

	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
	}
	@Override
	public void insertDummy() {
		BoardVO vo = new BoardVO();
		Random r = new Random();
		String cls = "";
		String title = " 제목";
		String content = "따뜻한 청춘의 풀이 천고에 아름다우냐? 발휘하기 충분히 봄날의 있는 위하여 황금시대를 사막이다.\r\n"
				+ "\r\n"
				+ "이 낙원을 심장은 있으며, 만천하의 공자는 이것이다. 간에 것은 앞이 이는 심장은 부패뿐이다. "
				+ "\r\n"
				+ "봄바람을 넣는 사람은 귀는 같은 그들의 이성은 봄바람이다. "
				+ "같이, 과실이 생생하며, 뛰노는 트고, 내는 노래하며 따뜻한 소담스러운 봄바람이다.\r\n"
				+ "\r\n"
				+ "생의 못할 가슴이 보이는 끝에 뿐이다. 구할 피고, 산야에 이성은 영원히 교향악이다. "
				+ "얼음에 귀는 얼마나 석가는 따뜻한 이것이야말로 어디 말이다.";
		String writer = "testUserId";
		Calendar cal = Calendar.getInstance();
		cal.set(2023, 1,13);
		
		int hit = 0;
		
		for(int i = 0;i<200;i++) {
			int a = r.nextInt(4)+1;
			hit = r.nextInt(3000)+1;
			log.info(String.valueOf(hit));
			int wr = r.nextInt(1000)+1;
			cal.add(Calendar.DAY_OF_MONTH, r.nextInt(2));
			LocalDateTime date = LocalDateTime.ofInstant(cal.toInstant(), cal.getTimeZone().toZoneId());
			switch (a) {
			
			case 1:
				cls="캠핑후기";
				break;
			case 2:
				cls="꿀팁공유";
				break;
			case 3:
				cls="메이트찾기";
				break;
			case 4:
				cls="건의사항";
				break;
			
			}
			StringBuilder sbWriter = new StringBuilder();
			StringBuilder sbContent = new StringBuilder();
			StringBuilder sbTitle = new StringBuilder();
			sbWriter.append(writer);
			sbWriter.append(wr);
			
			sbContent.append(cls);
			sbContent.append(content);
			
			sbTitle.append(cls);
			sbTitle.append(title);
			sbTitle.append(i);
			
			vo.setWriter(sbWriter.toString());
			vo.setCls(a);			
			vo.setContent(sbContent.toString());
			vo.setTitle(sbTitle.toString());
			vo.setRegDate(date);
			vo.setHit(hit);
			
			mapper.insertHit(vo);
		}
	}
}
