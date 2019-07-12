package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class eventController {

	@RequestMapping(value="/eventCollection.do", method=RequestMethod.GET)
	public String eventCollection() {
		return "event/eventCollection";
	}
	@RequestMapping(value="/cinemaList.do", method=RequestMethod.GET)
	public String cinemaList() {
		return "event/cinemaList";
	}
	@RequestMapping(value="/lastevent.do", method=RequestMethod.GET)
	public String lastevent() {
		return "event/lastevent";
	}
	@RequestMapping(value="/winner.do", method=RequestMethod.GET)
	public String winner() {
		return "event/winner";
	}
	
	
}
