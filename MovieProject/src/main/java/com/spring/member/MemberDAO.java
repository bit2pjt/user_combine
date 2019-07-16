package com.spring.member;

public interface MemberDAO {
	public int insertMember(MemberVO vo);
	
	public MemberVO userCheck(String id);
	
	public MemberVO getMember(String id);
	
	public int updateMember(MemberVO vo);
	
	public void deleteMember(String id);
	
	public MemberVO findId(String email);
}
