package com.spring.cine;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cineService")
public class CineServiceImpl implements CineService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void getLocalName(CineVO cineVO) {
		// TODO Auto-generated method stub
		
	}
}
