package com.spring.mml;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mypage.MyPageDAO;

@Service("mmlService")
public class MmlServiceImpl implements MmlService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Mml_ContentVO getMmlContent(int mml_num) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		Mml_ContentVO mml_ContentVO = mmlDAO.getMmlContent(mml_num);
		return mml_ContentVO;
	}
	
	@Override
	public int insertMml(Mml_ContentVO mmlContentVO) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int result = mmlDAO.insertMml(mmlContentVO);
		return result;
	}
	
	@Override
	public int updateMml(Mml_ContentVO mmlContentVO) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int result = mmlDAO.updateMml(mmlContentVO);
		return result;
	}
}
