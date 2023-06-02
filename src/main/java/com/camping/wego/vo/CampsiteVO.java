package com.camping.wego.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class CampsiteVO {

	private int cno;
	private String facltNm;
	private String lineIntro;
	private String intro;
	private String firstImageUrl;
	private String tel;
	private String induty;
	@JsonProperty("addr1")
	private String addr;
	private String homepage;
	private String mapX;
	private String mapY;

}
