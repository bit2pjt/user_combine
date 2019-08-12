package com.spring.movie;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MovieReplyVO {
	private int mr_code;
	private int id;
	private int mi_code;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date mr_write_date;
	private int mr_like;
	private int mr_dislike;
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date mr_update_date;
	private int mr_score;
	private String mr_content;
	private String mr_alert;
	private String nickname;
}
