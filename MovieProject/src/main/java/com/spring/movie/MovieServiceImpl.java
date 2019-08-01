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
	
	@Override
	public List<Movie_InfoVO> getMovieList_title(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> search_list = movieDAO.getMovieList_title(search_input);
		
		return search_list;
	}
	
	@Override
	public List<Movie_InfoVO> getMovieList_release(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> search_list = movieDAO.getMovieList_release(search_input);
		
		return search_list;
	}
	
	@Override
	public List<Movie_InfoVO> getMovieList_country(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> search_list = movieDAO.getMovieList_country(search_input);
		
		return search_list;
	}
	
	@Override
	public List<Movie_InfoVO> getMovieList_director(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> search_list = movieDAO.getMovieList_director(search_input);
		
		return search_list;
	}
	
	@Override
	public List<Movie_InfoVO> getMovieList_actor(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<Movie_InfoVO> search_list = movieDAO.getMovieList_actor(search_input);
		
		return search_list;
	}
	
	
}
