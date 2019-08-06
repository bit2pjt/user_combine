package com.spring.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BoardFreeDAO;
import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.mypage.MyPageDAO;
import com.spring.mypage.OneVO;
import com.spring.paging.SearchCriteria;


@Service("movieService")
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieInfoVO> getMovieList() {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> movieList = movieDAO.getMovieList();
		
		return movieList;
	}

	@Override
	public int countSearchedMovie(SearchCriteria searchCriteria) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		return movieDAO.countSearchedMovie(searchCriteria);
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_title(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_title(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_release(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_release(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_country(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_country(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_director(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_director(search_input);
		
		return search_list;
	}
	
	@Override
	public List<MovieInfoVO> getMovieList_actor(String search_input) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> search_list = movieDAO.getMovieList_actor(search_input);
		
		return search_list;
	}


	@Override
	public List<MovieInfoVO> getMovieListSerch(SearchCriteria searchCriteria) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		List<MovieInfoVO> movieList = movieDAO.getMovieListSerch(searchCriteria);
		
		return movieList;
	}

	@Override
	public MovieInfoVO getMovieInfo(String mi_ktitle) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		MovieInfoVO vo = movieDAO.getMovieInfo(mi_ktitle);
		return vo;
	}

	@Override
	public int getUser(String email) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		int num = movieDAO.getUser(email);
		return num;
	}

	@Override
	public String reply_check(ThumbVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		
		ThumbVO thumbVO = movieDAO.reply_check(vo); 
		String msg = "";
		
		if( thumbVO != null) {// br_thumb테이블에 해당 댓글번호가 있으면 중복 추천/비추천 불가
			msg ="fail";
		}else { 
			msg = String.valueOf(replyRecommend(vo)); // bf_reply에서 추천수를 가져와서 보여준다.
		}
		return msg;
	}
	
	/**
	  * mr_reply에서 추천수를 가져와서 보여준다.
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return msg(추천수)
	 */
	@Override
	public int replyRecommend(ThumbVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		movieDAO.replyRecommend(vo); // mr_thumb 추가
		
		int num=0;
		
		System.out.println("bf_thumb: " + vo.getBf_thumb());
		
		if(vo.getBf_thumb() == 1) {
			updateReplyRecommend(vo); // bf_reply update
			num = getReplyRecommend(vo.getMr_code());
		}else {
			updateReplyDecommend(vo); // bf_reply update
			num = getReplyDecommend(vo.getMr_code());
		}
		return num;
	}
	
	/**
	  * movie_rev의  mr_like update
	 */
	private void updateReplyRecommend(ThumbVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		movieDAO.updateReplyRecommend(vo);
	}
	
	/**
	  * movie_rev의  mr_dislike update
	 */
	private void updateReplyDecommend(ThumbVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		movieDAO.updateReplyDecommend(vo);
	}
	
	/**
	  * movie_rev에서 추천수를 가져온다.
	  * @param bfr_rno - 게시글 번호
	  * @return num(추천수)
	 */
	private int getReplyRecommend(int mr_code) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		int num = movieDAO.getReplyRecommend(mr_code);
		return num;
	}
	
	/**
	  * movie_rev 에서 비추천수를 가져온다.
	  * @param mr_code - 댓글 번호
	  * @return num(추천수)
	 */
	private int getReplyDecommend(int mr_code) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		int num = movieDAO.getReplyDecommend(mr_code);
		return num;
	}

	/**
	  * mr_warning에 추가하고, movie_rev에 신고수 증가
	  * @param vo 
	  * @return msg
	*/
	@Override
	public int insertReplyWarn(WarnVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		ReplyWarnCount(vo.getMr_code()); // 신고수 1 증가
		int num = movieDAO.insertReplyWarn(vo); 
		
		return num;
	}
	
	/**
	  * movie_rev에 신고수 증가
	  * @param bno - 게시글의 번호
	*/
	private void ReplyWarnCount(int mr_code) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		movieDAO.ReplyWarnCount(mr_code);
	}

	/**
	  * mr_warning에 있는지 없는지 확인
	  * @param vo 
	  * @return msg
	 */
	@Override
	public String ReplyWarn(WarnVO vo) {
		MovieDAO movieDAO = sqlSession.getMapper(MovieDAO.class);
		WarnVO warnVO = movieDAO.ReplyWarn(vo);
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertReplyWarn(vo));  // 1
		}
		
		return msg;
	}
	
}
