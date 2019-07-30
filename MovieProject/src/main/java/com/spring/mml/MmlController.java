package com.spring.mml;

import javax.servlet.http.HttpServletRequest;
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
	
<<<<<<< HEAD
	@RequestMapping(value="/mmlWrite.do", method=RequestMethod.GET)
=======
	////////////////
  //유진 개발부분//
  ////////////////
  @RequestMapping(value="/mmlWrite.do", method=RequestMethod.GET)
>>>>>>> 28271b0d0e081572f443e04d368e47f64fdb6e87
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
	
	@RequestMapping(value="/mmlUpdate.do", method=RequestMethod.GET)
	public String mmlUpdate(HttpSession session, HttpServletRequest request, Model model) 
	{
		String m_email = (String)session.getAttribute("m_email");
		//System.out.println("=============MmlController.java===================== m_email : " + m_email);
		//세션이 없을경우 로그인페이지로 이동....근데 모달인데?
		if(m_email == null) {
			//System.out.println("=============MyPageController.java===================== m_name == null : " + m_email);
			return "redirect:/index.do";
		}
		
		int mml_num = Integer.parseInt((String)request.getParameter("mml_num"));
		Mml_ContentVO mmlContentVO = mmlService.getMmlContent(mml_num);
		//System.out.println("=============MyPageController.java - mmlUpdate()===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		//System.out.println("=============MyPageController.java - mmlUpdate()===================== myPageService.getMemberId(m_email) : " + myPageService.getMemberId(m_email));
		//본인이 작성한 mml이 아닐경우 수정 불가능하게
		if(mmlContentVO.getId() != myPageService.getMemberId(m_email)) {
			//alert창 띄워주면 더 조오치
			return "redirect:/mmlGet.do?mml_num="+mmlContentVO.getMml_num();
		}
		model.addAttribute("mmlContentVO", mmlContentVO);
		
		return "mml/mmlUpdate";
	}
	
	@RequestMapping(value="/mmlUpdateAction.do", method=RequestMethod.POST)
	public String mmlUpdateAction(HttpServletRequest request, Mml_ContentVO mmlContentVO) 
	{
		//System.out.println("=============MyPageController.java - mmlUpdateAction()===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		try {
			int result = mmlService.updateMml(mmlContentVO);
			if(result == 0) {
				
				return "redirect:/mmlUpdate.do?mml_num="+mmlContentVO.getMml_num();
			}
		} catch (Exception e) {
			System.out.println("ERROR : mmlUpdateAction - " + e.getMessage());
		}
		return "redirect:/mmlGet.do?mml_num="+mmlContentVO.getMml_num();
	}
	
<<<<<<< HEAD
	@RequestMapping(value="/mmlFollowList.do", method=RequestMethod.GET)
	public String mmlFollow() {
		return "mml/mmlFollowList";
	}
	
=======
		
>>>>>>> 28271b0d0e081572f443e04d368e47f64fdb6e87
	@RequestMapping(value="/mmlMemberList.do", method=RequestMethod.GET)
	public String mmlMember() {
		return "mml/mmlMemberList";
	}
<<<<<<< HEAD
=======
  
  /////////////////////////////////////
  // 개발부분 : mmlGet.jsp의 서비스들//
  /////////////////////////////////////
 
  //1. getpage
  @RequestMapping(value="/mmlGet.do", method=RequestMethod.GET)
	public String mmlGet(@RequestParam("mml_num") int mml_num, Model model) {
		System.out.println("나영리 게시글 " +mml_num + " 넘어옴" );
		mmlService.upCounter(mml_num);//조회수 1 증가
		Mml_ContentVO content = mmlService.getPage(mml_num); //참조변수이므로 null값이 들어오면 문제된다
		
		model.addAttribute("mml_content", content ); //반환값이 null이면, null값을 그대로 요소에 담아 보낸다
		model.addAttribute("member", mmlService.getMemberInfo(content.getId()));
	
		return "mml/mmlGet";
	}
  
  //2. 게시글 삭제처리
  @GetMapping("/mmlDelete.do")
	public String mmlDelete(@RequestParam("mml_num")int mml_num, HttpServletResponse response) {
		mmlService.mmlDelete(mml_num);
		System.out.println(mml_num+" 번 나영리 게시물 삭제. 리스트 페이지로 Redirect");
		//알림창으로 삭제되었음을 통지할까??
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        out.println("<script>");
        out.println("alert('게시글이 삭제되었습니다.');");
        out.println("location.replace('/movie/mmlList.do')");
        out.println("</script>");
        out.close();
		return "redirect:/mmlList.do";
	}
  
  ////////////////////////////////////////////
  //ws 개발부분 : mmlFollowList.jsp의 서비스들//
  ////////////////////////////////////////////
  
  	@RequestMapping(value="/mmlFollowList.do", method=RequestMethod.GET)
	public String mmlFollow(@RequestParam("id") int id, Model model) {
		model.addAttribute("followee",mmlService.getMemberInfo(id));
		System.out.println("followee 정보 적재 완료");
		model.addAttribute("followers",mmlService.getFollowList(id));
		System.out.println("followers 정보 적재 완료");
		return "mml/mmlFollowList";
	}
  
>>>>>>> 28271b0d0e081572f443e04d368e47f64fdb6e87
}
