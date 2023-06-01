package com.camping.wego.vo;
/*
CREATE TABLE board (
	bno	INT	NOT NULL PRIMARY KEY DEFAULT AUTO_INCREMENT,
	id	VARCHAR(50)	NOT NULL,
	title	VARCHAR(50)	NOT NULL,
	cls	INT	NOT NULL,
	reg_date	DATETIME	NULL	DEFAULT CURRENT_TIMESTAMP,
	content	VARCHAR(2000)	NULL
);
 */

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int bno;
	private String write;
	private String title;
	private String cls;
	private LocalDateTime regDate;
	private String content;
	private int hit;
}
