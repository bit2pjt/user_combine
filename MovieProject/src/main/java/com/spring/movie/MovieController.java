package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MovieController {
	
	@RequestMapping(value="/movieList.do", method=RequestMethod.GET)
	public String movieList() {
		return "movie/movieList";
	}
	
	@RequestMapping(value="/movieDetail.do", method=RequestMethod.GET)
	public String moveDetail() {
		return "movie/movieDetail";
	}
}
