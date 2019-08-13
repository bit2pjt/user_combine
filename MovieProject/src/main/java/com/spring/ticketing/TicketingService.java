package com.spring.ticketing;

import java.util.ArrayList;

public interface TicketingService {

	

	void getMovieListFromNaver();
	
	void getMovieListViaSelenium ();

	ArrayList<TicketingVO> getAccessViaMaxmovie();

	ArrayList<CineInfoVO> getCineListViaMaxmovie(String mvCode, String today);

	public MovieDetailVO getDetailViaMaxmovie(String mvCode);

	

	
}
