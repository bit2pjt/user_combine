package com.spring.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.paging.SearchCriteria;

public interface MovieDAO {
	
	public List<MovieInfoVO> getMovieList();
	public List<MovieInfoVO> getMovieListSerch(SearchCriteria searchCriteria);
	public int countSearchedMovie(SearchCriteria searchCriteria);
	public MovieInfoVO getMovieInfo(String mi_ktitle);
	public String getTitle(@Param("mi_code") int mi_code);
	public int getUser(String email);
	
	// 댓글 추천/비추천
	ThumbVO reply_check(ThumbVO vo);
	int replyRecommend(ThumbVO vo);
	void updateReplyRecommend(ThumbVO vo);
	void updateReplyDecommend(ThumbVO vo);
	int getReplyRecommend(int mr_code);
	int getReplyDecommend(int mr_code);
	
	// 댓글 신고
	int insertReplyWarn(WarnVO vo);
	WarnVO replyWarn(WarnVO vo);
	void ReplyWarnCount(int mr_code);
	
	public List<MovieInfoVO> getMovieList_title(String search_input);
	public List<MovieInfoVO> getMovieList_release(String search_input);
	public List<MovieInfoVO> getMovieList_country(String search_input);
	public List<MovieInfoVO> getMovieList_director(String search_input);
	public List<MovieInfoVO> getMovieList_actor(String search_input);
	
	
}
