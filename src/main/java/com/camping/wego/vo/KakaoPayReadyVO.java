package com.camping.wego.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class KakaoPayReadyVO {
	private String tid, next_redirect_pc_url;
    private Date created_at;
}
