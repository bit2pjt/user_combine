package com.spring.cine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movie.MovieDAO;

import lombok.extern.log4j.Log4j;

@Service("cineService")
public class CineServiceImpl implements CineService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<String> getLocalName(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		
		List<CineVO> cineList = cineDAO.getLocalName(cineVO);
		List<String> list = new ArrayList<String>();

		for(int i=0; i<cineList.size(); i++) {
			list.add(cineList.get(i).getCC_LOCAL_NAME());
		}
		return list;
		
	}

	@Override
	public List<String> getName(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		
		List<CineVO> cineList = cineDAO.getName(cineVO);
		List<String> list = new ArrayList<String>();
		
		for(int i=0; i<cineList.size(); i++) {
			list.add(cineList.get(i).getCC_NAME());
		}
		
		return list;
	}

	@Override
	public CineVO getCineInfo(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		CineVO vo = cineDAO.getCineInfo(cineVO);
		
		return vo;
	}

	@Override
	public int getUser(String email) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		int num = cineDAO.getUser(email);
		return num;
	}
}
