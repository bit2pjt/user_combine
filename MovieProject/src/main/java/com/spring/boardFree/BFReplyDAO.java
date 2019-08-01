package com.spring.boardFree;

import java.util.List;

import com.spring.paging.Criteria;



public interface BFReplyDAO {
	
	//댓글목록
	public List<BFReplyVO> list(Integer boardNum);
	
	public void create(BFReplyVO replyVO); 
	
	public void update(BFReplyVO replyVO); 
	
	public void delete(Integer replyNum);
	
	List<BFReplyVO> listPaging(Criteria criteria);
	//댓글 수
	public int countReplies(Integer boardNum);
	
	//댓글이 속한 게시물 번호
	public int getArticleNo(Integer replyNum);
}
