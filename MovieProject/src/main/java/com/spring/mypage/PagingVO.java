package com.spring.mypage;

/**
* @Class Name : PagingVO.java

* @Description : 1:1문의 데이터 - 1:1문의 테이블의 컬럼명과 동일하게 작성
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.08.01     한유진      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/


import lombok.Data;

@Data
public class PagingVO {

	private int id;
	private int page;
	private int pageSize;


}
