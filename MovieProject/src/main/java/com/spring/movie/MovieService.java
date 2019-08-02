package com.spring.movie;

import java.util.List;

public interface MovieService {
	public List<Movie_InfoVO> getMovieList();
	public List<Movie_InfoVO> getMovieList_title(String search_input);
	public List<Movie_InfoVO> getMovieList_release(String search_input);
	public List<Movie_InfoVO> getMovieList_country(String search_input);
	public List<Movie_InfoVO> getMovieList_director(String search_input);
	public List<Movie_InfoVO> getMovieList_actor(String search_input);
}
