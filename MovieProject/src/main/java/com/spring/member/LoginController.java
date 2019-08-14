package com.spring.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name : LoginController.java
 * @Description : login관련 컨트롤러
 * @Modification Information
 * 
 * @    수정일         수정자                  수정내용 
 * @ -----------    ---------    ------------------------------- 
 * @ 2019.07.15       황진석        최초생성 
 * @ 2019.07.16       황진석        로그인/로그아웃, 이메일 찾기 컨트롤러 추가 
 * @ 2019.07.17       황진석 
 * @ 2019.07.22       이웅식        회원가입 + 가입시 메일&닉네임 중복확인 구현 
 * @ 2019.07.26       이웅식        login 성공시 id 코드를 세션값에 추가하도록 수정
 * @ 2019.08.02       한유진        수정
 * @ 2019.08.02       한유진        member 최종 수정
 * 
 * 
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *      Copyright (C) by Bit All right reserved.
 */

@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;

	//index 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		List<MovieChartVO> getCGV = memberService.getCGV();
		List<MovieChartVO> getNaver = memberService.getNaver();
		List<MovieChartVO> getDaum = memberService.getDaum();
		
		model.addAttribute("cgvList", getCGV);
		model.addAttribute("naverList", getNaver);
		model.addAttribute("daumList", getDaum);
		
		return "index";
	}
	//index 페이지
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model, Model model1) throws IOException {
		List<MovieChartVO> getCGV = memberService.getCGV();
		List<MovieChartVO> getNaver = memberService.getNaver();
		List<MovieChartVO> getDaum = memberService.getDaum();
		
		model.addAttribute("cgvList", getCGV);
		model.addAttribute("naverList", getNaver);
		model.addAttribute("daumList", getDaum);
		
		return "index";
	}
	
	//로그인 액션
	/**
	 * 로그인
	 * 
	 * @param vo       - 로그인시 입력한 정보가 담긴 MemberVO
	 * @param request
	 * @param response
	 * @param model
	 * @return "index"
	 * @throws Exception
	 */
	@RequestMapping(value = "/Login")
	public String MemberLogin(MemberVO vo, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String email = vo.getM_email();
		String pw = vo.getM_password();
		HttpSession session = request.getSession();

		int check = memberService.userCheck(email, pw);	//로그인 성공 여부
		
		if (check == 1) {	//로그인 성공시 메일인증여부 체크
			String auth = memberService.getCert(email,pw);	//이메일 인증 여부
			if(auth.equals("Y")) {	//메일인증 성공시 탈퇴여부 체크
				String deleteyn = memberService.getDeletestatus(email,pw);	//탈퇴 여부
				if(deleteyn.equals("N")) {
					session.setAttribute("m_email", email);
					session.setAttribute("id", memberService.getId(email, pw));
					request.setAttribute("msg", "login_success");
					request.setAttribute("rlink", "index");
				}else {
					request.setAttribute("msg", "login_delete");
					request.setAttribute("rlink", "index");
					//model.addAttribute("msg","delete");
				}
			}else {
				request.setAttribute("msg", "login_cert");
				request.setAttribute("rlink", "index");
				//model.addAttribute("msg","cert");
			}
		}else if (check == -1) {
			request.setAttribute("msg", "login_pw");
			request.setAttribute("rlink", "index");
			//model.addAttribute("msg","pw");
		} else {
			request.setAttribute("msg", "login_idpw");
			request.setAttribute("rlink", "index");
			//model.addAttribute("msg","idpw");
		}
		return "member/login_alert";
	}

	//로그아웃 액션
	/**
	 * 로그아웃
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return "index"
	 */
	@RequestMapping(value = "/Logout")
	public String MemberLogOut(HttpServletRequest request, HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index";
	}

	//회원가입 페이지
	@RequestMapping(value="/memberJoinP", method = RequestMethod.GET)
	public String memberJoinP() {
		return "member/member_join";
	}
	//회원가입 액션
	@RequestMapping(value="/memberJoinPAction", method = RequestMethod.POST)
	public String memberJoinActionP(MemberVO memberVO, HttpServletResponse response, HttpServletRequest request) throws IOException{
		System.out.println("memberVO : " + memberVO);
		try {
			memberService.memberJoin(memberVO);
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('회원가입이 완료되었습니다.\\n가입한 메일로 인증메일이 발송됩니다.\\n메일함을 확인해주세요.\\n10분내에 메일을 받지못했을 경우 관리자에게 문의해주세요.');");
//			out.println("</script>");
			request.setAttribute("msg", "join_success");
			request.setAttribute("rlink", "index");
		}catch (Exception e) {
			//response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('회원가입에 실패했습니다. 관리자에게 문의해주세요.');");
//			out.println("</script>");
			request.setAttribute("msg", "join_fail");
			request.setAttribute("rlink", "memberJoinP");
			//return "redirect:/memberJoinP";
			
		}
		return "member/login_alert";
	}
	
	//이메일 찾기 페이지
	@RequestMapping(value="/memberSearchEmailP", method = RequestMethod.GET)
	String memberSearchEmailP() {
		return "member/member_search_email";
	}
	//이메일 찾기 액션
	/**
	 * 이메일 찾기
	 * 
	 * @param vo       - 아이디 찾기 시 입력한 정보가 담긴 MemberVO
	 * @param request
	 * @param response
	 * @param model
	 * @return String
	 */
	@RequestMapping(value = "/id_find", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String id_find(MemberVO vo, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		System.out.println(vo.getM_name());
		System.out.println(vo.getM_phone());
		String email = memberService.findEmail(vo);
		if (email.equals("fail"))
			return "fail";
		else
			return email;
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/memberSearchPwP", method = RequestMethod.GET)
	public String memberSearchPwP() {
		return "member/member_search_pw";
	}
	
	//비밀번호 찾기 액션
	/**
	 * 비밀번호 찾기
	 * 
	 * @param vo       - 비밀번호 찾기 시 입력한 정보가 담긴 MemberVO
	 * @param request
	 * @param response
	 * @param model
	 * @return String
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/pw_find", method = RequestMethod.GET)
	public @ResponseBody String pw_find(MemberVO vo, HttpServletRequest request, HttpServletResponse response,
			Model model) throws UnsupportedEncodingException, MessagingException {
		/*
		 * 1. 입력한 이메일, 이름, 전화를 가지고 해당 이메일 주소로 6자리의 임시비밀번호를 발급한다.
		 */
		String result = memberService.findPw(vo);
		
		return result;
	}
	
	//회원가입 이메일 인증 액션
	@RequestMapping(value="joinConfirm", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("memberVO") MemberVO memberVO, Model model) throws Exception {
		/*
		//memberVO.setM_auth_status(1);	// authstatus를 1로,, 권한 업데이트
		System.out.println("emailConfirm() - memberVO : " + memberVO + "\n, " + memberVO.getId());
		
		//인증이 완료되면 기존의 인증키는 지워줘 -> 한번 인증하고나면 그다음엔 인증이 이루어지지 않도록
		String m_cert = memberService.getAuthstatus_id(memberVO.getId());
		if(m_cert.equals("N")) {
			memberVO.setM_cert("Y");
			memberService.updateAuthstatus(memberVO);
		}
		model.addAttribute("m_cert", m_cert);
		*/
		/*
		 * 1. 주소의 파라미터값(id, m_email, m_authkey) 중  id를 이용해 db의 m_authkey를 가져온다.
		 * 2. db의 m_authkey와 파라미터의 m_authkey가 일치하는지 체크한다.
		 * 3. 일치할 경우 해당 아이디의 m_cert를 "Y"로 변경한 후 db의 m_authkey를 제거한다.
		 * 4. 일치하지 않을 경우
		 * 		1. 파라미터의 id를 이용해 db에서 m_cert값을 가져와서 "Y"일 경우 이미 인증된 회원입니다! 뿅 뜨게 해주기
		 * 		2. m_cert값이 "N"일 경우 관리자에게 문의해주세요 뜨게해주기
		 * 
		 */
		String m_authkey = memberService.getAuthkey(memberVO.getId());
		if(m_authkey.equals(memberVO.getM_authkey())) {
			memberVO.setM_cert("Y");
			memberService.updateCert(memberVO);
			memberService.deleteAuthkey(memberVO);
			model.addAttribute("confirm", "success");
		}else {
			String m_cert = memberService.getCertById(memberVO.getId());
			if(m_cert.equals("Y")) {
				model.addAttribute("confirm", "before");
			}else {
				model.addAttribute("confirm", "fail");
			}
		}
		return "member/joinConfirm";
	}
	
	//이메일 중복 체크 ajax
	@RequestMapping(value = "/email_overlap_chk", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String emailOverlapChk(@RequestParam(value = "m_email") String m_email,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		MemberVO vo = new MemberVO();
		vo.setM_email(m_email);
		System.out.println("입력된 값은 =" + vo.getM_email());
		if (memberService.emailOverlapChk(vo)) {
			return "success";
		} else {
			return "fail";
		}
	}

	//닉네임 중복 체크 ajax
	@RequestMapping(value = "/nick_overlap_chk", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String nickOverlapChk(@RequestParam(value = "m_nickname") String m_nickname,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		MemberVO vo = new MemberVO();
		vo.setM_nickname(m_nickname);
		System.out.println("입력된 값은 =" + vo.getM_nickname());
		if (memberService.nickOverlapChk(vo)) {
			return "success";
		} else {
			return "fail";
		}
	}
}