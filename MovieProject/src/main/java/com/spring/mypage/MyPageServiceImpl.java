package com.spring.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BoardFreeDAO;
import com.spring.member.MemberVO;
import com.spring.paging.Criteria;

/**
* @Class Name : MyPageServiceImpl.java
* @Description :
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.17     한유진      최초생성.
* @ 2019.07.24		박현민		one_get  부분 추가
* 
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
	public int insertProfileImage(int id, String m_image) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int result = mypageDAO.insertProfileImage(id, m_image);
		
		return result;
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

	// hm| 1:1문의 답변 가져오기 
	@Override
	public OneAdVO getQnaAdDetail(int qna_no) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		OneAdVO oneAdVO = mypageDAO.getQnaAdDetail(qna_no);
		
		return oneAdVO;
	}
	
	
	// kgh | 비밀번호 확인 , 탈퇴,
	@Override
	public boolean checkPw(String m_email, String m_password) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		boolean result = false;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("m_email", m_email);
		map.put("m_password", m_password);
		
		int count = mypageDAO.checkPw(map);
		if(count == 1) result = true;
		return result;
	}
	

	@Override
	public int delete_member(String m_email) {
		
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int num = mypageDAO.delete_member(m_email);
		System.out.println("num:"+num);
		return num;
	}

	@Override
	public int delete_date(int id) {
		
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int id_num = mypageDAO.delete_date(id);
		System.out.println("id_num:"+id_num);
		return id_num;
	}
	
	@Override
	public int deleteQna(int qna_no) {
		
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int delete = mypageDAO.deleteQna(qna_no);
		
		return delete; 
	}
	
	@Override
	public List<MemberVO> getMembers() {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		System.out.println("dao member start!============");
		List<MemberVO> memberList = mypageDAO.getMembers();
		System.out.println("memberlsitdao="+memberList);
		return memberList;
	}
	
	
	@Override
	public List<FolFolDTO> getfollower(int id){
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		System.out.println("dao follow follow me");
		System.out.println(id);
		List<FolFolDTO> followerList = mypageDAO.getfollower(id);
		System.out.println("FOLLOWER LIST"+followerList);
		
		return followerList;
	}
	
	@Override
	public List<FolFolDTO> getfollowing(int id){
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		System.out.println("dao follow follow you");
		List<FolFolDTO> followingList = mypageDAO.getfollowing(id);
		System.out.println("FOLLOWER LIST"+followingList);
		
		return followingList;
	}
	
	@Override
	public int countArticles(Criteria criteria) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		return myPageDAO.countArticles(criteria);
	}
	
	@Override
	public List<OneVO> listCriteria(Criteria criteria) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		return myPageDAO.listCriteria(criteria);
	}

	@Override
	public int getFreeCount(int id) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int freeCount = myPageDAO.getFreeCount(id);
		return freeCount;
	}
	
	@Override
	public int getShareCount(int id) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int shareCount = myPageDAO.getShareCount(id);
		return shareCount;
	}


	@Override
	public List<MyBoardDTO> freeBoard(Criteria criteria) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		List<MyBoardDTO> list1 = myPageDAO.getFreeBoard(criteria);
		
		return list1;
	}

	@Override
	public List<MyBoardDTO> shareBoard(Criteria criteria) {
		MyPageDAO myPageDAO = sqlSession.getMapper(MyPageDAO.class);
		List<MyBoardDTO> list2 = myPageDAO.getShareBoard(criteria);
		
		return list2;
	}
	
	
	
	
	
	
	
	
	

}
