package com.spring.mml;

import java.util.Date;

import lombok.Data;

@Data
public class Mml_WarningVO {
	private int mml_num;		//신고대상 나영리 코드번호
	private int id;				//신고자
	private Date mml_date;		//신고일자
}