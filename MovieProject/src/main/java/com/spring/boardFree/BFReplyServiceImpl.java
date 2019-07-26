package com.spring.boardFree;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

@Service("replyService")
public class BFReplyServiceImpl implements BFReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BFReplyVO> getReplies(Integer boardNum) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		List<BFReplyVO> list = bFReplyDAO.list(boardNum);
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
	public void addReply(BFReplyVO replyVO) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.create(replyVO);
	}

	@Override
	public void modifyReply(BFReplyVO replyVO) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.update(replyVO);
	}

	@Override
	public void removeReply(Integer replyNum) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.delete(replyNum);
	}

	@Override
	public int countReplies(Integer boardNum) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		return bFReplyDAO.countReplies(boardNum);
	}
	@Override
	public List<BFReplyVO> getRepliesPaging(Integer bfr_bno, Criteria criteria) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		criteria.setBfr_bno(bfr_bno);
		List<BFReplyVO> list = bFReplyDAO.listPaging(criteria);
		for(int i=0; i<list.size(); i++) {
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		return list;
	}

}
