package com.spring.ticketing;

import java.util.List;

import lombok.Data;

@Data
public class ReturnContainerVO {

	private MovieDetailVO detail;
	private List<CineInfoVO> cineMeta;
	private OutterRateVO oRate;
}
