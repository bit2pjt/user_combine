package com.spring.mypage;
/**
 * @Class Name : MyPageController.java
 * @Description : MyPage Controller
 * @Modification Information
 * @
 * @  �닔�젙�씪     	  �닔�젙�옄                 �닔�젙�궡�슜
 * @ ---------   ---------   -------------------------------
 * @ 2019.07.0?     �솴吏꾩꽍      理쒖큹�깮�꽦
 * @ 2019.07.17     �븳�쑀吏�      �닚�꽌蹂�寃�, 媛� 硫붿꽌�뱶 蹂� 二쇱꽍異붽�(湲곕뒫�꽕紐�)
 * @ 2019.07.17     �븳�쑀吏�      �겢�옒�뒪紐� 蹂�寃�(LoginController -> MyPageController), 湲곕뒫援ы쁽
 * @author bit 2議�
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by Bit All right reserved.
 */

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.member.MemberVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	//마이페이지 첫화면
	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		
			String e_mail = (String) session.getAttribute("m_email");
			int id = myPageService.getMemberId(e_mail);
			MemberVO member = myPageService.getMember(id);
			System.out.println("멤바: " + member);
			model.addAttribute("member",member);
			return "mypage/mypage";
	}
	
	//마이페이지 - 이미지 업로드 및 수정
		@RequestMapping(value="image_upload.do")
		public String image() {
			return "mypage/mypage";
		}
		
		
		
		//마이페이지 - 비밀번호 재확인
	@RequestMapping(value="/pw_confirm.do", method=RequestMethod.GET)
	public String pwConfirm(HttpSession session, Model model) {
		int id = myPageService.getMemberId((String) session.getAttribute("m_email"));
		
		MemberVO member = myPageService.getMember(id);
		
		model.addAttribute("member",member);
		
		return "mypage/pw_confirm";
	}
	
	//마이페이지 - 비밀번호 재확인 - 회원정보 수정
		@RequestMapping(value="/member_info.do")
		public String memberInfo(MemberVO member, Model model, int id) {
			MemberVO member1 = myPageService.getMember(id);
			System.out.println("member1="+member1);
			// 클라이언트에서 입력한 비밀번호
			String input_password = member.getM_password();
			System.out.println("input_pwd="+input_password);
			// id로 검색한 member의 비밀번호
			String member_password = member1.getM_password();
			System.out.println("member_pwd="+member_password);
			
		
			
			if(input_password.equals(member_password)) {		
				model.addAttribute("member",member);
				model.addAttribute("member1",member1);
		
				System.out.println("넘긴다"+member1);
				return "mypage/member_info";
			}
			else {
				return "mypage/mypage";
			}
		}
		//마이페이지 - 비밀번호수정
	@RequestMapping(value="/update_pw.do")
	public String updatePw(Model model, MemberVO memberVO, int id) {
	
		MemberVO member1 = myPageService.getMember(id);
		
		myPageService.updatePw(memberVO);
		
		
		 member1 = myPageService.getMember(id);
		 
		model.addAttribute("member1",member1);
		return "mypage/member_info";
	}
	
	
	
	//마이페이지 - 닉네임수정
	@RequestMapping(value="/update_nick.do")
	public String updateNick(Model model, int id, MemberVO memberVO) {
		MemberVO member1 = myPageService.getMember(id);
		myPageService.updateNick(memberVO);
		
		 member1 = myPageService.getMember(id);
	
		model.addAttribute("member1",member1);
		
		return "mypage/member_info";
	}

	@RequestMapping(value="/member_update.do")
	public String updateMember(Model model, HttpServletResponse response, MemberVO memberVO, int id) {
		MemberVO member1 = myPageService.getMember(id);
		myPageService.updateMember(memberVO);
		
		 member1 = myPageService.getMember(id);
		 
		 model.addAttribute("member1",member1);
		
		
		
		return "mypage/member_info";
	}
	
	//마이페이지 - 회원탈퇴
	@RequestMapping(value="/member_out.do", method=RequestMethod.GET)
	public String memberOut() {
		return "mypage/member_out";
	}

	//마이페이지 - 1:1 문의내역 리스트
	@RequestMapping(value = "/one_list.do", method = RequestMethod.GET)
	public String oneList(HttpServletRequest request, HttpSession session) {

		// 濡쒓렇�씤 �뿰�룞 �썑 �궘�젣
		// �쇊履� 硫붾돱 �긽�떒�쓽 �궗�슜�옄 �젙蹂닿��졇�삤湲� �쐞�빐 session�뿉 媛뺤젣濡� email�젙蹂� ���옣
		//session.setAttribute("m_email", "bit0hyj@gmail.com");

		// �궗�슜�옄 �젙蹂�
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email); // System.out.println("=============MyPageController.java===================== m_name : " + m_name);
		request.setAttribute("m_name", m_name);

		
		// 1:1 臾몄쓽�궡�뿭
		List<OneVO> qnaList = null;
		int id = myPageService.getMemberId(m_email); // System.out.println("=============MyPageController.java===================== id : " + id);
		qnaList = myPageService.getQnaList(id);
		request.setAttribute("qnaList", qnaList);
		return "mypage/one_list";
	}

	
	// 留덉씠�럹�씠吏� - 1:1 臾몄쓽�궡�뿭 由ъ뒪�듃 - 1:1臾몄쓽�궡�뿭 �벑濡�
	@RequestMapping(value = "/one_register.do", method = RequestMethod.GET)
	public String oneRegister(HttpServletRequest request, HttpSession session, OneVO oneVO) {
		
		// 濡쒓렇�씤 �뿰�룞 �썑 �궘�젣
		// �쇊履� 硫붾돱 �긽�떒�쓽 �궗�슜�옄 �젙蹂닿��졇�삤湲� �쐞�빐 session�뿉 媛뺤젣濡� email�젙蹂� ���옣
		//session.setAttribute("m_email", "bit0hyj@gmail.com");

		// �궗�슜�옄 �젙蹂�
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email);
		String m_nickname = myPageService.getMemberNickname(m_email);	//System.out.println("=============MyPageController.java===================== nickname : " + m_nickname);
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_nickname", m_nickname);
		
		
//		myPageService.insertQna(oneVO);
		
		
		return "mypage/one_register";
	}
	
		// 留덉씠�럹�씠吏� - 1:1 臾몄쓽�궡�뿭 由ъ뒪�듃 - 1:1臾몄쓽�궡�뿭 �벑濡� �븸�뀡
		@RequestMapping(value = "/one_registerAction.do", method = RequestMethod.POST)
		public String oneRegisterAction(HttpSession session, HttpServletRequest request, HttpServletResponse response, OneVO oneVO){
			
			// 濡쒓렇�씤 �뿰�룞 �썑 �궘�젣
			// �쇊履� 硫붾돱 �긽�떒�쓽 �궗�슜�옄 �젙蹂닿��졇�삤湲� �쐞�빐 session�뿉 媛뺤젣濡� email�젙蹂� ���옣
			//session.setAttribute("m_email", "bit0hyj@gmail.com");
			
			oneVO.setId(myPageService.getMemberId((String) session.getAttribute("m_email")));

			//qna_title, qna_content�쓽 �븵�뮘 怨듬갚 �젣嫄�
			oneVO.setQna_title(oneVO.getQna_title().trim());
			oneVO.setQna_content(oneVO.getQna_content().trim());
			
			try {
				int result = myPageService.insertQna(oneVO);
				if(result == 0) {
					return "redirect:/one_register.do";
				}
			} catch (Exception e) {
				System.out.println("ERROR : oneRegisterAction - " + e.getMessage());
			}
			return "redirect:/one_list.do";
			
		}
	
	

	// 留덉씠�럹�씠吏� - 1:1 臾몄쓽�궡�뿭 �닔�젙
	@RequestMapping(value = "/one_update.do", method = RequestMethod.GET)
	public String oneUpdate(HttpSession session, HttpServletRequest request) {
		// 濡쒓렇�씤 �뿰�룞 �썑 �궘�젣
		// �쇊履� 硫붾돱 �긽�떒�쓽 �궗�슜�옄 �젙蹂닿��졇�삤湲� �쐞�빐 session�뿉 媛뺤젣濡� email�젙蹂� ���옣
		//session.setAttribute("m_email", "bit0hyj@gmail.com");
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email);
		String m_nickname = myPageService.getMemberNickname(m_email);
		
		// �궗�슜�옄�쓽 id瑜� 媛��졇�샂
		int id = myPageService.getMemberId(m_email);
		
		// qna_no=?�쓽 �옉�꽦�옄�� �씪移섑븯�뒗吏� �솗�씤 �썑 �씪移섑븯硫� �닔�젙�럹�씠吏�濡�, 遺덉씪移섑븯硫� 由ъ뒪�듃濡�
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		OneVO qnaDetail = myPageService.getQnaDetail(qna_no);
		
		if(id != qnaDetail.getId()) {
			return "redirect:/one_list.do";
		}
		
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_nickname", m_nickname);
		request.setAttribute("qnaDetail", qnaDetail);
		
		return "mypage/one_update";
	}
	
	
	// 留덉씠�럹�씠吏� - 1:1 臾몄쓽�궡�뿭 �닔�젙 �븸�뀡
		@RequestMapping(value = "/one_updateAction.do", method = RequestMethod.POST)
		public String oneUpdateAction(HttpSession session, HttpServletRequest request, OneVO oneVO) {
			
			// 濡쒓렇�씤 �뿰�룞 �썑 �궘�젣
			// �쇊履� 硫붾돱 �긽�떒�쓽 �궗�슜�옄 �젙蹂닿��졇�삤湲� �쐞�빐 session�뿉 媛뺤젣濡� email�젙蹂� ���옣
			//session.setAttribute("m_email", "bit0hyj@gmail.com");
			
			//qna_title, qna_content�쓽 �븵�뮘 怨듬갚 �젣嫄�
			oneVO.setQna_title(oneVO.getQna_title().trim());
			oneVO.setQna_content(oneVO.getQna_content().trim());
			
			try {
				int result = myPageService.updateQna(oneVO);
				if(result == 0) {
					return "redirect:/one_update.do?qna_no="+oneVO.getQna_no();
				}
			} catch (Exception e) {
				System.out.println("ERROR : oneUpdateAction - " + e.getMessage());
			}
			return "redirect:/one_get.do?qna_no="+oneVO.getQna_no();
		}

			// 留덉씠�럹�씠吏� - FAQ
		@RequestMapping(value = "/one_get.do", method = RequestMethod.GET)
		public String oneGet() {
			return "mypage/one_get";
		}
		
		// 留덉씠�럹�씠吏� - FAQ
		@RequestMapping(value = "/faq.do", method = RequestMethod.GET)
		public String faqList() {
			return "mypage/faq";
		}


}
