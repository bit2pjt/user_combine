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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.movie.MovieInfoVO;
import com.spring.movie.MovieService;
import com.spring.mypage.MyPageService;
import com.spring.paging.PageMaker;
import com.spring.paging.SearchCriteria;

@Controller
public class MmlController {

	@Autowired
	private MmlService mmlService;

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MovieService movieService;
	
	
////////////////
// 유진 개발부분//
////////////////
	
	/*
	@ResponseBody
	@RequestMapping(value="/mmlWriteMovie", method=RequestMethod.POST)
	public List<MovieInfoVO> mmlWriteMovie(HttpServletRequest request,SearchCriteria searchCriteria) {
		
		String mcategory = request.getParameter("mcategory");
		String search_input = request.getParameter("search_input");
		
		System.out.println("=============MmlController.java===================== mcategory : " + mcategory);
		System.out.println("=============MmlController.java===================== search_input : " + search_input);
		
		if(mcategory.equals("영화 제목")) {
			List<MovieInfoVO> search_list = movieService.getMovieList_title(search_input);
			//System.out.println("=============MmlController.java===================== search_list.get(0).getMi_releaseday() : " + search_list.get(0).getMi_releaseday());
			return search_list;
		}else if(mcategory.equals("개봉 연도")) {
			List<MovieInfoVO> search_list = movieService.getMovieList_release(search_input);
			return search_list;
		}else if(mcategory.equals("제작 국가")) {
			List<MovieInfoVO> search_list = movieService.getMovieList_country(search_input);
			return search_list;
		}else if(mcategory.equals("영화 감독")) {
			List<MovieInfoVO> search_list = movieService.getMovieList_director(search_input);
			return search_list;
		}else{ // if(mcategory.equals("영화 배우")) 
			List<MovieInfoVO> search_list = movieService.getMovieList_actor(search_input);
			return search_list;
		}
		
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(movieService.countSearchedMovie(searchCriteria));
		List<MovieInfoVO> movieList = movieService.getMovieListSerch(searchCriteria);
		return movieList;
	}
	*/
	
	@RequestMapping(value = "/mmlWrite", method = RequestMethod.GET)
	public String mmlWrite(HttpSession session, Model model,SearchCriteria searchCriteria) {
		String m_email = (String) session.getAttribute("m_email");
		// System.out.println("=============MmlController.java=====================
		// m_email : " + m_email);
		// 세션이 없을경우 로그인페이지로 이동....근데 모달인데?
		if (m_email == null) {
			// System.out.println("=============MyPageController.java=====================
			// m_name == null : " + m_email);
			return "redirect:/index";
		}
		int id = myPageService.getMemberId(m_email);
		model.addAttribute("id", id);
		//List<MovieInfoVO> movieList = movieService.getMovieList();
		//System.out.println("=============MmlController.java===================== movieList.get(0).getMi_code() : " + movieList.get(0).getMi_ktitle());
		//model.addAttribute("movieList", movieList);
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(movieService.countSearchedMovie(searchCriteria));
		List<MovieInfoVO> movieList = movieService.getMovieListSerch(searchCriteria);
		model.addAttribute("movieList", movieList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "mml/mmlWrite2";
	}

	@RequestMapping(value = "/mmlWriteAction", method = RequestMethod.POST)
	public String mmlWriteAction(Mml_ContentVO mmlContentVO) {
		// mml 작성이 성공적으로 완료되면 작성했던글을 볼 수 있게 연결
		// 넘어온 값을 토대로 db에 넣는 작업 진행
		// System.out.println("=============MmlController.java=====================
		// mmlContentVO.getId() : " + mmlContentVO.getId());
		// mml_title, mml_content의 앞뒤 공백 제거
		mmlContentVO.setMml_title(mmlContentVO.getMml_title().trim());

		try {
			System.out.println("===== mmlContentVO ===== " + mmlContentVO.toString());
			int result = mmlService.insertMml(mmlContentVO);
			if (result == 0) {
				return "redirect:/mmlWrite";
			}
		} catch (Exception e) {
			System.out.println("ERROR : MmlWriteAction - " + e.getMessage());
			e.printStackTrace();
		}
		//작성자의 개인 mmlList로 이동하게 추후 링크조정
		System.out.println("mmlWriteAction test : " + mmlContentVO.getId() +", " + mmlContentVO.getMi_code()+", "+ mmlContentVO.getMml_title());
		int mml_num = mmlService.getMmlNum(mmlContentVO);
		System.out.println("mml_num : " + mml_num);
		return "redirect:/mmlGet?mml_num="+mml_num;
	}
	
	@RequestMapping(value = "/mmlUpdate", method = RequestMethod.GET)
	public String mmlUpdate(HttpSession session, HttpServletRequest request, Model model) {
		String m_email = (String) session.getAttribute("m_email");
		// System.out.println("=============MmlController.java=====================
		// m_email : " + m_email);
		// 세션이 없을경우 로그인페이지로 이동....근데 모달인데?
		if (m_email == null) {
			// System.out.println("=============MyPageController.java=====================
			// m_name == null : " + m_email);
			return "redirect:/index";
		}

		int mml_num = Integer.parseInt((String) request.getParameter("mml_num"));
		Mml_ContentVO mmlContentVO = mmlService.getMmlContent(mml_num);
		// System.out.println("=============MyPageController.java -
		// mmlUpdate()===================== mmlContentVO.getId() : " +
		// mmlContentVO.getId());
		// System.out.println("=============MyPageController.java -
		// mmlUpdate()===================== myPageService.getMemberId(m_email) : " +
		// myPageService.getMemberId(m_email));
		// 본인이 작성한 mml이 아닐경우 수정 불가능하게
		if (mmlContentVO.getId() != myPageService.getMemberId(m_email)) {
			// alert창 띄워주면 더 조오치
			return "redirect:/mmlGet?mml_num=" + mmlContentVO.getMml_num();
		}
		model.addAttribute("mmlContentVO", mmlContentVO);
		
		List<MovieInfoVO> movieList = movieService.getMovieList();
		//System.out.println("=============MmlController.java===================== movieList.get(0).getMi_code() : " + movieList.get(0).getMi_ktitle());
		model.addAttribute("movieList", movieList);
		
		return "mml/mmlUpdate";
	}
	
	@RequestMapping(value = "/mmlUpdateAction", method = RequestMethod.POST)
	public String mmlUpdateAction(HttpServletRequest request, Mml_ContentVO mmlContentVO) {
		// System.out.println("=============MyPageController.java -
		// mmlUpdateAction()===================== mmlContentVO.getId() : " +
		// mmlContentVO.getId());
		try {
			int result = mmlService.updateMml(mmlContentVO);
			if (result == 0) {

				return "redirect:/mmlUpdate?mml_num=" + mmlContentVO.getMml_num();
			}
		} catch (Exception e) {
			System.out.println("ERROR : mmlUpdateAction - " + e.getMessage());
		}
		return "redirect:/mmlGet?mml_num=" + mmlContentVO.getMml_num();
	}
////////////////
//상필 개발부분//
////////////////
	@RequestMapping(value = "/mmlList", method = RequestMethod.GET)
	public String mmlList(Model model,@ModelAttribute("searchCriteria") 
	SearchCriteria searchCriteria) throws Exception {

		
		
//		List<Mml_ContentVO> mmlList = mmlService.getMmlList();
//		List<Mml_ContentVO> mmlList2 = mmlService.getMmlList_like();
//
//		System.out.println("mmlLlist======================" + mmlList);

//		model.addAttribute("mmln", mmlList);
//		model.addAttribute("mmlList2", mmlList2);
		
		PageMaker pageMaker = new PageMaker();
	      pageMaker.setCriteria(searchCriteria);
	      pageMaker.setTotalCount(mmlService.countSearchedArticles(searchCriteria));
	      model.addAttribute("mmlList", mmlService.listSearch(searchCriteria));
	      System.out.println("pageMaker="+pageMaker);
	      model.addAttribute("pageMaker", pageMaker);
	      
	      PageMaker pageMaker2 = new PageMaker();
	      pageMaker2.setCriteria(searchCriteria);
	      pageMaker2.setTotalCount(mmlService.countSearchedArticles2(searchCriteria));
	      model.addAttribute("mmlList2", mmlService.listSearch2(searchCriteria));
	      System.out.println("pageMaker2="+pageMaker2);
	      model.addAttribute("pageMaker2", pageMaker2);

		return "mml/mmlList";
	}

	@RequestMapping(value = "/mmlMemberList", method = RequestMethod.GET)
	public String mmlMember(Model model, HttpSession session,@RequestParam("id") int id) {
		
		MemberVO member = myPageService.getMember(id);
		
		List<Mml_ContentVO> mmlList3 = mmlService.getMmlList_user(id);

		model.addAttribute("mmlList3", mmlList3);
		
		model.addAttribute("follower", member);

		return "mml/mmlMemberList";
	}

	/////////////////////////////////////
	// 개발부분 : mmlGet.jsp의 서비스들//
	/////////////////////////////////////

	// 1. getpage
		@RequestMapping(value = "/mmlGet", method = RequestMethod.GET)
		public String mmlGet(@RequestParam("mml_num") int mml_num, Model model, HttpSession session) {
			System.out.println("나영리 게시글 " + mml_num + " 넘어옴");
			mmlService.upCounter(mml_num);// 조회수 1 증가
			Mml_ContentVO content = mmlService.getPage(mml_num); // 참조변수이므로 null값이 들어오면 문제된다
			model.addAttribute("mml_content", content); // 반환값이 null이면, null값을 그대로 요소에 담아 보낸다
			model.addAttribute("member", mmlService.getMemberInfo(content.getId()));
			
			String m_email = (String) session.getAttribute("m_email");
			int id = myPageService.getMemberId(m_email);
			
			model.addAttribute("sessionyn",m_email);
			
			model.addAttribute("vid", id);
			
			//mml_content의 mi_code에 맞는 제들을 불러올거
			List<String> ktitleList = movieService.getTitle(content);
			model.addAttribute("ktitleList", ktitleList);
			return "mml/mmlGet";
		}

	// 2. 게시글 삭제처리
	@GetMapping("/mmlDelete")
	public String mmlDelete(@RequestParam("mml_num") int mml_num, HttpServletResponse response) {
		mmlService.mmlDelete(mml_num);
		System.out.println(mml_num + " 번 나영리 게시물 삭제. 리스트 페이지로 Redirect");
		// 알림창으로 삭제되었음을 통지할까??
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("<script>");
		out.println("alert('삭제되었습니다.');");
		out.println("location.replace('/movie/mmlList')");
		out.println("</script>");
		out.close();
		return "redirect:/mmlList";
	}

	////////////////////////////////////////////
	// ws 개발부분 : mmlFollowList.jsp의 서비스들//
	////////////////////////////////////////////

	@RequestMapping(value = "/mmlFollowList", method = RequestMethod.GET)
	public String mmlFollow(@RequestParam("id") int id, Model model) {
		model.addAttribute("followee", mmlService.getMemberInfo(id));
		System.out.println("followee 정보 적재 완료");
		
		List<MemberVO> result = mmlService.getFollowList(id);
		
		model.addAttribute("followers", result);
		System.out.println("followers 정보 적재 완료"+result);
		System.out.println(result.get(0).getId());

		return "mml/mmlFollowList";
	}
	
	@RequestMapping(value = "/mmlFollowingList", method = RequestMethod.GET)
	public String mmlFollowing(@RequestParam("id") int id, Model model) {
		model.addAttribute("followee", mmlService.getMemberInfo(id));
		System.out.println("followee 정보 적재 완료");
		
		List<MemberVO> result = mmlService.getFollowingList(id);
		
		model.addAttribute("followings", result);
		System.out.println("followings 정보 적재 완료"+result);
		System.out.println(result.get(0).getId());

		return "mml/mmlFollowingList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/MmlReplyReco", method=RequestMethod.POST)
	public String MmlReplyReco(HttpSession session, HttpServletRequest request) { 
		String sessionyn = (String)session.getAttribute("m_email");
		int id = mmlService.getMemberId(sessionyn); // 로그인한 사용자의 id값
		int mml_reply_code = Integer.parseInt(request.getParameter("mml_reply_code")); //게시글 번호
		int type = Integer.parseInt(request.getParameter("type")); // 추천:1, 비추천:0
		ThumbVO vo = new ThumbVO();
		vo.setMml_reply_code(mml_reply_code); // 댓글 번호
		vo.setId(id); // 댓글 쓴 사람의 id
		vo.setMmlr_thumb(type); // 1: 추천, 0: 비추천
		
		if( type == 1) { // 추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = mmlService.reply_check(vo); 
			return msg;
		}else { // 비추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = mmlService.reply_check(vo);
			return msg;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/MmlReplyWarn", method=RequestMethod.POST)
	public String BFReplyWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = mmlService.getMemberId(sessionyn); // 로그인한 사용자의 id값
		int mml_reply_code = Integer.parseInt(request.getParameter("mml_reply_code")); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setMml_reply_code(mml_reply_code);
		vo.setId(id);
		
		String msg = mmlService.ReplyWarn(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}


}