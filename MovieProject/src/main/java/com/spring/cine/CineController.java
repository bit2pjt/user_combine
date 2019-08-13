package com.spring.cine;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;

@Controller
public class CineController {

	@Autowired
	CineService cineService;
	
	@RequestMapping(value="/cinemaList", method=RequestMethod.GET)
	public String cinemaList(Model model, HttpSession session){
		String sessionyn = (String)session.getAttribute("m_email");
		if(sessionyn != null) {
			int id = cineService.getUser(sessionyn); // 로그인한 사용자의 id값
			model.addAttribute("id", id);
		}
			
		model.addAttribute("sessionyn",sessionyn);
		return "event/cinemaList";
	}
	
	@ResponseBody
	@RequestMapping(value="/cineLocal", method=RequestMethod.GET)
	public List<String> cineLocal(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);
		
		List<String> list = cineService.getLocalName(cineVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/cineName", method=RequestMethod.GET)
	public List<String> cineName(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum ,@RequestParam("cc_local_name") String cc_local_name) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);
		cineVO.setCC_LOCAL_NAME(cc_local_name);
		List<String> list = cineService.getName(cineVO);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCineInfo", method=RequestMethod.GET)
	public CineVO getCineInfo(@RequestParam("cc_brand") String cc_brand, @RequestParam("cc_localnum") int cc_localnum 
			,@RequestParam("cc_local_name") String cc_local_name, @RequestParam("cc_name") String cc_name) {
		CineVO cineVO = new CineVO();
		cineVO.setCC_BRAND(cc_brand);
		cineVO.setCC_LOCALNUM(cc_localnum);
		cineVO.setCC_LOCAL_NAME(cc_local_name);
		cineVO.setCC_NAME(cc_name);
		CineVO list = cineService.getCineInfo(cineVO);
		
		return list;
	}
	
	/**
	  * 댓글 추천/비추천기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value = "/CineReplyReco", method=RequestMethod.POST)
	public String BFReplyReco(HttpSession session, HttpServletRequest request) { 
		String sessionyn = (String)session.getAttribute("m_email");
		int id = cineService.getUser(sessionyn); // 로그인한 사용자의 id값
		int cr_code = Integer.parseInt(request.getParameter("cr_code")); //게시글 번호
		int type = Integer.parseInt(request.getParameter("type")); // 추천:1, 비추천:0
		
		ThumbVO vo = new ThumbVO();
		vo.setCr_code(cr_code); // 댓글 번호
		vo.setId(id); // 댓글 쓴 사람의 id
		vo.setCr_thumb(type); // 1: 추천, 0: 비추천
		
		if( type == 1) { // 추천을 눌렀을 경우
			// mr_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = cineService.reply_check(vo); 
			return msg;
		}else { // 비추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = cineService.reply_check(vo);
			return msg;
		}
	}
	
	/**
	  * 댓글 신고 기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value="/CineReplyWarn", method=RequestMethod.POST)
	public String BFReplyWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = cineService.getUser(sessionyn); // 로그인한 사용자의 id값
		int cr_code = Integer.parseInt(request.getParameter("cr_code")); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setCr_code(cr_code);
		vo.setId(id);
		
		String msg = cineService.ReplyWarn(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}
}
