package com.spring.mml;

import java.util.List;

import com.spring.member.MemberVO;

public interface MmlService {

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
}
