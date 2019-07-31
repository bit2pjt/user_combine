package com.spring.boardFree;

import java.util.List;

import com.spring.member.MemberVO;

public interface BoardFreeService {

	List<BoardFreeVO> listAll();
	
	BoardFreeVO getContent(int page);
	
	void boardDelete(int bno);
	
	MemberVO getWriter(int id);

	int getUser(String email);
	
	String thumb_check(ThumbVO vo);
	
	String reply_check(ThumbVO vo);
	
	int plusRecommend(ThumbVO vo);

	int replyRecommend(ThumbVO vo);
	
	int insertWarn(WarnVO vo);
	
	int insertReplyWarn(WarnVO vo);
	
	String warn_check(WarnVO vo);
	
	String ReplyWarn(WarnVO vo);
}
