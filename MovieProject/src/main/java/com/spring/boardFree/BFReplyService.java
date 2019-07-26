package com.spring.boardFree;

import java.util.List;

import com.spring.paging.Criteria;


public interface BFReplyService {
	//댓글목록
	public List<BFReplyVO> getReplies(Integer boardNum);
		
	public void addReply(BFReplyVO replyVO); 
		
	public void modifyReply(BFReplyVO replyVO); 
		
	public void removeReply(Integer replyNum);
	
	List<BFReplyVO> getRepliesPaging(Integer boardNum, Criteria criteria);
		
	//댓글 수
	public int countReplies(Integer boardNum);
		
}
