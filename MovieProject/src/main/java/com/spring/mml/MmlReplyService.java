package com.spring.mml;

import java.util.List;

import com.spring.paging.Criteria;


public interface MmlReplyService {
	//댓글목록
	public List<Mml_ReplyVO> getmmlReplies(Integer boardNum);
		
	public void addmmlReply(Mml_ReplyVO replyVO); 
		
	public void modifymmlReply(Mml_ReplyVO replyVO); 
		
	public void removemmlReply(Integer replyNum);
	
	List<Mml_ReplyVO> getmmlRepliesPaging(Integer boardNum, Criteria criteria);
		
	//댓글 수
	public int countmmlReplies(Integer boardNum);
		
}
