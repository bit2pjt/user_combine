package com.spring.boardShare;

import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;

public interface BoardShareDAO {
	
	BoardShareVO getContent(int page);
	
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
