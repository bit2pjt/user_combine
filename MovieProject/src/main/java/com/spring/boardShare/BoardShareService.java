package com.spring.boardShare;

import java.util.List;

import com.spring.boardFree.BoardFreeVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.paging.SearchCriteria;

interface BoardShareService {
	  
	List<BoardShareVO> listSearch(SearchCriteria searchCriteria);

	int countSearchedArticles(SearchCriteria searchCriteria);
		
	String getMemberNickname(String m_email);	//멤버 닉네임 가져오기
	MemberVO getMember(int id);
	int getMemberId(String m_email);		//멤버 아이디 가져오기
	
	// 나눔게시판 등록 / 수정
	int insertBoardShare(BoardShareVO shareVO);	 // 나눔게시판 등록
	int updateBoardShare(BoardShareVO shareVO);	// 나눔게시판 수정
	BoardShareVO selectBoardShare(int bs_bno);	// 나눔게시판 상세정보 가져오기
	
	BoardShareVO getContent(int page);
	
	MemberVO getWriter(int id);

	int getUser(String email);
	
	String warn_check(WarnVO vo);
	
	int insertWarn(WarnVO vo);
	
	String ReplyWarn(WarnVO vo);
	
	int insertReplyWarn(WarnVO vo);
}
