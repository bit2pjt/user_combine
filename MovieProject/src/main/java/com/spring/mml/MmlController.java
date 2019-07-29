package com.spring.mml;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.member.MemberVO;

import org.springframework.web.bind.annotation.*;

@Controller
public class MmlController {
	
	@Autowired
	MmlService mmlService;
	
	@RequestMapping(value="/mmlList.do", method=RequestMethod.GET)
	public String mmlList() {
		return "mml/mmlList";
	}
	
	@RequestMapping(value="/mmlGet.do", method=RequestMethod.GET)
	public String mmlGet(@RequestParam("mml_num") int mml_num, Model model) {
		System.out.println("나영리 게시글 " +mml_num + " 넘어옴" );
		mmlService.upCounter(mml_num);//조회수 1 증가
		Mml_ContentVO content = mmlService.getPage(mml_num); //참조변수이므로 null값이 들어오면 문제된다
		
		model.addAttribute("mml_content", content ); //반환값이 null이면, null값을 그대로 요소에 담아 보낸다
		model.addAttribute("member", mmlService.getMemberInfo(content.getId()));
	
		return "mml/mmlGet";
	}
	@RequestMapping(value="/mmlWrite.do", method=RequestMethod.GET)
	public String mmlWrite() {
		return "mml/mmlWrite";
	}
	@RequestMapping(value="/mmlFollowList.do", method=RequestMethod.GET)
	public String mmlFollow(@RequestParam("id") int id, Model model) {
		model.addAttribute("followee",mmlService.getMemberInfo(id));
		System.out.println("followee 정보 적재 완료");
		model.addAttribute("followers",mmlService.getFollowList(id));
		System.out.println("followers 정보 적재 완료");
		return "mml/mmlFollowList";
	}
	
	@RequestMapping(value="/mmlMemberList.do", method=RequestMethod.GET)
	public String mmlMember() {
		return "mml/mmlMemberList";
	}
	
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
        out.println("alert('게시글이 삭제되었습니다. 섭섭...');");
        out.println("location.replace('/movie/mmlList.do')");
        out.println("</script>");
        out.close();
		return "redirect:/mmlList.do";
	}
	
	//테스트용 메서드. 통합시 삭제.
	@GetMapping("/mmlUpdate.do")
	public String mmlUpdate(Mml_ContentVO vo, Model model) {
		
		System.out.println("해당 VO가 Update로 넘어갑니다 : "+vo);
		
        return "mml/mmlUpdate";
	}
	
	
}
