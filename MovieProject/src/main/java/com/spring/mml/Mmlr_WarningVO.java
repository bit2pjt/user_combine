package com.spring.mml;

import java.util.Date;

import lombok.Data;

@Data
public class Mmlr_WarningVO {

	private int mml_num;	//나영리 코드
	private int number;		//신고자 계정코드	
	private Date mml_date;	//신고일자		
}
