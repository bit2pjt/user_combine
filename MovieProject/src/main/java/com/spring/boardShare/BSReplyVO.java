package com.spring.boardShare;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BSReplyVO {
	private int bsr_rno;
	private int bs_bno;
	private int id;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date bsr_regdate;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date bsr_update;
	private int bsr_alert;
	private String bsr_content;
	private String bsr_block;
	private String nickname;
}
