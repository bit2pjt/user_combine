package com.spring.mypage;

import java.util.Date;

import lombok.Data;

@Data
public class MyBoardDTO {
	private int id;
	private String bno;
	private String category;
	private String title;
	private Date reg_date;
	private int gubun;
}
