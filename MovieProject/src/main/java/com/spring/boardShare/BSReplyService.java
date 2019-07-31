package com.spring.boardShare;

import java.util.List;

import com.spring.boardFree.BFReplyVO;
import com.spring.paging.Criteria;

public interface BSReplyService {
	//댓글목록
	public List<BSReplyVO> getReplies(Integer boardNum);
			
	public void addReply(BSReplyVO replyVO); 
			
	public void modifyReply(BSReplyVO replyVO); 
			
	public void removeReply(Integer replyNum);
		
	List<BSReplyVO> getRepliesPaging(Integer boardNum, Criteria criteria);
			
		//댓글 수
	public int countReplies(Integer boardNum);
}
