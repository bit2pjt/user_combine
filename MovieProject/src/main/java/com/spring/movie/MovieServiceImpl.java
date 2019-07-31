package com.spring.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mypage.MyPageDAO;
import com.spring.mypage.OneVO;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Movie_InfoVO> getMovieList() {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> movieList = movieDAO.getMovieList();
		
		return movieList;
	}
}
