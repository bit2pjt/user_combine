package com.spring.mypage;

import java.util.Date;

import lombok.Data;

@Data
public class MyBoardDTO {
	private String bf_category;
	private String bf_title;
	private Date bf_reg_date;
	private String bs_category;
	private String bs_title;
	private Date bs_reg_date;
}
