package com.spring.boardShare;

import com.spring.member.MemberVO;

public interface BoardShareService {
	
	BoardShareVO getContent(int page);
	
	MemberVO getWriter(int id);

	int getUser(String email);
}
