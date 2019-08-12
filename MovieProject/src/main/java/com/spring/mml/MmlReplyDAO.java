package com.spring.mml;

import java.util.List;

import com.spring.paging.Criteria;



public interface MmlReplyDAO {
	
	//댓글목록
	public List<Mml_ReplyVO> mmlrlist(Integer boardNum);
	
	public void mmlrcreate(Mml_ReplyVO replyVO); 
	
	public void mmlrupdate(Mml_ReplyVO replyVO); 
	
	public void mmlrdelete(Integer replyNum);
	
	List<Mml_ReplyVO> mmlrlistPaging(Criteria criteria);
	//댓글 수
	public int mmlrcountReplies(Integer boardNum);
	
	//댓글이 속한 게시물 번호
	public int mmlrgetArticleNo(Integer replyNum);
}
