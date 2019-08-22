package com.spring.mml;

import java.util.List;

import com.spring.paging.Criteria;



public interface Mml_ReplyDAO {
	
	//댓글목록
	public List<Mml_ReplyVO> list(Integer mml_num);
	
	public void create(Mml_ReplyVO replyVO); 
	
	public void update(Mml_ReplyVO replyVO); 
	
	public void delete(Integer mml_reply_code);
	
	List<Mml_ReplyVO> listPaging(Criteria criteria);
	//댓글 수
	public int countReplies(Integer mml_num);
	
	//댓글이 속한 게시물 번호
	public int getArticleNo(Integer mml_reply_code);
}
