package com.spring.boardShare;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.boardFree.BoardFreeService;
import com.spring.boardFree.BoardFreeServiceImpl;
import com.spring.boardFree.BoardFreeVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberService;
import com.spring.member.MemberVO;
import com.spring.mml.MmlService;
import com.spring.paging.PageMaker;
import com.spring.paging.SearchCriteria;

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
	
	@Autowired 
	BoardFreeService boardFreeService;
	
	@Autowired
	MmlService mmlService;

	
	
	/**
	  * 나눔 게시판 리스트로 이동
	  * @return "boardFreeList"
	 */
	
	@RequestMapping(value = "/boardShareListP", method=RequestMethod.GET)
	public String getListPageP(Model model,@ModelAttribute("searchCriteria") 
		SearchCriteria searchCriteria) {
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(boardShareService.countSearchedArticles(searchCriteria));
        
        model.addAttribute("boardshare", boardShareService.listSearch(searchCriteria));
        model.addAttribute("pageMaker", pageMaker);	
        
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
	public String boardShareGet(@RequestParam("bno") int bno, HttpSession session, Model model
			,  @ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {
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
		model.addAttribute("boardListDaily", boardFreeService.boardListDaily());//오른쪽의 실시간 베스트5
		model.addAttribute("bt_type","Today");
		model.addAttribute("mmlTop3", mmlService.getMmlList_like_top3(boardShareVO.getId()));
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
	
	// 나눔게시판 글쓰기
		@RequestMapping(value = "/boardShareWrite", method = RequestMethod.GET)
		public String shareWrite(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria, HttpSession session, HttpServletRequest request) {
			// 사용자 정보
			String m_email = (String) session.getAttribute("m_email");
			String m_nickname = boardShareService.getMemberNickname(m_email); // System.out.println("=============MyPageController.java=====================
																			// nickname : " + m_nickname);
			request.setAttribute("m_nickname", m_nickname);

			return "board/share/boardShareWrite";
		}

		// 나눔게시판 글쓰기 - 새글 등록 액션
		@RequestMapping(value = "/boardShareWriteAction", method = RequestMethod.POST)
		public String boardShareWriteAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
				BoardShareVO shareVO, RedirectAttributes rttr) {

			shareVO.setId(boardShareService.getMemberId((String) session.getAttribute("m_email")));

			// bs_title, bs_content의 앞뒤 공백 제거
			shareVO.setBs_title(shareVO.getBs_title().trim());
			shareVO.setBs_content(shareVO.getBs_content().trim());

			try {
				int result = boardShareService.insertBoardShare(shareVO);
				if (result == 0) {
					return "redirect:/boardShareWrite";
				}
			} catch (Exception e) {
				System.out.println("ERROR : boardShareWriteAction - " + e.getMessage());
			}
			return "redirect:/boardShareListP";

		}

		// 나눔게시판 글수정하기
		@RequestMapping(value = "/boardShareUpdate", method = RequestMethod.GET)
		public String boardShareUpdate(@RequestParam("bno") int bno, HttpSession session, HttpServletRequest request
				, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {

			String m_email = (String) session.getAttribute("m_email");

			// 사용자의 id를 가져옴
			int id = boardShareService.getMemberId(m_email);

			BoardShareVO selectBoardShare = boardShareService.selectBoardShare(bno);
			
			if (id != selectBoardShare.getId()) {
				return "redirect:/boardShareListP";
			}
			
			request.setAttribute("selectBoardShare", selectBoardShare);

			return "board/share/boardShareUpdate";

		}

		// 나눔게시판 글수정하기 - 수정 액션
		@RequestMapping(value = "/boardShareUpdateAction", method = RequestMethod.POST)
		public String boardShareUpdateAction(HttpSession session, HttpServletRequest request, BoardShareVO shareVO
				 ,SearchCriteria searchCriteria, RedirectAttributes rttr) {

			// bs_title, bs_content의 앞뒤 공백 제거
			shareVO.setBs_title(shareVO.getBs_title().trim());
			shareVO.setBs_content(shareVO.getBs_content().trim());

			try {
				int result = boardShareService.updateBoardShare(shareVO);
				rttr.addAttribute("page", searchCriteria.getPage());
				rttr.addAttribute("perPageNum", searchCriteria.getPerPageNum());
				rttr.addAttribute("searchType", searchCriteria.getSearchType());
				rttr.addAttribute("keyword", searchCriteria.getKeyword());
				if (result == 0) {
					return "redirect:/boardShareUpdate?bs_bno=" + shareVO.getBs_bno();
				}
			} catch (Exception e) {
				System.out.println("ERROR : boardShareUpdateAction - " + e.getMessage());
			}
			return "redirect:/boardShareGet?bno=" + shareVO.getBs_bno();
		}
}
