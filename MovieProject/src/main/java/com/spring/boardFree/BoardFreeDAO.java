package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeDAO {
	
	BoardFreeVO getContent(int page);
	
	void boardDelete(int bno);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	// 게시글 추천/비추천
	ThumbVO thumb_check(int id);
	
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
	
	WarnVO warn_check(int id);
	
	void WarnCount(int bno);
	
	// 댓글 신고
	int insertReplyWarn(WarnVO vo);
	
	WarnVO ReplyWarn(WarnVO vo);
	
	void ReplyWarnCount(int rno);
}
