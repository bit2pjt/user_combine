package com.spring.boardShare;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BoardFreeDAO;
import com.spring.member.MemberVO;

@Service("boardShareService")
public class BoardShareServiceImpl implements BoardShareService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardShareVO getContent(int page) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		boardShareDAO.updateViewCnt(page);
		BoardShareVO vo = boardShareDAO.getContent(page);
		return vo;
	}

	@Override
	public MemberVO getWriter(int id) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		MemberVO vo = boardShareDAO.getWriter(id);
		return vo;
	}

	@Override
	public int getUser(String email) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		int num = boardShareDAO.getUser(email);
		return num;
	}

}
