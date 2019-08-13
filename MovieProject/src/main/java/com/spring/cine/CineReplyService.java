package com.spring.cine;

import java.util.List;

import com.spring.paging.Criteria;

public interface CineReplyService {
	//댓글목록
		public List<CineReplyVO> getReplies(Integer mi_code);
				
		public void addReply(CineReplyVO replyVO); 
				
		public void modifyReply(CineReplyVO replyVO); 
				
		public void removeReply(Integer mi_code);
			
		List<CineReplyVO> getRepliesPaging(Integer mi_code, Criteria criteria);
				
		//댓글 수
		public int countReplies(Integer mi_code);
		
		public int sumScore(Integer mi_code);
		
		public int getUser(String email);
}
