package com.spring.ticketing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class TicketingController {
	
	@Autowired
	TicketingService ticektingService;
	
	@GetMapping("/movieTicketing")
	public String getTicketingPage (Model model) {
		
		model.addAttribute("movies", ticektingService.getAccessViaMaxmovie());
		
		
		return "/movie/movieTicketing";
	}
	
}//e_TicketingController


