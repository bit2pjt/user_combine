package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardShareController {

	@GetMapping("/boardShareList.do")
	public String getListPage() 	{return "board/share/boardShareList";}
	@GetMapping("/boardShareGet.do")
	public String getGetPage() 		{return "board/share/boardShareGet"; }
	@GetMapping("/boardShareWrite.do")
	public String getWritePage()	{return "board/share/boardShareWrite";}
	@GetMapping("/boardShareUpdate.do")
	public String getUpdatePage() 	{return "board/share/boardShareUpdate";}
	
}
