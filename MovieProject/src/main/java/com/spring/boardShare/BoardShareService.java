package com.spring.boardShare;

import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;

public interface BoardShareService {
	
	BoardShareVO getContent(int page);
	
	MemberVO getWriter(int id);

	int getUser(String email);
	
	String warn_check(WarnVO vo);
	
	int insertWarn(WarnVO vo);
	
	String ReplyWarn(WarnVO vo);
	
	int insertReplyWarn(WarnVO vo);
}
