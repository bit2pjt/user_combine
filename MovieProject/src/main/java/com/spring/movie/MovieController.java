package com.spring.movie;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.paging.PageMaker;
import com.spring.paging.SearchCriteria;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/movieList", method=RequestMethod.GET)
	public String movieList(Model model,@ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(movieService.countSearchedMovie(searchCriteria));
        System.out.println("111: " + pageMaker.getTotalCount());
		List<MovieInfoVO> movieList = movieService.getMovieListSerch(searchCriteria);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute(pageMaker);
		
		return "movie/movieList";
	}
	
	@RequestMapping(value="/movieDetail", method=RequestMethod.GET)
	public String moveDetail(@RequestParam("mi_ktitle") String mi_ktitle, Model model, HttpSession session) {
		String sessionyn = (String)session.getAttribute("m_email");
		if(sessionyn != null) {
			int id = movieService.getUser(sessionyn); // 로그인한 사용자의 id값
			model.addAttribute("id", id);
		}
		MovieInfoVO movieInfoVO = movieService.getMovieInfo(mi_ktitle);
		
		model.addAttribute("sessionyn",sessionyn);
		model.addAttribute("movieInfoVO", movieInfoVO);
		
		return "movie/movieDetail";
	}
}
