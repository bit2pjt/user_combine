package com.spring.movie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.paging.PageMaker;
import com.spring.paging.SearchCriteria;

@Controller
public class MovieController {
	
	@Autowired
	MovieService movieService;
	
	@RequestMapping(value="/movieList", method=RequestMethod.GET)
	public String movieList(Model model,@ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(movieService.countSearchedMovie(searchCriteria));
		List<MovieInfoVO> movieList = movieService.getMovieListSerch(searchCriteria);
		
		
		model.addAttribute("movieList", movieList);
		model.addAttribute(pageMaker);
		
		return "movie/movieList";
	}
	
	@ResponseBody
	@RequestMapping(value="/mmlWriteMovie", method=RequestMethod.GET)
	public List<MovieInfoVO> mmlWriteMovie(Model model, HttpServletRequest request,SearchCriteria searchCriteria) {
		//System.out.println("mmlWriteMovie  ===========>   " + searchCriteria.getSearchType() + ", " +searchCriteria.getKeyword());
		PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(searchCriteria);
        pageMaker.setTotalCount(movieService.countSearchedMovie(searchCriteria));
        System.out.println("searchCriteria  ===========>   " + searchCriteria.toString());
		List<MovieInfoVO> movieList = movieService.getMovieListSerch(searchCriteria);
		
		if(movieList.size() == 0) {
			System.out.println("결과 : 검색결과가 없네용");
		}else {
			System.out.println("결과 : 검색결과가 있네용");
		}
		for(int i=0; i<movieList.size(); i++) {
			System.out.println("mmlWriteMovie  getMi_ktitle ===========>   " +movieList.get(i).getMi_ktitle());
		}
//		model.addAttribute("movieList", movieList);
//		model.addAttribute("pageMaker", pageMaker);
		return movieList;
	}
	
	
	@RequestMapping(value="/movieDetail", method=RequestMethod.GET)
	public String moveDetail(@RequestParam("mi_ktitle") String mi_ktitle, Model model, HttpSession session) {
		String sessionyn = (String)session.getAttribute("m_email");
		if(sessionyn != null) {
			int id = movieService.getUser(sessionyn); // 로그인한 사용자의 id값
			model.addAttribute("id", id);
		}
		
		MovieInfoVO movieInfoVO = movieService.getMovieInfo(mi_ktitle);
		List<MovieCrawlVO> movieCrawlVO = movieService.getThumnail(mi_ktitle);
		
		model.addAttribute("movieCrawl", movieCrawlVO);
		model.addAttribute("sessionyn",sessionyn);
		model.addAttribute("movieInfoVO", movieInfoVO);
		
		return "movie/movieDetail";
	}
	
	/**
	  * 댓글 추천/비추천기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value = "/MovieReplyReco", method=RequestMethod.POST)
	public String BFReplyReco(HttpSession session, HttpServletRequest request) { 
		String sessionyn = (String)session.getAttribute("m_email");
		int id = movieService.getUser(sessionyn); // 로그인한 사용자의 id값
		int mr_code = Integer.parseInt(request.getParameter("mr_code")); //게시글 번호
		int type = Integer.parseInt(request.getParameter("type")); // 추천:1, 비추천:0
		
		ThumbVO vo = new ThumbVO();
		vo.setMr_code(mr_code); // 댓글 번호
		vo.setId(id); // 댓글 쓴 사람의 id
		vo.setBf_thumb(type); // 1: 추천, 0: 비추천
		
		if( type == 1) { // 추천을 눌렀을 경우
			// mr_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = movieService.reply_check(vo); 
			return msg;
		}else { // 비추천을 눌렀을 경우
			// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
			String msg = movieService.reply_check(vo);
			return msg;
		}
	}
	
	/**
	  * 댓글 신고 기능
	  * @param request
	  * @param session
	  * @return @ResponseBody String => json
	 */
	@ResponseBody
	@RequestMapping(value="/MovieReplyWarn", method=RequestMethod.POST)
	public String BFReplyWarn(HttpSession session, HttpServletRequest request) {
		String sessionyn = (String)session.getAttribute("m_email");
		int id = movieService.getUser(sessionyn); // 로그인한 사용자의 id값
		int mr_code = Integer.parseInt(request.getParameter("no")); //게시글 번호
		String mr_warncontent = request.getParameter("warncontent"); //게시글 번호
		WarnVO vo = new WarnVO();
		vo.setMr_code(mr_code);
		vo.setMr_warncontent(mr_warncontent);
		vo.setId(id);
		
		String msg = movieService.replyWarn(vo); 
		if(msg.equals("1"))
			msg = "success";
		
		return msg;
	}
}
