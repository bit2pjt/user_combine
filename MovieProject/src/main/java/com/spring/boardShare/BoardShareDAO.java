package com.spring.boardShare;

import com.spring.member.MemberVO;

public interface BoardShareDAO {
	
	BoardShareVO getContent(int page);
	
	void updateViewCnt(int bno);
	
	MemberVO getWriter(int id);
	
	int getUser(String email);
}
