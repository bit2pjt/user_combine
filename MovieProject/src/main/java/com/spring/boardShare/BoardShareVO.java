package com.spring.boardShare;

import java.util.Date;

import lombok.Data;

@Data
public class BoardShareVO {
	private int bs_bno;
	private int id;
	private String bs_category;
	private String bs_content;
	private String bs_title;
	private Date bs_reg_date;
	private Date bs_update_date;
	private int bs_view_counter;
	private int bs_warn_counter;
	private String bs_deleteyn;
	private String nickname;
}
