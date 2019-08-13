package com.spring.member;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;


public interface MemberService {
	
	public int memberJoin(MemberVO vo) throws MessagingException, UnsupportedEncodingException;	//회원가입
	public int deleteAuthkey(MemberVO vo);	//인증키 지우기(인증메일을 통해 인증성공시 인증키 지움)
	public String getAuthkey(int id);	//인증키 가져오기
	public int updateCert(MemberVO vo);	//인증상태 변경
	public String getCertById(int id);	//인증상태	가져오기
	
	public int userCheck(String email, String pw);	//로그인시 유저의 정보 체크
	public String getCert(String m_email, String m_password);	//인증상태 가져오기(로그인시 필요)
	public String getDeletestatus(String m_email, String m_password);	//탈퇴여부 가져오기(로그인시 필요)
	public int getId(String m_email, String m_password);	//아이디 가져오기(로그인시)

	public String findEmail(MemberVO vo);	//이메일 찾기
	public String findPw(MemberVO vo) throws MessagingException, UnsupportedEncodingException;	//비밀번호 찾기 - 새로운 임시 비밀번호 발급
	
	public boolean emailOverlapChk(MemberVO vo);	//이메일 중복체크
	public boolean nickOverlapChk(MemberVO vo);		//닉네임 중복체크
	
	public List<MovieChartVO> getCGV();
	public List<MovieChartVO> getNaver();
	public List<MovieChartVO> getDaum();
}