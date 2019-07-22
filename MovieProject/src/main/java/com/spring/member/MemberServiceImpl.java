package com.spring.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	/**
	 * 로그인 시 회원 체크
	 * @param email - 입력한 email
	 * @param pw - 입력한 password
	 * @return 회원 여부 결과
	 */
	@Override
	public int userCheck(String email, String pw) {
		int x = -1;
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO vo = memberDAO.userCheck(email);
		
		if(vo != null) {
			if(pw.equals(vo.getM_password()))
				x = 1; // 아이디/비밀번호 둘다 맞는경우
			else
				x = -1; // 아이디는 맞지만 비밀번호가 다른경우
		}else 
			x = 0; // 회원이 아닌 경우
		return x;
	}

	@Override
	public MemberVO getMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteMember(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public String findEmail(MemberVO vo) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		String email = memberDAO.findEmail(vo);
		
		if(email != null) { 
			return email;
		}
		else
			return  "fail";
					
	}

	@Override
	public MemberVO findPw(MemberVO vo) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO memberVO = memberDAO.findPw(vo);
		if(memberVO == null) {
			return null;
		}else {
			return memberVO;
		}
	}


	@Override
	public int updatePw(MemberVO vo) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		int num = memberDAO.updatePw(vo);
		return num;
	}

}
