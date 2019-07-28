package com.spring.boardShare;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberVO;

@Service("boardShareService")
public class BoardShareServiceImpl implements BoardShareService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardShareVO getContent(int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO getWriter(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getUser(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

}
