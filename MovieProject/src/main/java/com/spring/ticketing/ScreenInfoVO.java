package com.spring.ticketing;

import java.util.List;

import lombok.Data;

@Data
public class ScreenInfoVO {
	private String code;
	private String screenName;
	private String playTypeName;
	private List<ShowInfoVO> scheduleInfos;
}
