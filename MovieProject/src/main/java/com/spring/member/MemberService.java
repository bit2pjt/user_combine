package com.spring.member;

public interface MemberService {
	
	public int userCheck(String email, String pw);
	
	public MemberVO getMember(String email);
	
	public int updateMember(MemberVO vo);
	
	public void deleteMember(String email);
	
	public String findEmail(MemberVO vo);
	
	public MemberVO findPw(MemberVO vo);
	

	public int memberJoin(MemberVO vo);

	public boolean emailOverlapChk(MemberVO vo);
	
	public boolean nickOverlapChk(MemberVO vo);

	public int updatePw(MemberVO vo);
	
	public int getId(String m_email, String m_password);

}