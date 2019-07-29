package com.spring.mypage;

import java.util.HashMap;

/**
* @Class Name : MyPageDAO.java
* @Description : 
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.17     한유진      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

public interface MyPageDAO {
	//멤버데이터 가져오기, 수정하기, 탈퇴요청하기
	public String getMemberName(String m_email);
	//1:1 문의내역 리스트 가져오기
	//1:1 문의 등록하기, 가져오기, 수정하기, 삭제하기
	
	public int checkPw(HashMap<String,String> map);
	// 비밀번호 체크
	
	public int delete_member(String m_email);
	//회원 탈퇴신청
	
	public int delete_date(String id);
}
