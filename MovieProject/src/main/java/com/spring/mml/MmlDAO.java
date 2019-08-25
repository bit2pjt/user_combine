package com.spring.mml;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.paging.SearchCriteria;

public interface MmlDAO {

	////////////////
	// 유진 개발부분//
	////////////////
	public Mml_ContentVO getMmlContent(int mml_num); // mmlContent 가져오기
	
	public int getMmlContentNum(int id);	//mmlContent mml_num 가져오기

	public int insertMml(Mml_ContentVO mmlContentVO); // mmlContent 등록하기

	public int updateMml(Mml_ContentVO mmlContentVO); // mmlContent 수정하기
	
	public int getMmlNum(Mml_ContentVO mmlContentVO);	//등록한 mmlContent의 글번호 가져오기
	
	public List<Mml_ContentVO> getMmlList_like_top3(int id);//mml 좋아요순으로 top2가져오기

	////////////////
	// 웅식 개발부분//
	////////////////

	public void upCounter(@Param("mml_num") int mml_num);

	public Mml_ContentVO getMmlContent2(int mml_num);

	public MemberVO getMemberInfo(int id);

	public int getCountFollower(int id);
	
	public int getCountFollowing(int id);

	public int getCountLike(int mml_num);

//팔로우 컨트롤러에서 쓰이는 매퍼 3종
	public void registerFR(@Param("mf_ing") int mf_ing, @Param("mf_wer") int mf_wer);

	public int FROverlapedChk(@Param("mf_ing") int mf_ing, @Param("mf_wer") int mf_wer);

	public void updateMml_follower(@Param("id") int id);

//추천 컨트롤러에서 쓰이는 매퍼 3종
	public int giveLikeOverlapCheck(@Param("giver") int giver, @Param("mml_num") int mml_num);

	public void giveLike(@Param("giver") int giver, @Param("mml_num") int mml_num);

	public void updateMml_like(@Param("mml_num") int mml_num);

//신고 컨트롤러에서 쓰이는 매퍼 3종
	public int giveWarningOverlapCheck(@Param("giver") int warner, @Param("mml_num") int mml_num);

	public void giveWarning(@Param("giver") int warner, @Param("mml_num") int mml_num);

	public void updateMml_warn_count(@Param("mml_num") int mml_num);
//대부분의 원리가 같은데, 동일한 매퍼를 동적으로 응용할 수 없을까? 를 탐구해보자

	public void mmlDelete(int mml_num);

	public List<Integer> getFollowListFromMF_table(int id);

	public List<MemberVO> getFollowers(@Param("list") List<Integer> list);
	
	public List<Integer> getFollowingListFromMF_table(int id);

//상필이
	public List<Mml_ContentVO> getMmlList();

	public List<Mml_ContentVO> getMmlList_like();

	public List<Mml_ContentVO> getMmlList_user(int id);

	public int getMemberId(String m_email);

	public String getMemberName(String m_email);

	public String getMemberNickname(String m_email);

	public String getMmlNickname(int id);

	public int getMmlId(int id);
	
	ThumbVO reply_check(ThumbVO vo);
	
	void updateReplyRecommend(ThumbVO vo);
		
	void updateReplyDecommend(ThumbVO vo);
		
	int getReplyRecommend(int mml_reply_code);
		
	int getReplyDecommend(int mml_reply_code);
	
	int replyRecommend(ThumbVO vo);
	
	int insertReplyWarn(WarnVO vo);
	
	WarnVO ReplyWarn(WarnVO vo);
	
	void ReplyWarnCount(int mml_reply_code);
	
	int countSearchedArticles(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch(SearchCriteria searchCriteria);
	
	int countSearchedArticles2(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch2(SearchCriteria searchCriteria);
}
