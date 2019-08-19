package com.spring.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberDAO {
	
	public int memberJoin(MemberVO vo);	//회원가입
	public int setAuthkey(MemberVO vo);	//인증키 등록
	public String getAuthkey(int id);	//인증키 가져오기
	public int updateCert(MemberVO vo);	//인증상태 등록
	public String getCertById(int id);	//인증상태 가져오기
	
	public MemberVO userCheck(String email);//로그인시 유저의 정보 체크
	public String getCert(@Param("m_email") String m_email, @Param("m_password")String m_password);	//인증상태 가져오기
	public String getDeletestatus(@Param("m_email") String m_email, @Param("m_password")String m_password);	//탈퇴여부 가져오기
	public int getId(@Param("m_email") String m_email, @Param("m_password")String m_password);//아이디 가져오기(로그인시)
	
	public String findEmail(MemberVO vo);//이메일 찾기
	public MemberVO findPw(MemberVO vo); //비밀번호 찾기
	public int updatePw(MemberVO vo);	//비밀번호 변경

	public int emailOverlapChk(String email);//이메일 중복체크
	public int nickOverlapChk(String nickname);//닉네임 중복체크
	
	
	
	public MemberVO getMember(String email);
	public int updateMember(MemberVO vo);
	public void deleteMember(String email);
	public String userNickName(int id);
	
	public List<MovieChartVO> getMovieChart();
}