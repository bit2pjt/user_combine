
package com.spring.boardFree;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardFreeController {
	
	@RequestMapping(value = "/boardFreeList.do", method=RequestMethod.GET)
	public String getListPage() {
		return "board/free/boardFreeList";
	}
	
	@GetMapping("/boardFreeGet.do")
	public String getGetPage() {
		return "board/free/boardFreeGet"; 
	}
	
	@GetMapping("/boardFreeWrite.do")
	public String getWritePage() {
		return "board/free/boardFreeWrite";
	}
	
	@GetMapping("/boardFreeUpdate.do")
	public String getUpdatePage() {
		return "board/free/boardFreeUpdate";
	}
		
}//e_BoardFreeController class
