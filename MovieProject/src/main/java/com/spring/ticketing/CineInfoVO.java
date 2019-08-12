package com.spring.ticketing;

import java.util.List;

import lombok.Data;

@Data
public class CineInfoVO {
	private String t_id;
	private String cineName;		//Json은 NAME
	private String agc;
	private String aic;
	private String supplierType;
	private List<ScreenInfoVO> screenInfos;
}
