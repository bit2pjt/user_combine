package com.spring.mml;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mypage.MyPageService;

@Controller
public class MmlController {
	
	@Autowired
	private MmlService mmlService;
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/mmlList", method = RequestMethod.GET)
	public String mmlList(Model model)throws Exception {

		
		List<Mml_ContentVO> mmlList = mmlService.getMmlList();
		List<Mml_ContentVO> mmlList2 = mmlService.getMmlList_like();

		System.out.println("mmlLlist======================" + mmlList);

		model.addAttribute("mmlList", mmlList);
		model.addAttribute("mmlList2", mmlList2);

		return "mml/mmlList";
	}
	
	////////////////
  //���� ���ߺκ�//
  ////////////////

  @RequestMapping(value="/mmlWrite", method=RequestMethod.GET)
	public String mmlWrite(HttpSession session, Model model) 
	{
		String m_email = (String)session.getAttribute("m_email");
		//System.out.println("=============MmlController.java===================== m_email : " + m_email);
		//������ ������� �α����������� �̵�....�ٵ� ����ε�?
		if(m_email == null) {
			//System.out.println("=============MyPageController.java===================== m_name == null : " + m_email);
			return "redirect:/index";
		}
		
		int id = myPageService.getMemberId(m_email);
		model.addAttribute("id", id);
		
		return "mml/mmlWrite2";
	}
	
	@RequestMapping(value="/mmlWriteAction", method=RequestMethod.POST)
	public String mmlWriteAction(Mml_ContentVO mmlContentVO) 
	{
		//mml �ۼ��� ���������� �Ϸ�Ǹ� �ۼ��ߴ����� �� �� �ְ� ����
		//�Ѿ�� ���� ���� db�� �ִ� �۾� ����
		//System.out.println("=============MmlController.java===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		//mml_title, mml_content�� �յ� ���� ����
		mmlContentVO.setMml_title(mmlContentVO.getMml_title().trim());
		
		try {
			int result = mmlService.insertMml(mmlContentVO);
			if(result == 0) {
				return "redirect:/mmlWrite";
			}
		} catch (Exception e) {
			System.out.println("ERROR : MmlWriteAction - " + e.getMessage());
		}
		//�ۼ����� ���� mmlList�� �̵��ϰ� ���� ��ũ����
		return "redirect:/mmlList";
	}
	
	@RequestMapping(value="/mmlUpdate", method=RequestMethod.GET)
	public String mmlUpdate(HttpSession session, HttpServletRequest request, Model model) 
	{
		String m_email = (String)session.getAttribute("m_email");
		//System.out.println("=============MmlController.java===================== m_email : " + m_email);
		//������ ������� �α����������� �̵�....�ٵ� ����ε�?
		if(m_email == null) {
			//System.out.println("=============MyPageController.java===================== m_name == null : " + m_email);
			return "redirect:/index";
		}
		
		int mml_num = Integer.parseInt((String)request.getParameter("mml_num"));
		Mml_ContentVO mmlContentVO = mmlService.getMmlContent(mml_num);
		//System.out.println("=============MyPageController.java - mmlUpdate()===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		//System.out.println("=============MyPageController.java - mmlUpdate()===================== myPageService.getMemberId(m_email) : " + myPageService.getMemberId(m_email));
		//������ �ۼ��� mml�� �ƴҰ�� ���� �Ұ����ϰ�
		if(mmlContentVO.getId() != myPageService.getMemberId(m_email)) {
			//alertâ ����ָ� �� ����ġ
			return "redirect:/mmlGet?mml_num="+mmlContentVO.getMml_num();
		}
		model.addAttribute("mmlContentVO", mmlContentVO);
		
		return "mml/mmlUpdate";
	}
	
	@RequestMapping(value="/mmlUpdateAction", method=RequestMethod.POST)
	public String mmlUpdateAction(HttpServletRequest request, Mml_ContentVO mmlContentVO) 
	{
		//System.out.println("=============MyPageController.java - mmlUpdateAction()===================== mmlContentVO.getId() : " + mmlContentVO.getId());
		try {
			int result = mmlService.updateMml(mmlContentVO);
			if(result == 0) {
				
				return "redirect:/mmlUpdate?mml_num="+mmlContentVO.getMml_num();
			}
		} catch (Exception e) {
			System.out.println("ERROR : mmlUpdateAction - " + e.getMessage());
		}
		return "redirect:/mmlGet?mml_num="+mmlContentVO.getMml_num();
	}

	@RequestMapping(value = "/mmlMemberList", method = RequestMethod.GET)
	public String mmlMember(Model model, HttpSession session) {

		String e_mail = (String) session.getAttribute("m_email");

		int id = myPageService.getMemberId(e_mail);

		List<Mml_ContentVO> mmlList3 = mmlService.getMmlList_user(id);

		model.addAttribute("mmlList3", mmlList3);

		return "mml/mmlMemberList";
	}

  /////////////////////////////////////
  // ���ߺκ� : mmlGet.jsp�� ���񽺵�//
  /////////////////////////////////////
 
  //1. getpage
  @RequestMapping(value="/mmlGet", method=RequestMethod.GET)
	public String mmlGet(@RequestParam("mml_num") int mml_num, Model model) {
		System.out.println("������ �Խñ� " +mml_num + " �Ѿ��" );
		mmlService.upCounter(mml_num);//��ȸ�� 1 ����
		Mml_ContentVO content = mmlService.getPage(mml_num); //���������̹Ƿ� null���� ������ �����ȴ�
		
		model.addAttribute("mml_content", content ); //��ȯ���� null�̸�, null���� �״�� ��ҿ� ��� ������
		model.addAttribute("member", mmlService.getMemberInfo(content.getId()));
	
		return "mml/mmlGet";
	}
  
  //2. �Խñ� ����ó��
  @GetMapping("/mmlDelete")
	public String mmlDelete(@RequestParam("mml_num")int mml_num, HttpServletResponse response) {
		mmlService.mmlDelete(mml_num);
		System.out.println(mml_num+" �� ������ �Խù� ����. ����Ʈ �������� Redirect");
		//�˸�â���� �����Ǿ����� �����ұ�??
		response.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        out.println("<script>");
        out.println("alert('�Խñ��� �����Ǿ����ϴ�.');");
        out.println("location.replace('/movie/mmlList')");
        out.println("</script>");
        out.close();
		return "redirect:/mmlList";
	}
  
  ////////////////////////////////////////////
  //ws ���ߺκ� : mmlFollowList.jsp�� ���񽺵�//
  ////////////////////////////////////////////
  
  	@RequestMapping(value="/mmlFollowList", method=RequestMethod.GET)
	public String mmlFollow(@RequestParam("id") int id, Model model) {
		model.addAttribute("followee",mmlService.getMemberInfo(id));
		System.out.println("followee ���� ���� �Ϸ�");
		model.addAttribute("followers",mmlService.getFollowList(id));
		System.out.println("followers ���� ���� �Ϸ�");
		return "mml/mmlFollowList";
	}

}