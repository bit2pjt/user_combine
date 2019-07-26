package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BoardShareController {

	@GetMapping("/boardShareList")
	public String getListPage() 	{return "board/share/boardShareList";}
	@GetMapping("/boardShareGet")
	public String getGetPage() 		{return "board/share/boardShareGet"; }
	@GetMapping("/boardShareWrite")
	public String getWritePage()	{return "board/share/boardShareWrite";}
	@GetMapping("/boardShareUpdate")
	public String getUpdatePage() 	{return "board/share/boardShareUpdate";}
	
}
