
package com.spring.boardFree;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;

/**
* @Class Name : BoardFreeController.java
* @Description : BoardFree 게시판
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 23         황진석            		최초생성
* @ 2019. 07. 24	황진석		추천기능 추가 / 신고기능 추가
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@Controller
public class BoardFreeController {
	
	@Autowired(required=false)
	BoardFreeService boardFreeService;
	
	@Autowired
	MemberService memberService;
	
	/**
	  * 자유게시판 리스트로 이동
	  * @return "boardFreeList"
	 */
	@RequestMapping(value = "/boardFreeList", method=RequestMethod.GET)
	public String getListPage() {
		return "board/free/boardFreeList";
	}
	
	/**
	  * 자유게시판 게시글 상세 조회
	  * @param bno - 게시글 번호
	  * @param session - 세션
	  * @param model
	  * @return "boardFreeGet"
	 */
	@RequestMapping(value= "/boardFreeGet", method=RequestMethod.GET)
	public String boardFreeGet(@RequestParam("bno") int bno, HttpSession session, Model model) {
		String sessionyn = (String)session.getAttribute("m_email");
		if(sessionyn != null) {
			int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
			model.addAttribute("id", id);
		}
		
		BoardFreeVO boardFreeVO = boardFreeService.getContent(bno); // 게시글의 내용
		MemberVO memberVO = boardFreeService.getWriter(boardFreeVO.getId()); // 게시물 작성자의 정보
		
		model.addAttribute("sessionyn",sessionyn);
		model.addAttribute("boardFreeVO", boardFreeVO); // 게시글의 내용
		model.addAttribute("memberVO", memberVO); // 게시물 작성자의 정보
		
		return "board/free/boardFreeGet"; 
	}
	
	/**
	  * 자유게시판 게시글 등록화면으로 이동
	  * @return "boardFreeWrite"
	 */
	@GetMapping("/boardFreeWrite")
	public String getWritePage() {
		return "board/free/boardFreeWrite";
	}
	
	/**
	  * 자유게시판 게시글 수정화면으로 이동
	  * @return "boardFreeList"
	 */
	@GetMapping("/boardFreeUpdate")
	public String getUpdatePage() {
		return "board/free/boardFreeUpdate";
	}
	
	/**
	  * 자유게시판 게시글 삭제
	  * @return "boardFreeList"
	 */
	@GetMapping("/boardFreeDelete")
	public String boardDelete(@RequestParam("bno") int bno, HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		
		return "board/free/boardFreeList";
	}
	
	/**
	  * 추천/비추천기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value = "/boardFreeReco", method=RequestMethod.POST)
	public String boardFreeReco(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bno = Integer.parseInt(request.getParameter("bf_bno")); //게시글 번호
		int type = Integer.parseInt(request.getParameter("type")); // 추천:1, 비추천:0
		ThumbVO vo = new ThumbVO();
		vo.setBf_bno(bno);
		vo.setId(id);
		vo.setBf_thumb(type);
		
		if( type == 1) {
			// bf_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = boardFreeService.thumb_check(vo); 
			return msg;
		}else {
			// bf_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = boardFreeService.thumb_check(vo);
			return msg;
		}
	}
	
	/**
	  * 댓글 추천/비추천기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value = "/BFReplyReco", method=RequestMethod.POST)
	public String BFReplyReco(HttpSession session, HttpServletRequest request) { 
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bfr_rno = Integer.parseInt(request.getParameter("bfr_rno")); //게시글 번호
		int type = Integer.parseInt(request.getParameter("type")); // 추천:1, 비추천:0
		ThumbVO vo = new ThumbVO();
		vo.setBfr_rno(bfr_rno); // 댓글 번호
		vo.setId(id); // 댓글 쓴 사람의 id
		vo.setBf_thumb(type); // 1: 추천, 0: 비추천
		
		if( type == 1) { // 추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = boardFreeService.reply_check(vo); 
			return msg;
		}else { // 비추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = boardFreeService.reply_check(vo);
			return msg;
		}
	}
	
	
	/**
	  * 신고 기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value="/boardFreeWarn", method=RequestMethod.POST)
	public String boardFreeWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bno = Integer.parseInt(request.getParameter("bf_bno")); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setBf_bno(bno);
		vo.setId(id);
		
		String msg = boardFreeService.warn_check(vo); 
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
	@RequestMapping(value="/BFReplyWarn", method=RequestMethod.POST)
	public String BFReplyWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		int bfr_rno = Integer.parseInt(request.getParameter("bfr_rno")); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setBfr_rno(bfr_rno);
		vo.setId(id);
		
		String msg = boardFreeService.ReplyWarn(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}
	
	
}//e_BoardFreeController class
