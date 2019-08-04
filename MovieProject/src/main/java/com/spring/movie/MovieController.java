package com.spring.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/movieList", method=RequestMethod.GET)
	public String movieList(Model model) {
		List<MovieInfoVO> movieList = movieService.getMovieList();
		
		model.addAttribute("movieList", movieList);
		return "movie/movieList";
	}
	
	@RequestMapping(value="/movieDetail", method=RequestMethod.GET)
	public String moveDetail() {
		return "movie/movieDetail";
	}
}
