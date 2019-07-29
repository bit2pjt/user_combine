package com.spring.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberVO;

/**
* @Class Name : MyPageServiceImpl.java
* @Description :
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.17     한유진      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public String getMemberName(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		String m_name = mypageDAO.getMemberName(m_email);
		return m_name;
	}
	
	@Override
	public int getMemberId(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int id = mypageDAO.getMemberId(m_email);
		return id;
	}
	
	@Override
	public List<OneVO> getQnaList(int id) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		List<OneVO> qnaList = mypageDAO.getQnaList(id);
		
		return qnaList;
	}
	
	@Override

	public MemberVO getMember(int id){
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		MemberVO member = mypageDAO.getMember(id);
		
		return member;
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		mypageDAO.updateMember(memberVO);
	}
	
	@Override
	public void updatePw(MemberVO memberVO) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		mypageDAO.updatePw(memberVO);
	}
	
	@Override
	public void updateNick(MemberVO memberVO) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		mypageDAO.updateNick(memberVO);
	}
	
	@Override
	public int checkNick(String m_nickname) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int check = mypageDAO.checkNick(m_nickname);
		return check;
	}

	public int insertQna(OneVO oneVO) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int result = mypageDAO.insertQna(oneVO);
		
		return result;
	}
	
	@Override
	public String getMemberNickname(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		String m_nickname = mypageDAO.getMemberNickname(m_email);
		
		return m_nickname;
	}
	
	@Override
	public OneVO getQnaDetail(int qna_no) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		OneVO oneVO = mypageDAO.getQnaDetail(qna_no);
		
		return oneVO;
	}
	
	@Override
	public int updateQna(OneVO oneVO) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int result = mypageDAO.updateQna(oneVO);
		
		return result;
	}

}
