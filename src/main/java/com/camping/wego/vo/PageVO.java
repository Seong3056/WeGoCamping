package com.camping.wego.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {

	private int pageNum;
	private int cpp;
	
	private String keyword;
	private String condition;

	public PageVO() {
		this.pageNum = 1;
		this.cpp = 10;
	}

	public int getPageStart() {
		return (pageNum - 1) * cpp;
	}

}
