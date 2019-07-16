package com.spring.member;

public interface MemberService {
	public int insertMember(MemberVO vo);
	
	public int userCheck(String email, String pw);
	
	public MemberVO getMember(String email);
	
	public int updateMember(MemberVO vo);
	
	public void deleteMember(String email);
	
	public MemberVO findEmail(String email);
}
