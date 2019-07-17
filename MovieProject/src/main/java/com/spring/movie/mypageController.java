package com.spring.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
* @Class Name : mypageController.java
* @Description : mypage 컨트롤러 
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.06         황진석      	최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@Controller
public class mypageController {
	
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
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
	
	@RequestMapping(value="/one_register.do", method=RequestMethod.GET)
	public String oneRegister() {
		return "mypage/one_register";
	}
	
	@RequestMapping(value="/one_get.do", method=RequestMethod.GET)
	public String oneGet() {
		return "mypage/one_get";
	}
	
	@RequestMapping(value="/one_update.do", method=RequestMethod.GET)
	public String oneUpdate() {
		return "mypage/one_update";
	}
	
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faqList() {
		return "mypage/faq";
	}
	

	

	
}
