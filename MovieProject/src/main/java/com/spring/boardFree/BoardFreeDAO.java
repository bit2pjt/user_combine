package com.spring.boardFree;

import java.util.List;

import com.spring.member.MemberVO;
import com.spring.paging.Criteria;
import com.spring.paging.SearchCriteria;

public interface BoardFreeDAO {
	List<BoardFreeVO> listAll();
	

	List<BoardFreeVO> boardListDaily();
	List<BoardFreeVO> boardListWeekly();
	List<BoardFreeVO> boardListMonthly();
	

	List<BoardFreeVO> listCriteria(Criteria criteria);
	
	List<BoardFreeVO> listSearch(SearchCriteria searchCriteria);

    int countSearchedArticles(SearchCriteria searchCriteria);
    
	int countArticles(Criteria criteria);
	
	String getMemberNickname(String m_email);	//멤버 닉네임 가져오기
	
	MemberVO getMember(int id);
	int getMemberId(String m_email);		//멤버 아이디 가져오기
	
	// 자유게시판 등록 / 수정
	int insertBoardFree(BoardFreeVO freeVO);	 // 자유게시판 등록
	
	int updateBoardFree(BoardFreeVO freeVO);	// 자유게시판 수정
	
	BoardFreeVO selectBoardFree(int bf_bno);	// 자유게시판 상세정보 가져오기
	
	BoardFreeVO getContent(int page);
	
	void boardDelete(int bno);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	// 게시글 추천/비추천
	ThumbVO thumb_check(ThumbVO vo);
	
	int plusRecommend(ThumbVO vo);
	
	int replyRecommend(ThumbVO vo);
	
	void updateRecommend(ThumbVO vo);
	
	void updateDecommend(ThumbVO vo);

	int getRecommend(int bno);
	
	int getDecommend(int bno);
	
	// 댓글 추천/비추천
	ThumbVO reply_check(ThumbVO vo);
	
	void updateReplyRecommend(ThumbVO vo);
	
	void updateReplyDecommend(ThumbVO vo);
	
	int getReplyRecommend(int bfr_rno);
	
	int getReplyDecommend(int bfr_rno);
	
	// 게시글 신고
	int insertWarn(WarnVO vo);
	
	WarnVO warn_check(WarnVO vo);
	
	void WarnCount(int bno);
	
	// 댓글 신고
	int insertReplyWarn(WarnVO vo);
	
	WarnVO ReplyWarn(WarnVO vo);
	
	void ReplyWarnCount(int rno);
}
