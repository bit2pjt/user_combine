package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeService {

	BoardFreeVO getContent(int page);
	
	MemberVO getWriter(int id);

	int getUser(String email);
	
	String thumb_check(ThumbVO vo);
	
	String reply_check(ThumbVO vo);
	
	int plusRecommend(ThumbVO vo);

	int replyRecommend(ThumbVO vo);
	
	int insertWarn(WarnVO vo);
	
	String warn_check(WarnVO vo);
}
