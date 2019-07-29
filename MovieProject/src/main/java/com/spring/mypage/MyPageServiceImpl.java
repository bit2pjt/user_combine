package com.spring.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int delete_date(String id) {
		
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		
		int id_num = mypageDAO.delete_date(id);
		System.out.println("id_num:"+id_num);
		return id_num;
	}
	
	
}
