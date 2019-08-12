package com.spring.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BFReplyVO;
import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

@Service("movieReplyService")
public class MovieReplyServiceImpl implements MovieReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieReplyVO> getReplies(Integer mi_code) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		List<MovieReplyVO> list = movieReplyDAO.list(mi_code);
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
	public void addReply(MovieReplyVO replyVO) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		movieReplyDAO.create(replyVO);
	}

	@Override
	public void modifyReply(MovieReplyVO replyVO) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		movieReplyDAO.update(replyVO);
	}

	@Override
	public void removeReply(Integer mr_code) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		movieReplyDAO.delete(mr_code);
	}

	@Override
	public List<MovieReplyVO> getRepliesPaging(Integer mi_code, Criteria criteria) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		criteria.setMi_code(mi_code);
		
		List<MovieReplyVO> list = movieReplyDAO.listPaging(criteria);
		for(int i=0; i<list.size(); i++) { // 닉네임을 가져와서 저장
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		
		return list;
	}

	@Override
	public int countReplies(Integer mi_code) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		return movieReplyDAO.countReplies(mi_code);
	}

	@Override
	public int getUser(String email) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		int num = movieReplyDAO.getUser(email);
		return num;
	}

	@Override
	public int sumScore(Integer mi_code) {
		MovieReplyDAO movieReplyDAO = sqlSession.getMapper(MovieReplyDAO.class);
		return movieReplyDAO.sumScore(mi_code);
	}

}
