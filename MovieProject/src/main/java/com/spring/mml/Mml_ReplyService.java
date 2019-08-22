package com.spring.mml;

import java.util.List;

import com.spring.paging.Criteria;

public interface Mml_ReplyService {

	public List<Mml_ReplyVO> getReplies(Integer mml_num);
	
	public void addReply(Mml_ReplyVO replyVO); 
		
	public void modifyReply(Mml_ReplyVO replyVO); 
		
	public void removeReply(Integer mml_num);
	
	List<Mml_ReplyVO> getRepliesPaging(Integer mml_num, Criteria criteria);
		
	
	public int countReplies(Integer mml_num);
}
