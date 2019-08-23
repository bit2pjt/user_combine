
package com.spring.boardFree;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.mml.MmlService;
import com.spring.paging.PageMaker;
import com.spring.paging.SearchCriteria;

/**
* @Class Name : BoardFreeController.java
* @Description : BoardFree 게시판
* @Modification Information
* @
* @  	수정일        수정자                수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 23    황진석                최초생성
* @ 2019. 07. 24	황진석		추천기능 추가 / 신고기능 추가
* @ 2019. 08. 09	한유진				  수정

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
	
	@Autowired
	MmlService mmlService;
	
	/**
	  * 자유게시판 리스트로 이동
	  * @return "boardFreeList"
	 */
	/*
	@RequestMapping(value = "/boardFreeList", method=RequestMethod.GET)
	public String getListPage(Model model) {
		model.addAttribute("boardfree", boardFreeService.listAll());
		return "board/free/boardFreeList";
	}

	@RequestMapping(value = "/boardFreeListP", method=RequestMethod.GET)
	public String getListPageP(Model model, Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		System.out.println("11111: " + criteria.getPage()); // 1
		System.out.println("22222: " + criteria.getPerPageNum());// 10
        pageMaker.setCriteria(criteria);
        pageMaker.setTotalCount(boardFreeService.countArticles(criteria)); // 11
        model.addAttribute("boardfree", boardFreeService.listCriteria(criteria));
        model.addAttribute("pageMaker", pageMaker);		
		return "board/free/boardFreeList";
	}
	*/
	
	@RequestMapping(value = "/boardFreeListP", method=RequestMethod.GET)
	public String getListPageP(Model model,@ModelAttribute("searchCriteria") 
		SearchCriteria searchCriteria) {
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(boardFreeService.countSearchedArticles(searchCriteria));
        
        model.addAttribute("boardfree", boardFreeService.listSearch(searchCriteria));
        model.addAttribute("pageMaker", pageMaker);	
        model.addAttribute("boardListDaily", boardListDaily());
        
		return "board/free/boardFreeList";
	}
	

	//일간베스
	@ResponseBody
	@RequestMapping(value = "/boardListDaily", method=RequestMethod.POST)
	public List<BoardFreeVO> boardListDaily () {
		List<BoardFreeVO> result = boardFreeService.boardListDaily();
		return result;
	}
	
	//주간베스
	@ResponseBody
	@RequestMapping(value = "/boardListWeekly", method=RequestMethod.POST)
	public List<BoardFreeVO> boardListWeekly () {
		List<BoardFreeVO> result = boardFreeService.boardListWeekly();
		return result;
	}
	
	//월간베스트
	@ResponseBody
	@RequestMapping(value = "/boardListMonthly", method=RequestMethod.POST)
	public List<BoardFreeVO> boardListMonthly () {
		List<BoardFreeVO> result = boardFreeService.boardListMonthly();
		return result;
	}
	/**
	  * 자유게시판 게시글 상세 조회
	  * @param bno - 게시글 번호
	  * @param session - 세션
	  * @param model
	  * @return "boardFreeGet"
	 */
	@RequestMapping(value= "/boardFreeGet", method=RequestMethod.GET)
	public String boardFreeGet(@RequestParam("bno") int bno, HttpSession session
			, Model model, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria, HttpServletRequest request) {
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
		if(request.getParameter("bt") != null) {
			String bt = request.getParameter("bt");
			if(bt.equals("d")) {
				model.addAttribute("boardListDaily", boardListDaily());
				model.addAttribute("bt_type","Today");
			}else if(bt.equals("w")) {
				model.addAttribute("boardListDaily", boardListWeekly());
				model.addAttribute("bt_type","Weekly");
			}else if(bt.equals("m")) {
				model.addAttribute("boardListDaily", boardListMonthly());
				model.addAttribute("bt_type","Monthly");
			}
		}else {
			model.addAttribute("boardListDaily", boardListDaily());//오른쪽의 실시간 베스트5
			model.addAttribute("bt_type","Today");
		}
		
		
		model.addAttribute("mmlTop3", mmlService.getMmlList_like_top3(boardFreeVO.getId()));
		

		return "board/free/boardFreeGet"; 
	}
	
	/**
	  * 자유게시판 게시글 등록화면으로 이동
	  * @return "boardFreeWrite"
	 */
	@RequestMapping(value = "/boardFreeWrite", method = RequestMethod.GET)
	public String freeWrite(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, HttpSession session, HttpServletRequest request) {

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
	public String boardFreeUpdate(@RequestParam("bno") int bno, HttpSession session, HttpServletRequest request
			, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {

		String m_email = (String) session.getAttribute("m_email");
		// 사용자의 id를 가져옴
		int id = boardFreeService.getMemberId(m_email);

		// bf_bno=?의 작성자와 일치하는지 확인 후 일치하면 수정페이지로, 불일치하면 리스트로
		
		BoardFreeVO selectBoardFree = boardFreeService.selectBoardFree(bno);

		if (id != selectBoardFree.getId()) {
			return "redirect:/boardFreeListP";
		}
		
		request.setAttribute("selectBoardFree", selectBoardFree);
		return "board/free/boardFreeUpdate";
	}
	
	/**
	  * 자유게시판 게시글 삭제
	  * @return "boardFreeList"
	 */
	@RequestMapping(value= "/boardFreeDelete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam("bno") int bno, HttpSession session, Model model
			,SearchCriteria searchCriteria, RedirectAttributes rttr) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(sessionyn); // 로그인한 사용자의 id값
		
		//boardFreeService.delete(bno);
		rttr.addAttribute("page", searchCriteria.getPage());
		rttr.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		rttr.addAttribute("searchType", searchCriteria.getSearchType());
		rttr.addAttribute("keyword", searchCriteria.getKeyword());
		rttr.addFlashAttribute("msg", "delSuccess");
		return "redirect:/boardFreeListP"; 
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
		int bno = Integer.parseInt(request.getParameter("no")); //게시글 번호
		String warncontent =request.getParameter("warncontent"); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setBf_bno(bno);
		vo.setId(id);
		vo.setBf_warncontent(warncontent);
		
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
				BoardFreeVO freeVO, RedirectAttributes rttr) {

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
			return "redirect:/boardFreeListP";

		}
		
	// 자유게시판 글수정하기 - 수정 액션
		@RequestMapping(value = "/boardFreeUpdateAction", method = RequestMethod.POST)
		public String boardFreeUpdateAction(HttpSession session, HttpServletRequest request
				, BoardFreeVO freeVO, SearchCriteria searchCriteria, RedirectAttributes rttr ) {

			// bf_title, bf_source bf_content의 앞뒤 공백 제거
			freeVO.setBf_title(freeVO.getBf_title().trim());
			freeVO.setBf_source(freeVO.getBf_source().trim());
			freeVO.setBf_content(freeVO.getBf_content().trim());

			try {
				int result = boardFreeService.updateBoardFree(freeVO);
				rttr.addAttribute("page", searchCriteria.getPage());
				rttr.addAttribute("perPageNum", searchCriteria.getPerPageNum());
				rttr.addAttribute("searchType", searchCriteria.getSearchType());
				rttr.addAttribute("keyword", searchCriteria.getKeyword());
				if (result == 0) {
					return "redirect:/boardFreeUpdate?bf_bno=" + freeVO.getBf_bno();
				}
			} catch (Exception e) {
				System.out.println("ERROR : boardFreeUpdateAction - " + e.getMessage());
			}
			return "redirect:/boardFreeGet?bno=" + freeVO.getBf_bno();
		}
	
	
}//e_BoardFreeController class
