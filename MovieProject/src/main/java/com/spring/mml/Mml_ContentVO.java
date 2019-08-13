package com.spring.mml;

import java.util.Date;

import lombok.Data;

@Data
public class Mml_ContentVO {

	private int mml_num;			//�굹�쁺由ъ퐫�뱶
	private String mi_code;			//�쁺�솕肄붾뱶
	private int id;					//ID
	private int mml_view_count;		//議고쉶�닔
	private Date mml_write_date;	//�벑濡앹씪
	private Date mml_update_date;	//�닔�젙�씪
	private int mml_like;			//醫뗭븘�슂
	private String mml_title;		//�젣紐�
	private String mml_content;		//�궡�슜
	private String mml_poster;		//�굹�쁺由� �룷�뒪�꽣
	private int mml_warn_count;		//�굹�쁺由� �떊怨좎닔
	
	public String toString() {
		return mml_num+", ("+mi_code+"), "+id+", "+mml_view_count+", "+mml_write_date+", "+mml_update_date
				+", "+mml_like+", "+mml_title+", "+mml_content+", "+mml_poster+", "+mml_warn_count;
	}
}

