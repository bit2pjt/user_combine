
package com.spring.etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class eventController {

	@RequestMapping(value="/eventCollection", method=RequestMethod.GET)
	public String eventCollection() {
		return "event/eventCollection";
	}
	
	@RequestMapping(value="/lastevent", method=RequestMethod.GET)
	public String lastevent() {
		return "event/lastevent";
	}
	@RequestMapping(value="/winner", method=RequestMethod.GET)
	public String winner() {
		return "event/winner";
	}
	
	
}
