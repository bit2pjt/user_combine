package com.spring.cine;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class CineReplyVO {
	private int cr_code;
	private int id;
	private int cc_code;
	private String cr_content;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date cr_write_date;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date cr_update_date;
	private int cr_score;
	private int cr_like;
	private int cr_dislike;
	private String cr_alert;
	private String nickname;
}
