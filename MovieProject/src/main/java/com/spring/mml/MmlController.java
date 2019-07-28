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
		//System.out.println("=============MmlController.java===================== m_email : " + m_email);
		//세션이 없을경우 로그인페이지로 이동....근데 모달인데?
		if(m_email == null) {
			//System.out.println("=============MyPageController.java===================== m_name == null : " + m_email);
			return "redirect:/index.do";
		}
		
		int id = myPageService.getMemberId(m_email);
		model.addAttribute("id", id);
		
		return "mml/mmlWrite2";
	}
	
	@RequestMapping(value="/mmlWriteAction.do", method=RequestMethod.POST)
	public String mmlWriteAction(Mml_ContentVO mmlContentVO) 
	{
		//mml 작성이 성공적으로 완료되면 작성했던글을 볼 수 있게 연결
		//넘어온 값을 토대로 db에 넣는 작업 진행
		//System.out.println("=============MmlController.java===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		//mml_title, mml_content의 앞뒤 공백 제거
		mmlContentVO.setMml_title(mmlContentVO.getMml_title().trim());
		
		try {
			int result = mmlService.insertMml(mmlContentVO);
			if(result == 0) {
				return "redirect:/mmlWrite.do";
			}
		} catch (Exception e) {
			System.out.println("ERROR : MmlWriteAction - " + e.getMessage());
		}
		//작성자의 개인 mmlList로 이동하게 추후 링크조정
		return "redirect:/mmlList.do";
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
