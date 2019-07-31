package com.spring.boardShare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

@Service("bSreplyService")
public class BSReplyServiceImpl implements BSReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BSReplyVO> getReplies(Integer boardNum) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		
		List<BSReplyVO> list = bSReplyDAO.list(boardNum);
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
	public void addReply(BSReplyVO replyVO) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		bSReplyDAO.create(replyVO);
	}

	@Override
	public void modifyReply(BSReplyVO replyVO) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		bSReplyDAO.update(replyVO);
		
	}

	@Override
	public void removeReply(Integer replyNum) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		bSReplyDAO.delete(replyNum);
	}

	@Override
	public List<BSReplyVO> getRepliesPaging(Integer bs_bno, Criteria criteria) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		criteria.setBs_bno(bs_bno);
		List<BSReplyVO> list = bSReplyDAO.listPaging(criteria);
	
		for(int i=0; i<list.size(); i++) {
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
	
		return list;
	}

	@Override
	public int countReplies(Integer boardNum) {
		BSReplyDAO bSReplyDAO = sqlSession.getMapper(BSReplyDAO.class);
		return bSReplyDAO.countReplies(boardNum);
	}

}
