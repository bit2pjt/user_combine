package com.spring.boardFree;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BFReplyVO {
	private int bfr_rno;
	private int bfr_bno;
	private int id;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date bfr_regdate;
	private int bfr_like;
	private int bfr_dislike;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date bfr_update;
	private int bfr_alert;
	private String bfr_content;
	private String bfr_block;
	private String nickname;
}
