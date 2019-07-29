package com.spring.mypage;
/**
* @Class Name : OneAdVO.java

* @Description : 1:1문의 답변 데이터 - 1:1문의 답변 테이블의 컬럼명과 동일하게 작성
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.22     박현민      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
import java.sql.Date;

import lombok.Data;

@Data
public class OneAdVO {
	
	private int aqna_no;		//1:1 문의 답변 글번호
	private int qna_no;		//1:1 문의 글번호
	private String aqna_content;	//1:1답변 문의 내용 
	private Date aqna_date;	//1:1 문의답변 작성날짜
	private Date aqna_update_date;	//1:1 문의답변 수정날짜
	private int admin_num;	//1:1 문의 담당자

}
