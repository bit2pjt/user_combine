package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/member_login.do", method=RequestMethod.GET)
	public String Loggin() {
		return "mypage/one_get";
	}
	@RequestMapping(value="/pw_confirm.do", method=RequestMethod.GET)
	public String pwConfirm() {
		return "mypage/pw_confirm";
	}
	
	@RequestMapping(value="/member_info.do", method=RequestMethod.GET)
	public String memberInfo() {
		return "mypage/member_info";
	}
	
	@RequestMapping(value="/member_out.do", method=RequestMethod.GET)
	public String memberOut() {
		return "mypage/member_out";
	}
	
	@RequestMapping(value="/one_list.do", method=RequestMethod.GET)
	public String oneList() {
		return "mypage/one_list";
	}
	
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faqList() {
		return "mypage/faq";
	}
	
	@RequestMapping(value="/one_register.do", method=RequestMethod.GET)
	public String oneRegister() {
		return "mypage/one_register";
	}
	
	@RequestMapping(value="/one_update.do", method=RequestMethod.GET)
	public String oneUpdate() {
		return "mypage/one_update";
	}
	
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}
	

	
}
