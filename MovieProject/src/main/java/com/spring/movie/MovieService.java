package com.spring.movie;

import java.util.List;

public interface MovieService {
	public List<MovieInfoVO> getMovieList();
	public List<MovieInfoVO> getMovieList_title(String search_input);
	public List<MovieInfoVO> getMovieList_release(String search_input);
	public List<MovieInfoVO> getMovieList_country(String search_input);
	public List<MovieInfoVO> getMovieList_director(String search_input);
	public List<MovieInfoVO> getMovieList_actor(String search_input);
}
