package com.spring.movie;

import java.util.List;

import com.spring.paging.Criteria;

public interface MovieReplyDAO {
	
	//댓글목록
	public List<MovieReplyVO> list(Integer mi_code);
		
	public void create(MovieReplyVO replyVO); 
		
	public void update(MovieReplyVO replyVO); 
		
	public void delete(Integer replyNum);
		
	List<MovieReplyVO> listPaging(Criteria criteria);
	//댓글 수
	public int countReplies(Integer mi_code);
	
	public int sumScore(Integer mi_code);
	
	public int getUser(String email);
}
