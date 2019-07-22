package com.spring.mypage;

/**
* @Class Name : OneVO.java

* @Description : 1:1문의 데이터 - 1:1문의 테이블의 컬럼명과 동일하게 작성
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.18     한유진      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

import java.sql.Date;

import lombok.Data;
import lombok.ToString;

@Data
public class OneVO {


	private int qna_no;		//1:1 문의 글번호
	private int id;			//1:1 문의 작성자 멤버ID
	private String qna_category;	//1:1 문의 카테고리
	private String qna_title;	//1:1 문의 타이틀
	private String qna_content;	//1:1 문의 내용 
	private Date qna_date;	//1:1 문의 작성날짜
	private Date qna_update_date;	//1:1 문의 수정날짜
	private String qna_answer;	//1:1 문의 답변여부

	
	public String toString() {
		return "[" + qna_no + ", " + id + ", " + qna_category + ", " + qna_title + ", " + qna_content + ", " + qna_date + ", " + qna_update_date + ", " + qna_answer+ "]\n"; 
	}
}
