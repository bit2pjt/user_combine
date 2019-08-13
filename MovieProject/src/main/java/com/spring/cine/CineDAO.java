package com.spring.cine;

import java.util.List;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;

public interface CineDAO {

	public List<CineVO> getLocalName(CineVO cineVO);
	
	public List<CineVO> getName(CineVO cineVO);
	
	public CineVO getCineInfo(CineVO cineVO);
	
	public int getUser(String email);
	
	// 댓글 추천/비추천
	ThumbVO reply_check(ThumbVO vo);
	int replyRecommend(ThumbVO vo);
	void updateReplyRecommend(ThumbVO vo);
	void updateReplyDecommend(ThumbVO vo);
	int getReplyRecommend(int cr_code);
	int getReplyDecommend(int cr_code);
		
	// 댓글 신고
	int insertReplyWarn(WarnVO vo);
	WarnVO ReplyWarn(WarnVO vo);
	void ReplyWarnCount(int cr_code);
}
