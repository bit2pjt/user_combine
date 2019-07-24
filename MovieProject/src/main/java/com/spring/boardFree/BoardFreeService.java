package com.spring.boardFree;

import com.spring.member.MemberVO;

public interface BoardFreeService {

	BoardFreeVO getContent(int page);
	
	MemberVO getWriter(int id);

	int getUser(String email);
	
	String thumb_check(ThumbVO vo);
	
	int plusRecommend(ThumbVO vo);
	
	void updateRecommend(ThumbVO vo);
	
	void updateDecommend(ThumbVO vo);
	
	int getRecommend(int bno);
}
