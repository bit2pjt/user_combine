
package com.spring.boardFree;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
	public String getListPage(Model model) {
		
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
	@RequestMapping(value = "/boardFreeWrite", method = RequestMethod.GET)
	public String freeWrite(HttpSession session, HttpServletRequest request) {

		// 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_nickname = boardFreeService.getMemberNickname(m_email); // System.out.println("=============MyPageController.java=====================
																		// nickname : " + m_nickname);
		request.setAttribute("m_nickname", m_nickname);

		return "board/free/boardFreeWrite";
	}
	
	/**
	  * 자유게시판 게시글 수정화면으로 이동
	  * @return "boardFreeList"
	 */
	@RequestMapping(value = "/boardFreeUpdate", method = RequestMethod.GET)
	public String boardFreeUpdate(HttpSession session, HttpServletRequest request) {

		String m_email = (String) session.getAttribute("m_email");

		// 사용자의 id를 가져옴
		int id = boardFreeService.getMemberId(m_email);

		// bf_bno=?의 작성자와 일치하는지 확인 후 일치하면 수정페이지로, 불일치하면 리스트로
		int bf_bno = Integer.parseInt(request.getParameter("bf_bno"));
		
		BoardFreeVO selectBoardFree = boardFreeService.selectBoardFree(bf_bno);


		if (id != selectBoardFree.getId()) {
			return "redirect:/boardFreeList";
		}
		
		request.setAttribute("selectBoardFree", selectBoardFree);

		return "board/free/boardFreeUpdate";
	}
	
	/**
	  * 자유게시판 게시글 삭제
	  * @return "boardFreeList"
	 */
	@RequestMapping(value= "/boardFreeDelete", method=RequestMethod.GET)
	public String boardDelete(@RequestParam("bno") int bno, HttpSession session, Model model) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		
		return "redirect:/boardFreeList"; 
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
	
	// 자유게시판 글쓰기 - 새글 등록 액션
		@RequestMapping(value = "/boardFreeWriteAction", method = RequestMethod.POST)
		public String boardFreeWriteAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
				BoardFreeVO freeVO) {

			freeVO.setId(boardFreeService.getMemberId((String) session.getAttribute("m_email")));

			// bf_title, bf_source bf_content의 앞뒤 공백 제거
			freeVO.setBf_title(freeVO.getBf_title().trim());
			freeVO.setBf_source(freeVO.getBf_source().trim());
			freeVO.setBf_content(freeVO.getBf_content().trim());

			try {
				int result = boardFreeService.insertBoardFree(freeVO);
				if (result == 0) {
					return "redirect:/boardFreeWrite";
				}
			} catch (Exception e) {
				System.out.println("ERROR : boardFreeWriteAction - " + e.getMessage());
			}
			return "redirect:/boardFreeList";

		}
		
	// 자유게시판 글수정하기 - 수정 액션
		@RequestMapping(value = "/boardFreeUpdateAction", method = RequestMethod.POST)
		public String boardFreeUpdateAction(HttpSession session, HttpServletRequest request, BoardFreeVO freeVO) {

			// bf_title, bf_source bf_content의 앞뒤 공백 제거
			freeVO.setBf_title(freeVO.getBf_title().trim());
			freeVO.setBf_source(freeVO.getBf_source().trim());
			freeVO.setBf_content(freeVO.getBf_content().trim());

			try {
				int result = boardFreeService.updateBoardFree(freeVO);
				if (result == 0) {
					return "redirect:/boardFreeUpdate?bf_bno=" + freeVO.getBf_bno();
				}
			} catch (Exception e) {
				System.out.println("ERROR : boardFreeUpdateAction - " + e.getMessage());
			}
			return "redirect:/boardFreeGet?bf_bno=" + freeVO.getBf_bno();
		}
	
	
}//e_BoardFreeController class
