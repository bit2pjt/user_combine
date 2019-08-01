
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
 * @ 2019.07.24		박현민		one_get  부분 추가
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by Bit All right reserved.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.MemberVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService myPageService;

	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		int id = myPageService.getMemberId((String) session.getAttribute("m_email"));
		MemberVO member = (MemberVO) myPageService.getMember(id);
		model.addAttribute("member", member);
		
		// 1:1 문의내역
		List<OneVO> qnaList = null;
		qnaList = myPageService.getQnaList(id);
		model.addAttribute("qnaList", qnaList);

		return "mypage/mypage";
	}

	
	@RequestMapping(value = "/pw_confirm", method = RequestMethod.GET)
	public String pwConfirm(HttpSession session, Model model) {
		int id = myPageService.getMemberId((String) session.getAttribute("m_email"));

		MemberVO member = myPageService.getMember(id);

		model.addAttribute("member", member);

		return "mypage/pw_confirm";
	}

	
	@RequestMapping(value = "/member_info")
	public String memberInfo(Model model, int id) {
		MemberVO member = myPageService.getMember(id);

		String input_password = member.getM_password();
		System.out.println("input_pwd=" + input_password);		
		String member_password = member.getM_password();
		System.out.println("member_pwd=" + member_password);

		if (input_password.equals(member_password)) {
			model.addAttribute("member", member);
			
			return "mypage/member_info";
		} else {
			return "mypage/mypage";
		}
	}

	
	@RequestMapping(value = "/update_pw")
	public String updatePw(Model model, MemberVO memberVO, int id) {

		MemberVO member1 = myPageService.getMember(id);

		myPageService.updatePw(memberVO);

		member1 = myPageService.getMember(id);

		model.addAttribute("member1", member1);
		return "mypage/member_info";
	}

//	//���������� - ����� �г��� �ߺ� Ȯ��
//	@RequestMapping(value="/update_checknick")
//	public String updateCheckNick(Model model, String m_nickname, MemberVO memberVO,int id) {
//		int check = myPageService.checkNick(m_nickname);
//		MemberVO member = myPageService.getMember(id);
//		
//		model.addAttribute("check", check);
//		model.addAttribute("member1",member);
//		System.out.println("�ߺ�üũ " +check);
//		return "mypage/member_info";
//	}

	// ���������� - �г��Ӽ��
	@RequestMapping(value = "/update_nick")
	public String updateNick(Model model, int id, MemberVO memberVO) {
		MemberVO member1 = myPageService.getMember(id);
		myPageService.updateNick(memberVO);

		member1 = myPageService.getMember(id);

		model.addAttribute("member1", member1);

		return "mypage/member_info";
	}

	// ���������� - ȸ��������
	@RequestMapping(value = "/member_update")
	public String updateMember(Model model, HttpServletResponse response, MemberVO memberVO, int id) {
		MemberVO member1 = myPageService.getMember(id);
		myPageService.updateMember(memberVO);

		member1 = myPageService.getMember(id);

		model.addAttribute("member1", member1);

		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('ȸ���������Ϸ�');");
			out.println("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "mypage/member_info";
	}

	// 마이페이지 - 회원탈퇴
	@RequestMapping(value = "/member_out", method = RequestMethod.GET)
	public String memberOut() {
		return "mypage/member_out";
	}

	// 마이페이지 - 1:1 문의내역 리스트
	@RequestMapping(value = "/one_list", method = RequestMethod.GET)
	public String oneList(HttpServletRequest request, HttpSession session) {

		// 로그인 연동 후 삭제
		// 왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		// session.setAttribute("m_email", "bit0hyj@gmail.com");

		// 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email); // System.out.println("=============MyPageController.java=====================
																// m_name : " + m_name);
		request.setAttribute("m_name", m_name);

		// 1:1 문의내역
		List<OneVO> qnaList = null;
		int id = myPageService.getMemberId(m_email); // System.out.println("=============MyPageController.java=====================
														// id : " + id);
		qnaList = myPageService.getQnaList(id);
		request.setAttribute("qnaList", qnaList);
		return "mypage/one_list";
	}

	// 마이페이지 - 1:1 문의내역 리스트 - 1:1문의내역 등록
	@RequestMapping(value = "/one_register", method = RequestMethod.GET)
	public String oneRegister(HttpServletRequest request, HttpSession session, OneVO oneVO) {

		// 로그인 연동 후 삭제
		// 왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		// session.setAttribute("m_email", "bit0hyj@gmail.com");

		// 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email);
		String m_nickname = myPageService.getMemberNickname(m_email); // System.out.println("=============MyPageController.java=====================
																		// nickname : " + m_nickname);
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_nickname", m_nickname);

//		myPageService.insertQna(oneVO);

		return "mypage/one_register";
	}

	// 마이페이지 - 1:1 문의내역 리스트 - 1:1문의내역 등록 액션
	@RequestMapping(value = "/one_registerAction", method = RequestMethod.POST)
	public String oneRegisterAction(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			OneVO oneVO) {

		// 로그인 연동 후 삭제
		// 왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		// session.setAttribute("m_email", "bit0hyj@gmail.com");

		oneVO.setId(myPageService.getMemberId((String) session.getAttribute("m_email")));

		// qna_title, qna_content의 앞뒤 공백 제거
		oneVO.setQna_title(oneVO.getQna_title().trim());
		oneVO.setQna_content(oneVO.getQna_content().trim());

		try {
			int result = myPageService.insertQna(oneVO);
			if (result == 0) {
				return "redirect:/one_register";
			}
		} catch (Exception e) {
			System.out.println("ERROR : oneRegisterAction - " + e.getMessage());
		}
		return "redirect:/one_list";

	}

	// 마이페이지 - 1:1 문의내역 수정
	@RequestMapping(value = "/one_update", method = RequestMethod.GET)
	public String oneUpdate(HttpSession session, HttpServletRequest request) {
		// 로그인 연동 후 삭제
		// 왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		// session.setAttribute("m_email", "bit0hyj@gmail.com");
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email);
		String m_nickname = myPageService.getMemberNickname(m_email);

		// 사용자의 id를 가져옴
		int id = myPageService.getMemberId(m_email);

		// qna_no=?의 작성자와 일치하는지 확인 후 일치하면 수정페이지로, 불일치하면 리스트로
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		OneVO qnaDetail = myPageService.getQnaDetail(qna_no);

		if (id != qnaDetail.getId()) {
			return "redirect:/one_list";
		}

		request.setAttribute("m_name", m_name);
		request.setAttribute("m_nickname", m_nickname);
		request.setAttribute("qnaDetail", qnaDetail);

		return "mypage/one_update";
	}

	// 마이페이지 - 1:1 문의내역 수정 액션
	@RequestMapping(value = "/one_updateAction", method = RequestMethod.POST)
	public String oneUpdateAction(HttpSession session, HttpServletRequest request, OneVO oneVO) {

		// 로그인 연동 후 삭제
		// 왼쪽 메뉴 상단의 사용자 정보가져오기 위해 session에 강제로 email정보 저장
		// session.setAttribute("m_email", "bit0hyj@gmail.com");

		// qna_title, qna_content의 앞뒤 공백 제거
		oneVO.setQna_title(oneVO.getQna_title().trim());
		oneVO.setQna_content(oneVO.getQna_content().trim());

		try {
			int result = myPageService.updateQna(oneVO);
			if (result == 0) {
				return "redirect:/one_update?qna_no=" + oneVO.getQna_no();
			}
		} catch (Exception e) {
			System.out.println("ERROR : oneUpdateAction - " + e.getMessage());
		}
		return "redirect:/one_get?qna_no=" + oneVO.getQna_no();
	}

	// hm | 마이페이지 - FAQ
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 좌측 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email); // System.out.println("=============MyPageController.java=====================
		// m_name : " + m_name);
		request.setAttribute("m_name", m_name);
		
		return "mypage/faq";
	}

	
	// hm | 마이페이지 - one_get
	@RequestMapping(value = "/one_get", method = RequestMethod.GET)
	public String oneGet(HttpSession session, HttpServletRequest request,  OneVO oneVO) {
		// 1. 사용자 정보
		String m_email = (String) session.getAttribute("m_email");
		String m_name = myPageService.getMemberName(m_email);
		String m_nickname = myPageService.getMemberNickname(m_email);

		// 2. 문의내용
		int id = myPageService.getMemberId(m_email);

		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		OneVO qnaDetail = myPageService.getQnaDetail(qna_no);

		request.setAttribute("m_name", m_name);
		request.setAttribute("m_nickname", m_nickname);
		request.setAttribute("qnaDetail", qnaDetail);

		// 3. 답변내용
		OneAdVO qnaAdDetail = myPageService.getQnaAdDetail(qna_no);
		request.setAttribute("qnaAdDetail", qnaAdDetail);
		
		return "mypage/one_get";
	}


}