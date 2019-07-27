package com.spring.boardFree;

import java.util.Date;

import lombok.Data;


@Data
public class BoardFreeReplyVO {
	//board_free_reply 테이블;
	private int bfr_rno;
	private int bfr_bno;
	private int id;
	private Date bfr_regdate;
	private int bfr_like;
	private int bfr_dislike;
	private Date bfr_update;
	private int bfr_alert;
	private String bfr_content;
	private String bfr_block;
	


	
}
