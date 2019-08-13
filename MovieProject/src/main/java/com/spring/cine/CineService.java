package com.spring.cine;

import java.util.List;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;

public interface CineService {
	public List<String> getLocalName(CineVO cineVO);
	
	public List<String> getName(CineVO cineVO);
	
	public CineVO getCineInfo(CineVO cineVO);
	
	public int getUser(String email);
	
	public String reply_check(ThumbVO vo);
	public int replyRecommend(ThumbVO vo);
	
	
	public int insertReplyWarn(WarnVO vo);
	public String ReplyWarn(WarnVO vo);
}
