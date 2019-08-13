package com.spring.warningCombine;

import java.util.Date;

import lombok.Data;

@Data
public class WarningCombineVO {

	private int boardCode;
	private String tableName;
	private int contentNum;
	private int warner;
	private Date warn_date;
	
}
