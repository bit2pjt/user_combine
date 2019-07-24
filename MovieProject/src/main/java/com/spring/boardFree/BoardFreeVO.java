package com.spring.boardFree;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFreeVO {
	private int bf_bno;
	private int id;
	private String bf_category;
	private String bf_title;
	private Date bf_reg_date;
	private Date bf_update_date;
	private String bf_source;
	private String bf_content;
	private int bf_warn_counter;
	private int bf_view_counter;
	private String bf_deleteyn;
	private int bf_recommend;
	private int bf_decommend;
}
