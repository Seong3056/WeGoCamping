package com.camping.wego.board.mapper;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.camping.wego.vo.BoardVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/config/db-config.xml"
})
public class BoardMapperTest {
	
	@Autowired
	private IBoardMapper mapper;
	
	@Test
	@DisplayName("게시판에 카테고리별 더미 글 넣기")
	void insertDummy() {
		
		for(int i=1; i<=4; i++) {
			for(int j=1; j<=300; j++ ) {
				BoardVO vo = new BoardVO();
				vo.setCls(i);
				vo.setWriter("park1234");
				vo.setTitle(i + "카테고리의 " + j + "번째 글");
				vo.setContent(i + "카테고리의 " + j + "번째 더미 글입니다.\n 더미더미");
				mapper.insert(vo);
			}
		}
	
	}

}
