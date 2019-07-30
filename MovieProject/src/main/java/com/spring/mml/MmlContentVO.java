package com.spring.mml;

import java.util.Date;

import lombok.Data;

@Data
public class MmlContentVO {
	private int mml_num;
	private int mml_view_count;
	private Date mml_write_date;
	private Date mml_update_date;
	private int mml_like;
	private String mml_title;
	private String mml_content;
	private int mi_code;
	private int mml_warn_count;
	private int id;
}
