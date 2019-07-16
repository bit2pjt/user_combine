package com.spring.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
* @Class Name : LoginController.java
* @Description : login관련 컨트롤러 
* @Modification Information
* @
* @  수정일     		     수정자            		수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.15         황진석      		최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * 로그인
	 * @param vo - 로그인시 입력한 정보가 담긴 MemberVO
	 * @param request
	 * @param response
	 * @param model
	 * @return "index"
	 * @throws Exception 
	 */
	@RequestMapping(value="/Login.do")
	public String MemberLogin(MemberVO vo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String email= vo.getM_email();
		String pw = vo.getM_password();
		HttpSession session = request.getSession();
		
		int check = memberService.userCheck(email, pw);
		if(check == 1){
			session.setAttribute("email", email);
			return "index";
		}else if( check == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다. 확인해주세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "index";
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 혹은 비밀번호가 다릅니다. 확인해주세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "index";
		}
	}
	
	@RequestMapping(value="/Logout.do")
	public String MemberLogOut(HttpServletRequest request, HttpServletResponse response, Model model)  {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value="/MeberEmailCheck.do")
	public String MemberEmailCheck() {
		
		return "";
	}
}
