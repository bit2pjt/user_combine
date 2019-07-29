package com.spring.boardFree;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {
	@Autowired
	private SqlSession sqlSession;
	
	
	// 메세지 db insert문 만들기
	@Override
	public void bfr_content(String bfr_content) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		
		boardFreeDAO.insert_bfr_content(bfr_content);
		return;
	}
	// 댓글 db 내용 selecet 하기
	@Override
	public String bfr_content_select(String bfr_content) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		
		String bfr_select = boardFreeDAO.select_bfr_content(bfr_content);
		return bfr_select;
	}
	
	
	@Override
	public BoardFreeVO viewMember(int id) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		
		BoardFreeVO num = boardFreeDAO.viewMember(id);
		// 좋
		
		
		return num;
	}
	
	@Override
	public void update_count(int id){
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		
		boardFreeDAO.update_count(id);
	}
	
}
