package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/free/*")

public class BoardFreeController {
	
	// 1. 단순한 화면의 반환을 담당하는 void 호출
	@GetMapping("boardFreeList.do")
	public void getListPage() {}
	@GetMapping("boardFreeGet.do")
	public void getGetPage() {}
	@GetMapping("boardFreeWrite.do")
	public void getWritePage() {}
	@GetMapping("boardFreeUpdate.do")
	public void getUpdatePage() {}
	@GetMapping("boardFreeList_test.do")
	public void getList_testPage() {}
	
	
	
}//e_BoardFreeController class
