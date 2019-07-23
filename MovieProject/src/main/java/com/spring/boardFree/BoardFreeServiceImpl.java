package com.spring.boardFree;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {
	@Autowired
	private SqlSession sqlSession;
	
	//제모
	@Override
	public int findtitle(String BF_TITLE){
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int bf_title  = boardFreeDAO.findtitle(BF_TITLE); 
		System.out.println("BF_TITLE:"+BF_TITLE);
		
		return bf_title;
	}
}
