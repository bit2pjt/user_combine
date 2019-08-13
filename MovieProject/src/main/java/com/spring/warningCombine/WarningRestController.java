package com.spring.warningCombine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WarningRestController {

	@Autowired
	WarningService warningService;
	
	@GetMapping("/warningCombine")
	public String warningCombine(WarningCombineVO vo) {
		String result = warningService.warningCombine(vo);
		
		return result;
	}
	
	
	
	
}
