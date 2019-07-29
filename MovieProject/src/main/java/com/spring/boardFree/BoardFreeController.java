package com.spring.boardFree;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardFreeController {
	
	// 서비스를 사용할수있게 해준다.
	@Autowired
	private BoardFreeService boardfreeService;
	
	
	// 1. �ܼ��� ȭ���� ��ȯ�� ����ϴ� void ȣ��
	@GetMapping("boardFreeList.do")
	public void getListPage() {
	}
	
	
	//작성자의 정볼르 가져와보자
	@GetMapping("/boardFreeGet.do")
	public String getGetPage(Model model,BoardFreeVO vo ,HttpSession session){
		// 데이터값을 넘겨주도록 하자.
		// 로그인 상태에서 id session 가져오기
		
		/// 임시로 아이디 1 주기
		session.setAttribute("id", "1");
		System.out.println("로그인되있으면1:"+session.getAttribute("id"));
		int id = 1;
		// vo 객체안에 정보를 담아서 오고싶음
		// 아디디 값 섹션 유지시키기
		vo = boardfreeService.viewMember(id);
		
		//조회수 업데이트 서비스문
		boardfreeService.update_count(id);
		System.out.println("조회수:"+vo.getBf_view_counter());
		System.out.println("업데이트 되나 확인");
		
		
		System.out.println("제목:"+vo.getBf_title());
		
		model.addAttribute("BF_TITLE", vo.getBf_title());
		model.addAttribute("bf_reg_date", vo.getBf_reg_date());
		model.addAttribute("bf_reg_date", vo.getBf_reg_date());
		model.addAttribute("bf_update_date", vo.getBf_update_date());
		model.addAttribute("bf_view_counter", vo.getBf_view_counter());
		//추천 카운트
		
		//비추천 카운트
		
		
		//model.addAttribute("dto", boardfreeService.viewMember(id));
		
		//System.out.println("아이디:"+id);
		
		return "board/free/boardFreeGet"; 
		
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/boardFreeGet_reply.do")
	public String bf_reply( BoardFreeReplyVO vo, Model model, HttpServletRequest request) {
		
		// 만약에 로그인이 되어있으면 댓글을 남기고 안되있으면 로그인을 해달라고 얼럿띄우기
		// 메시지 입력된거 넘어오는거 확인
		System.out.println("message:"+request.getParameter("message")); 
		System.out.println("dfdfd:"+vo.getBfr_content());
		
		// 자유게시판 댓글 테이블 생성하고, 그안에 글내용 컬럼 추가하기.
		// 메시지내용을 db에 저장하는 매서드
		
		// **  vo set 잘써보기 
		vo.setBfr_content(request.getParameter("message"));
		boardfreeService.bfr_content(vo.getBfr_content());


		
		// 입력된 데이터 가져오기
		String bfr_select = boardfreeService.bfr_content_select(vo.getBfr_content());
		// 입력된 데이터 확인
		
		
		return "board/free/boardFreeGet";
	}
	
	
	@GetMapping("boardFreeWrite.do")
	public void getWritePage() {}
	@GetMapping("boardFreeUpdate.do")
	public void getUpdatePage() {}
	@GetMapping("boardFreeList_test.do")
	public void getList_testPage() {}
	
	
	
}//e_BoardFreeController class
