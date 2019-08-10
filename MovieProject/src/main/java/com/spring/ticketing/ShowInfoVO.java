package com.spring.ticketing;

import lombok.Data;

@Data
public class ShowInfoVO {

	private int seq;
	private int playSeq;
	private String playDate;
	private String playNo;
	private String playStartTime;
	private String playEndTime;
}
