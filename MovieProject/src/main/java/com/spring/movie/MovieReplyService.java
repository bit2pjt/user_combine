package com.spring.movie;

import java.util.List;

import com.spring.paging.Criteria;

public interface MovieReplyService {
	//댓글목록
	public List<MovieReplyVO> getReplies(Integer mi_code);
			
	public void addReply(MovieReplyVO replyVO); 
			
	public void modifyReply(MovieReplyVO replyVO); 
			
	public void removeReply(Integer mi_code);
		
	List<MovieReplyVO> getRepliesPaging(Integer mi_code, Criteria criteria);
			
	//댓글 수
	public int countReplies(Integer mi_code);
	
	public int sumScore(Integer mi_code);
	
	public int getUser(String email);
}
