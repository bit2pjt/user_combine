package com.spring.boardFree;

import java.util.List;

import com.spring.member.MemberVO;
import com.spring.paging.Criteria;
import com.spring.paging.SearchCriteria;

public interface BoardFreeService {


	List<BoardFreeVO> boardListDaily();
	List<BoardFreeVO> boardListWeekly();
	List<BoardFreeVO> boardListMonthly();
	
	List<BoardFreeVO> listAll();
	
	List<BoardFreeVO> listCriteria(Criteria criteria);
	
	List<BoardFreeVO> listSearch(SearchCriteria searchCriteria);

	int countSearchedArticles(SearchCriteria searchCriteria);

	int countArticles(Criteria criteria);

	String getMemberNickname(String m_email); // 멤버 닉네임 가져오기

	MemberVO getMember(int id);

	int getMemberId(String m_email); // 멤버 아이디 가져오기

	// 자유게시판 등록 / 수정
	int insertBoardFree(BoardFreeVO freeVO); // 자유게시판 등록

	int updateBoardFree(BoardFreeVO freeVO); // 자유게시판 수정

	BoardFreeVO selectBoardFree(int bf_bno); // 자유게시판 상세정보 가져오기

	BoardFreeVO getContent(int page);

	void boardDelete(int bno);

	MemberVO getWriter(int id);

	int getUser(String email);

	String thumb_check(ThumbVO vo);

	String reply_check(ThumbVO vo);

	int plusRecommend(ThumbVO vo);

	int replyRecommend(ThumbVO vo);

	int insertWarn(WarnVO vo);

	int insertReplyWarn(WarnVO vo);

	String warn_check(WarnVO vo);

	String ReplyWarn(WarnVO vo);
}
