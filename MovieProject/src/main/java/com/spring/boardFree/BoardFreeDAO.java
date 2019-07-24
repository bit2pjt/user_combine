package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeDAO {
	
	BoardFreeVO getContent(int page);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
	
	ThumbVO thumb_check(int id);
	
	int plusRecommend(ThumbVO vo);
	
	void updateRecommend(ThumbVO vo);
	
	void updateDecommend(ThumbVO vo);
	
	int getRecommend(int bno);
	
	int insertWarn(WarnVO vo);
	
	WarnVO warn_check(int id);
	
	void WarnCount(int bno);
}
