package com.spring.cine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CineController {

	@Autowired
	CineService cineService;
	
	@RequestMapping(value="/cinemaList", method=RequestMethod.GET)
	public String cinemaList() {
		
		return "event/cinemaList";
	}
	
	@RequestMapping(value="/cineLocal", method=RequestMethod.GET)
	public String cineLocal(@RequestParam("cc_brand") String cc_brand, @RequestParam("")) {
		
		return "event/cinemaList";
	}
}
