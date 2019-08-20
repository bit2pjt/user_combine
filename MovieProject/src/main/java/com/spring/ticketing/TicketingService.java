package com.spring.ticketing;

import java.util.ArrayList;

public interface TicketingService {

	

	void getMovieListFromNaver();
	
	void getMovieListViaSelenium ();

	ArrayList<TicketingVO> getAccessViaMaxmovie();

	ArrayList<CineInfoVO> getCineListViaMaxmovie(String mvCode, String today);

	public MovieDetailVO getDetailViaMaxmovie(String mvCode);

	String linkToCGV(String day, String cinema, String title, String startTime);

	String linkToLotte(String day, String cinema, String title, String startTime);

	String linkToMegaBox(String day, String cinema, String title, String startTime, String initDay);

	OutterRateVO getOutterRate(String name);

	

	
}
