
package com.spring.mml;

import java.util.List;

import com.spring.member.MemberVO;
import com.spring.mypage.OneVO;
import com.spring.paging.SearchCriteria;

public interface MmlService {

	////////////////
	// 유진 개발부분//
	////////////////
	public Mml_ContentVO getMmlContent(int mml_num); // mmlContent 가져오기
	
	public int getMmlContentNum(int id);

	public int insertMml(Mml_ContentVO mmlContentVO); // mmlContent 등록하기

	public int updateMml(Mml_ContentVO mmlContentVO); // mmlContent 수정하기

	////////////////
	// 웅식 개발부분//
	////////////////
	public Mml_ContentVO getPage(int mml_num);

	public Object getMemberInfo(int member);

	public int getContFollower(int id);

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

	
	int countSearchedArticles(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch(SearchCriteria searchCriteria);
	
	int countSearchedArticles2(SearchCriteria searchCriteria);
	List<Mml_ListDTO> listSearch2(SearchCriteria searchCriteria);
