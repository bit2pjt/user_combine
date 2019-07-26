package com.spring.mml;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mypage.MyPageService;

@Controller
public class MmlController {
	
	@Autowired
	private MmlService mmlService;
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value="/mmlList.do", method=RequestMethod.GET)
	public String mmlList() {
		return "mml/mmlList";
	}
	
	@RequestMapping(value="/mmlGet.do", method=RequestMethod.GET)
	public String mmlGet() {
		return "mml/mmlGet";
	}
	
	@RequestMapping(value="/mmlWrite.do", method=RequestMethod.GET)
	public String mmlWrite(HttpSession session, Model model) 
	{
		String m_email = (String)session.getAttribute("m_email");
		System.out.println("=============MmlController.java===================== m_email : " + m_email);
		//세션이 없을경우 로그인페이지로 이동....근데 모달인데?
		if(m_email == null) {
			System.out.println("=============MyPageController.java===================== m_name == null : " + m_email);
			return "redirect:/index.do";
		}
		
		int id = myPageService.getMemberId(m_email);
		model.addAttribute("id", id);
		
		return "mml/mmlWrite";
	}
	
	@RequestMapping(value="/mmlWriteAction.do", method=RequestMethod.GET)
	public String mmlWriteAction(Mml_ContentVO mmlContentVO) 
	{
		//mml 작성이 성공적으로 완료되면 작성했던글을 볼 수 있게 연결
		return "mml/mmlGet";
	}
	@RequestMapping(value="/mmlFollowList.do", method=RequestMethod.GET)
	public String mmlFollow() {
		return "mml/mmlFollowList";
	}
	
	@RequestMapping(value="/mmlMemberList.do", method=RequestMethod.GET)
	public String mmlMember() {
		return "mml/mmlMemberList";
	}
}
