package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeDAO {
	
	BoardFreeVO getContent(int page);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	ThumbVO thumb_check(int id);
	
	ThumbVO reply_check1(int bfr_rno);
	
	ThumbVO reply_check2(int id);
	
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
	
	WarnVO warn_check(int id);
	
	void WarnCount(int bno);
}
