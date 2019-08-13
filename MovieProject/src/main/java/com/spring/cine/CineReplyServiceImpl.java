package com.spring.cine;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

@Service("cineReplyService")
public class CineReplyServiceImpl implements CineReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CineReplyVO> getReplies(Integer mi_code) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		List<CineReplyVO> list = cineReplyDAO.list(mi_code);
		for(int i=0; i<list.size(); i++) {
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		return list;
	}
	
	private String userNickName(int id) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		String nickname = memberDAO.userNickName(id);
		return nickname;
	}

	@Override
	public void addReply(CineReplyVO replyVO) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		System.out.println("1: " + replyVO.getCc_code());
		System.out.println("1: " + replyVO.getCr_code());
		System.out.println("1: " + replyVO.getCr_content());
		System.out.println("1: " + replyVO.getCr_score());
		cineReplyDAO.create(replyVO);
	}

	@Override
	public void modifyReply(CineReplyVO replyVO) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		cineReplyDAO.update(replyVO);
	}

	@Override
	public void removeReply(Integer mi_code) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		cineReplyDAO.delete(mi_code);
	}

	@Override
	public List<CineReplyVO> getRepliesPaging(Integer cc_code, Criteria criteria) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		criteria.setCc_code(cc_code);
		System.out.println("1들어옴");
		List<CineReplyVO> list = cineReplyDAO.listPaging(criteria);
		for(int i=0; i<list.size(); i++) { // 닉네임을 가져와서 저장
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		
		return list;
	}

	@Override
	public int countReplies(Integer mi_code) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		return cineReplyDAO.countReplies(mi_code);
	}

	@Override
	public int sumScore(Integer mi_code) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		return cineReplyDAO.sumScore(mi_code);
	}

	@Override
	public int getUser(String email) {
		CineReplyDAO cineReplyDAO = sqlSession.getMapper(CineReplyDAO.class);
		int num = cineReplyDAO.getUser(email);
		return num;
	}

}
