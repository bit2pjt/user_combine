package com.spring.boardFree;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardFreeController {
	
	// 서비스를 사용할수있게 해준다.
	@Autowired
	private BoardFreeService boardfreeService;
	
	
	// 1. �ܼ��� ȭ���� ��ȯ�� ����ϴ� void ȣ��
	@GetMapping("boardFreeList.do")
	public void getListPage() {
	}
	
	@GetMapping("/boardFreeGet.do")
	public ModelAndView getGetPage(BoardFreeVO vo, Model model, HttpSession session){
		// 데이터값을 넘겨주도록 하자.
		 
		
		
		
				
		
		return "board/free/boardFreeGet"; 
		
	}
	@GetMapping("boardFreeWrite.do")
	public void getWritePage() {}
	@GetMapping("boardFreeUpdate.do")
	public void getUpdatePage() {}
	@GetMapping("boardFreeList_test.do")
	public void getList_testPage() {}
	
	
	
}//e_BoardFreeController class
