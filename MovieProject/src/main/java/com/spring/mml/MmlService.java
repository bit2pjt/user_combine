
package com.spring.mml;

import java.util.List;

import com.spring.member.MemberVO;

public interface MmlService {
  
  ////////////////
  //���� ���ߺκ�//
  ////////////////
  public Mml_ContentVO getMmlContent(int mml_num); 	//mmlContent ��������
	public int insertMml(Mml_ContentVO mmlContentVO);	//mmlContent ����ϱ�
	public int updateMml(Mml_ContentVO mmlContentVO);	//mmlContent �����ϱ�
  
  ////////////////
  //���� ���ߺκ�//
  ////////////////

	public Mml_ContentVO getPage (int mml_num);

	public Object getMemberInfo(int member);

	public int getContFollower(int id);

	public int getCountLike(int mml_num);

	public String registerFR(int followee, int follower);

	public String giveLike(int giver, int mml_num);

	public String giveWarning(int warner, int mml_num);

	public void upCounter(int mml_num);

	public void mmlDelete(int mml_num);

	public List<MemberVO> getFollowList(int id);
	
	//상필이
	public List<Mml_ContentVO> getMmlList();
	public List<Mml_ContentVO> getMmlList_like();
	public List<Mml_ContentVO> getMmlList_user(int id);
	public int getMemberId(String m_email);	
	public String getMemberName(String m_email);
	public String getMemberNickname(String m_email);
	public String getMmlNickname(int id);
	public int getMmlId(int id);
	
	
}