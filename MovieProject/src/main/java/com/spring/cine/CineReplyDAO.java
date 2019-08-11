package com.spring.cine;

import java.util.List;
import com.spring.paging.Criteria;

public interface CineReplyDAO {
	
	//댓글목록
		public List<CineReplyVO> list(Integer mi_code);
			
		public void create(CineReplyVO replyVO); 
			
		public void update(CineReplyVO replyVO); 
			
		public void delete(Integer replyNum);
			
		List<CineReplyVO> listPaging(Criteria criteria);
		//댓글 수
		public int countReplies(Integer mi_code);
		
		public int sumScore(Integer mi_code);
		
		public int getUser(String email);
}
