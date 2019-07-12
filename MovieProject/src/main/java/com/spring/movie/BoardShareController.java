package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/share/*")
public class BoardShareController {

	@GetMapping("boardShareList.do")
	public void getListPage() {}
	@GetMapping("boardShareGet.do")
	public void getGetPage() {}
	@GetMapping("boardShareWrite.do")
	public void getWritePage() {}
	@GetMapping("boardShareUpdate.do")
	public void getUpdatePage() {}
	
	
}
