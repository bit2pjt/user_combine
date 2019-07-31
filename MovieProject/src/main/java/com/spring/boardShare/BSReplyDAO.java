package com.spring.boardShare;

import java.util.List;

import com.spring.paging.Criteria;

public interface BSReplyDAO {
	
	//댓글목록
	public List<BSReplyVO> list(Integer boardNum);
	
	public void create(BSReplyVO replyVO); 
	
	public void update(BSReplyVO replyVO); 
	
	public void delete(Integer replyNum);
	
	List<BSReplyVO> listPaging(Criteria criteria);
	//댓글 수
	public int countReplies(Integer boardNum);
	
	//댓글이 속한 게시물 번호
	public int getArticleNo(Integer replyNum);
}
