package com.spring.ticketing;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
public class TicketingRestController {
	
		@Autowired
	TicketingService ticketingService;
	
	
	//1. 3사 영화정보를 크롤링으로 가져온 후 반환한다.
	@GetMapping("/getShowingMovies")
	public ArrayList<TicketingVO> getShowingMovies () {
		System.out.println("크롤링을 이용하는 서비스 호출");
		
		//ticketingService.getCgvMovies();
		//ticketingServiceTest.getTotalMovies();
		
		//ticketingService.getMovieListFromNaver();
		//System.out.println("selenium을 사용한 동적 크롤링 시작");
		//ticketingService.getMovieListViaSelenium();
		
		ArrayList<TicketingVO> result = ticketingService.getAccessViaMaxmovie();
		
		return result;
	}

	@GetMapping("/requestMovieInfos/{mvCode}/{today}")
	public ReturnContainerVO movieInfos(@PathVariable("mvCode")String mvCode,@PathVariable("today")String today, Model model) {
		System.out.println("입력된 영화 고유코드는 "+mvCode);
		System.out.println("오늘 날짜는"+today);
		
		MovieDetailVO detail = ticketingService.getDetailViaMaxmovie(mvCode);
		OutterRateVO orate= ticketingService.getOutterRate(detail.getName());
		
		ArrayList<CineInfoVO> cineMeta = ticketingService.getCineListViaMaxmovie(mvCode, today);
		//헉! 두 개의 VO는 어떻게 보내지?? 우선 별도의 VO를 하나 더 만들어서 감싸기로...
		
		ReturnContainerVO result = new ReturnContainerVO();
		result.setDetail(detail);
		result.setCineMeta(cineMeta);
		result.setORate(orate);
		
		return result;
	}

	@GetMapping("/linkToRealTicketing")
	public String linkToRealTicketing (	String day, String brand,
									 	String cine, String movieName,
									 	String startTime, String initDay) {
		
		
		String result = null;
		
		if (brand.equals("CGV")) {
			result =  ticketingService.linkToCGV(day, cine, movieName, startTime);
		}else if(brand.equals("LOTTE")) {
			result =  ticketingService.linkToLotte(day, cine, movieName, startTime);
		}else if(brand.equals("CINUS")) {
			result =  ticketingService.linkToMegaBox(day, cine, movieName, startTime, initDay);
		}else {
			result="3사 외의 영화관";
		}
		
		
		
		return result;
	}
	
	
}
