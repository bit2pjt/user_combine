package com.spring.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BoardFreeDAO;
import com.spring.mypage.MyPageDAO;
import com.spring.mypage.OneVO;
import com.spring.paging.SearchCriteria;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieInfoVO> getMovieList() {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> movieList = movieDAO.getMovieList();
		
		return movieList;
	}

	@Override
	public int countSearchedMovie(SearchCriteria searchCriteria) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		return movieDAO.countSearchedMovie(searchCriteria);
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_title(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_title(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_release(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_release(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_country(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_country(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_director(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_director(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_actor(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_actor(search_input);
		
		return search_list;
	}


	@Override
	public List<MovieInfoVO> getMovieListSerch(SearchCriteria searchCriteria) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> movieList = movieDAO.getMovieListSerch(searchCriteria);
		
		return movieList;
	}

	@Override
	public MovieInfoVO getMovieInfo(String mi_ktitle) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		MovieInfoVO vo = movieDAO.getMovieInfo(mi_ktitle);
		return vo;
	}

	@Override
	public int getUser(String email) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);;
		int num = movieDAO.getUser(email);
		return num;
	}
	
	
}
