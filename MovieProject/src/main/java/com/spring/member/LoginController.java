package com.spring.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
* @Class Name : LoginController.java
* @Description : login愿��젴 而⑦듃濡ㅻ윭 
* @Modification Information
* @
* @  	�닔�젙�씪               	 �닔�젙�옄                  	�닔�젙�궡�슜
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 15         �솴吏꾩꽍            		理쒖큹�깮�꽦
* @ 2019. 07. 16 	�솴吏꾩꽍				濡쒓렇�씤/濡쒓렇�븘�썐, �씠硫붿씪 李얘린 而⑦듃濡ㅻ윭 異붽�
* @ 2019. 07. 17 	�솴吏꾩꽍				
* @author bit 2議�
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
    * 濡쒓렇�씤
    * @param vo - 濡쒓렇�씤�떆 �엯�젰�븳 �젙蹂닿� �떞湲� MemberVO
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
         out.println("alert('鍮꾨�踰덊샇媛� �떎由낅땲�떎. �솗�씤�빐二쇱꽭�슂!');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return "index";
      }else {
         response.setContentType("text/html; charset=utf-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('�븘�씠�뵒 �샊�� 鍮꾨�踰덊샇媛� �떎由낅땲�떎. �솗�씤�빐二쇱꽭�슂!');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return "index";
      }
   }
   
   /**
    * 濡쒓렇�븘�썐
    * @param request
    * @param response
    * @param model
    * @return "index"
    */
   @RequestMapping(value="/Logout.do")
   public String MemberLogOut(HttpServletRequest request, HttpServletResponse response, Model model)  {
      HttpSession session = request.getSession();
      session.invalidate();
      return "index";
   }
   
   /**
    * �씠硫붿씪 李얘린
    * @param vo - �븘�씠�뵒 李얘린 �떆 �엯�젰�븳 �젙蹂닿� �떞湲� MemberVO
    * @param request
    * @param response
    * @param model
    * @return String
    */
   @RequestMapping(value="/id_find.do", method=RequestMethod.GET, produces="application/json")
   public @ResponseBody String id_find(MemberVO vo, HttpServletRequest request, HttpServletResponse response, Model model) {  
	   String phone = request.getParameter("m_phone1") + request.getParameter("m_phone2") + request.getParameter("m_phone3");
	   vo.setM_phone(phone);
	   String email = memberService.findEmail(vo);
	   if(email == "fail")
		  return "fail";
	   else
		  return email;
   }
   
   /**
    * 鍮꾨�踰덊샇 李얘린
    * @param vo - 鍮꾨�踰덊샇 李얘린 �떆 �엯�젰�븳 �젙蹂닿� �떞湲� MemberVO
    * @param request
    * @param response
    * @param model
    * @return String
    */
   @RequestMapping(value="/pw_find.do", method=RequestMethod.GET, produces="application/json")
   public @ResponseBody String pw_find(MemberVO vo, HttpServletRequest request, HttpServletResponse response, Model model) {  
	   String phone = request.getParameter("m_phone1") + request.getParameter("m_phone2") + request.getParameter("m_phone3");
	   vo.setM_phone(phone);
	   MemberVO memberVO = memberService.findPw(vo);
	   
	   if(memberVO != null) {
		   return "success";
	   }else {
		   return "fail";
	   }
	}
   @PostMapping("/memberJoin.do") 
   String memberJoin(MemberVO vo, HttpServletRequest request, HttpServletResponse response) {
	   String phone = request.getParameter("m_phone1") + request.getParameter("m_phone2") + request.getParameter("m_phone3");
	   vo.setM_phone(phone);
	   memberService.memberJoin(vo);
	   	   
	   return "index";
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}