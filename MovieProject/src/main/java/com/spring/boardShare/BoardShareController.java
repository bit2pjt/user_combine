package com.spring.boardShare;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardShareController {

	@Autowired
	private BoardShareService boardShareService;
	
}
