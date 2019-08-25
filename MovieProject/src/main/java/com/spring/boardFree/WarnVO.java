package com.spring.boardFree;

import java.util.Date;

import lombok.Data;

@Data
public class WarnVO { // 신고 공통 VO
	private int bf_bno;
	private int bfr_rno;
	private int bsr_rno;
	private int bs_bno;
	private int id;
	private Date bf_date;
	private int mr_code;
	private String mr_warncontent;
	private int cr_code;
	private String bf_warncontent;
	private int mml_num;
	private int mml_reply_code;
	
}
