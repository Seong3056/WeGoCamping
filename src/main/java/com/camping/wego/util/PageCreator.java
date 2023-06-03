package com.camping.wego.util;

import com.camping.wego.vo.PageVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PageCreator {
	
	private PageVO paging;
	private int contentTotalCount, endPage, beginPage;
	private boolean prev, next;
	
	private final int buttonNum = 5;
	
	public PageCreator(PageVO paging, int contentTotalCount) {
		this.paging = paging;
		this.contentTotalCount = contentTotalCount;
		calcDataOfPage();
	}
	
	private void calcDataOfPage() {
		
		endPage = (int) Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum;
		
		beginPage = endPage - buttonNum + 1;
		
		prev = (beginPage == 1) ? false : true;
		
		next = contentTotalCount <= (endPage * paging.getCpp()) ? false : true;
		
		if(!next) {
			endPage = (int) Math.ceil(contentTotalCount / (double) paging.getCpp());
		}
		
	}

}
