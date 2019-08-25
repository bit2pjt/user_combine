package com.spring.mml;

import java.util.List;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.paging.SearchCriteria;

public interface MmlService {

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
	public Mml_ContentVO getPage(int mml_num);

	public Object getMemberInfo(int member);

	public int getContFollower(int id);
	public int getContFollowing(int id);

	public int getCountLike(int mml_num);

	public String registerFR(int followee, int follower);

	public String giveLike(int giver, int mml_num);

	public String giveWarning(int warner, int mml_num);

	public void upCounter(int mml_num);

	public void mmlDelete(int mml_num);

	public List<MemberVO> getFollowList(int id);
	
	public List<MemberVO> getFollowingList(int id);

	////////////////
	// 상필 개발부분//
	////////////////
	public List<Mml_ContentVO> getMmlList();

	public List<Mml_ContentVO> getMmlList_like();

	public List<Mml_ContentVO> getMmlList_user(int id);

	public int getMemberId(String m_email);

	public String getMemberName(String m_email);

	public String getMemberNickname(String m_email);

	public String getMmlNickname(int id);

	public int getMmlId(int id);

	String reply_check(ThumbVO vo);

	int replyRecommend(ThumbVO vo);
	
	int insertReplyWarn(WarnVO vo);

	String ReplyWarn(WarnVO vo);
	
	int countSearchedArticles(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch(SearchCriteria searchCriteria);
	
	int countSearchedArticles2(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch2(SearchCriteria searchCriteria);

}