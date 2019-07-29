package com.spring.boardShare;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.boardFree.BoardFreeVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;

/**
* @Class Name : BoardShareController.java
* @Description : BoardShare 게시판
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 28         황진석            		최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
@Controller
public class BoardShareController {

	@Autowired
	BoardShareService boardShareService;
	
	@Autowired
	MemberService memberService;
	
	/**
	  * 나눔 게시판 리스트로 이동
	  * @return "boardFreeList"
	 */
	@RequestMapping(value = "/boardShareList", method=RequestMethod.GET)
	public String getListPage() {
		return "board/share/boardShareList";
	}
	
	/**
	  * 나눔 게시판 게시글 상세 조회
	  * @param bno - 게시글 번호
	  * @param session - 세션
	  * @param model
	  * @return "boardShareGet"
	 */
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
	
	/**
	  * 신고 기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value="/boardShareWarn", method=RequestMethod.POST)
	public String boardFreeWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardShareService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bno = Integer.parseInt(request.getParameter("bs_bno")); //게시글 번호
		
		WarnVO vo = new WarnVO();
		vo.setBs_bno(bno);
		vo.setId(id);
		
		String msg = boardShareService.warn_check(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}
	
	/**
	  * 댓글 신고 기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value="/BSReplyWarn", method=RequestMethod.POST)
	public String BSReplyWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardShareService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bsr_rno = Integer.parseInt(request.getParameter("bsr_rno")); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setBsr_rno(bsr_rno);
		vo.setId(id);
		
		String msg = boardShareService.ReplyWarn(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}
}
