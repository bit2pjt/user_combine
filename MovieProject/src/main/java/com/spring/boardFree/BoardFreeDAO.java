package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeDAO {
	
	BoardFreeVO getContent(int page);
	
	void boardDelete(int bno);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	ThumbVO thumb_check(int id);
	
	ThumbVO reply_check(ThumbVO vo);
	
	int plusRecommend(ThumbVO vo);
	
	int replyRecommend(ThumbVO vo);
	
	void updateRecommend(ThumbVO vo);
	
	void updateDecommend(ThumbVO vo);
	
	void updateReplyRecommend(ThumbVO vo);
	
	void updateReplyDecommend(ThumbVO vo);
	
	int getRecommend(int bno);
	
	int getDecommend(int bno);

	int getReplyRecommend(int bfr_rno);
	
	int getReplyDecommend(int bfr_rno);
	
	int insertWarn(WarnVO vo);
	
	int insertReplyWarn(WarnVO vo);
	
	WarnVO warn_check(int id);
	
	WarnVO ReplyWarn(WarnVO vo);
	
	void WarnCount(int bno);
	
	void ReplyWarnCount(int rno);
}
