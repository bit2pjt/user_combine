package com.spring.mml;

import java.util.Date;

import lombok.Data;

@Data
public class Mml_ContentVO {

	private int mml_num;			//나영리코드
	private String mi_code;			//영화코드
	private int id;					//ID
	private int mml_view_count;		//조회수
	private Date mml_write_date;	//등록일
	private Date mml_update_date;	//수정일
	private int mml_like;			//좋아요
	private String mml_title;		//제목
	private String mml_content;		//내용
	private String mml_poster;		//나영리 포스터
	private int mml_warn_count;		//나영리 신고수
	
	public String toString() {
		return mml_num+", ("+mi_code+"), "+id+", "+mml_view_count+", "+mml_write_date+", "+mml_update_date
				+", "+mml_like+", "+mml_title+", "+mml_content+", "+mml_poster+", "+mml_warn_count;
	}
}

