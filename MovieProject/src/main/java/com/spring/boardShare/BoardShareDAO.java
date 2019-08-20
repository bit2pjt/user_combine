package com.spring.boardShare;

import java.util.List;

import com.spring.boardFree.BoardFreeVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.paging.SearchCriteria;

public interface BoardShareDAO {
	
	List<BoardShareVO> listSearch(SearchCriteria searchCriteria);

    int countSearchedArticles(SearchCriteria searchCriteria);
    
	BoardShareVO getContent(int page);
	
	String getMemberNickname(String m_email);	//멤버 닉네임 가져오기
	
	MemberVO getMember(int id);
	
	int getMemberId(String m_email);		//멤버 아이디 가져오기
	
	// 나눔게시판 등록 / 수정
	int insertBoardShare(BoardShareVO shareVO);	 // 나눔게시판 등록
	
	int updateBoardShare(BoardShareVO shareVO);	// 나눔게시판 수정
	
	BoardShareVO selectBoardShare(int bs_bno);	// 나눔게시판 상세정보 가져오기
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	WarnVO warn_check(int id);
	
	void WarnCount(int bno);
	
	int insertWarn(WarnVO vo);
	
	WarnVO ReplyWarn(WarnVO vo);
	
	int insertReplyWarn(WarnVO vo);
	
	void ReplyWarnCount(int rno);
}
