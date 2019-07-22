package com.spring.mypage;

import java.util.List;

import com.spring.member.MemberVO;

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

	public MemberVO getMember(int id);
	void updateMember(MemberVO memberVO);
	void updatePw(MemberVO memberVO);
	void updateNick(MemberVO memberVO);
	int checkNick(String m_nickname);
	//멤버데이터 가져오기, 수정하기, 탈퇴요청하기
	public String getMemberName(String m_email);	//멤버 이름 가져오기
	public int getMemberId(String m_email);		//멤버 아이디 가져오기
	public String getMemberNickname(String m_email);	//멤버 닉네임 가져오기
	
	//1:1 문의내역 리스트 가져오기
	public List<OneVO> getQnaList(int id);	//1:1문의 리스트 가져오기
	
	//1:1 문의 등록하기, 가져오기, 수정하기, 삭제하기
	public int insertQna(OneVO oneVO);	//1:1 문의 등록
	public OneVO getQnaDetail(int qna_no);	//1:1 문의 상세정보 가져오기
	public int updateQna(OneVO oneVO);	//1:1 문의 상세정보 수정하기

}
