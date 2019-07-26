package com.spring.mml;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mmlService")
public class MmlServiceImpl implements MmlService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MmlDAO mmlDAO;
	
	
}
