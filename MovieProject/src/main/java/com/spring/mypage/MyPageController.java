package com.spring.mypage;
/**
 * @Class Name : MyPageController.java
 * @Description : MyPage Controller
 * @Modification Information
 * @
 * @  수정일     	  수정자                 수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.0?     황진석      최초생성
 * @ 2019.07.17     한유진      순서변경, 각 메서드 별 주석추가(기능설명)
 * @ 2019.07.17     한유진      클래스명 변경(LoginController -> MyPageController), 기능구현
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by Bit All right reserved.
 */


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	//마이페이지 첫화면
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		
		return "mypage/mypage";
	}
	
	//마이페이지 - 비밀번호 재확인
	@RequestMapping(value="/pw_confirm.do", method=RequestMethod.GET)
	public String pwConfirm(Model model) {
		
		return "mypage/pw_confirm";
	}
	
	//마이페이지 - 비밀번호 재확인 - 회원정보 수정
	@RequestMapping(value="/member_info.do", method=RequestMethod.GET)
	public String memberInfo(MemberVO vo, RedirectAttributes rttr, HttpSession session, HttpServletResponse response) {
		boolean result = myPageService.checkPw(vo.getM_email(), vo.getM_password());
		if(result) {//비밀번호가 일치하면 사이트 이동
			System.out.println("비밀번호 일치");
			return "mypage/member_info";
		}else {
			System.out.println("비밀번호 불일치");
			
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			

			return "redirect:/pw_confirm.do";
		}
		
	}
	
	//마이페이지 - 회원탈퇴 (링크이동)
	@RequestMapping(value="/member_out.do", method=RequestMethod.GET)
	public String memberOut() {
			return "mypage/member_out";
	}
	
	//마이페이지 - 회원탈퇴 (컨트롤러)
	
	@RequestMapping(value="/member_delete.do", method=RequestMethod.GET)
	public String memberOutController(MemberVO vo, RedirectAttributes rttr, HttpSession session) {
		session.setAttribute("m_email", "bit0hyj@gmail.com");
		session.setAttribute("m_password", "1234");
		session.setAttribute("id", "1");
		// 임시로 이메일값을 준다.
		
		String m_email = (String)session.getAttribute("m_email");
		String m_password = (String)session.getAttribute("m_password");
		String id = (String)session.getAttribute("id");
		
		System.out.println("m_email:" + m_email);
		System.out.println("m_password:" + m_password);
		System.out.println("id:"+id);
		
		int num = myPageService.delete_member(m_email);
		int id_num = myPageService.delete_date(id);  
		
		rttr.addFlashAttribute("delete_msg","탈퇴가 왼료되었습니다.");
		
		// 로그아웃으로 세션들을 초기화시킴
		session.invalidate();
		
		return "index";
	}
	
	
	//마이페이지 - 1:1 문의내역 리스트
	@RequestMapping(value="/one_list.do", method=RequestMethod.GET)
	public String oneList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		//왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		session.setAttribute("email", "bit0hyj@gmail.com");
		
		//사용자 정보
		String m_email = (String)session.getAttribute("email");
		String m_name = myPageService.getMemberName(m_email);	//System.out.println("=============MyPageController.java=====================  m_name : " + m_name);
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_email", m_email);
		
		//1:1 문의내역
		
		
		return "mypage/one_list";
	}
	
	//마이페이지 - 1:1 문의내역 - 1:1 문의내역 상세보기
	@RequestMapping(value="/one_get.do", method=RequestMethod.GET)
	public String Loggin() {
		return "mypage/one_get";
	}
	
	//마이페이지 - 1:1 문의내역 리스트 - 1:1문의내역 등록
	@RequestMapping(value="/one_register.do", method=RequestMethod.GET)
	public String oneRegister() {
		return "mypage/one_register";
	}
	
	//마이페이지 - 1:1 문의내역 수정
	@RequestMapping(value="/one_update.do", method=RequestMethod.GET)
	public String oneUpdate() {
		return "mypage/one_update";
	}
	
	//마이페이지 - FAQ
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faqList() {
		return "mypage/faq";
	}
	
	

	
}
