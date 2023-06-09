package com.camping.wego.vo;
/*
CREATE TABLE payment (
	pay_num	INT	,
	id	VARCHAR(50)	,
	amount	INT	,
	pay_date	DATETIME	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	cno	INT	
);*/

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class PayVO {
	private String payNum;
	private String partnerUserId;
	private int amount;
	private Date payDate;
	private int cno;
	private int quantity;
	private String itemName;
	private String tid;
	private String tel;
	private String addr;
	private String daterange;
}
