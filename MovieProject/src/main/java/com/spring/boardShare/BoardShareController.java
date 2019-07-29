package com.spring.boardShare;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.boardFree.BoardFreeVO;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;

@Controller
public class BoardShareController {

	@Autowired
	BoardShareService boardShareService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/boardShareList", method=RequestMethod.GET)
	public String getListPage() {
		return "board/share/boardShareList";
	}
	
	@RequestMapping(value= "/boardShareGet", method=RequestMethod.GET)
	public String boardShareGet(@RequestParam("bno") int bno, HttpSession session, Model model) {
		String sessionyn = (String)session.getAttribute("m_email");
		if(sessionyn != null) {
			int id = boardShareService.getUser(sessionyn); // 로그인한 사용자의 id값
			model.addAttribute("id", id);
		}
		
		BoardShareVO boardShareVO = boardShareService.getContent(bno); // 게시글의 내용
		MemberVO memberVO = boardShareService.getWriter(boardShareVO.getId()); // 게시물 작성자의 정보
		
		model.addAttribute("sessionyn",sessionyn);
		model.addAttribute("boardShareVO", boardShareVO); // 게시글의 내용
		model.addAttribute("memberVO", memberVO); // 게시물 작성자의 정보
		
		return "board/share/boardShareGet"; 
	}
}
