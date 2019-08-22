package com.spring.mml;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

@Service("mml_ReplyService")
public class Mml_ReplyServiceImpl implements Mml_ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	  * 댓글 리스트를 가져옴
	  * @param boardNum - 게시글 번호
	  * @return List<BFReplyVO>
	 */
	@Override
	public List<Mml_ReplyVO> getReplies(Integer mml_num) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		List<Mml_ReplyVO> list = mmlReplyDAO.list(mml_num);
		for(int i=0; i<list.size(); i++) {
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		return list;
	}
	
	/**
	  * 댓글 리스트를 가져옴
	  * @param id - id
	  * @return String - 닉네임
	 */
	private String userNickName(int id) {
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		String nickname = memberDAO.userNickName(id);
		return nickname;
	}
	

	@Override
	public void addReply(Mml_ReplyVO replyVO) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		mmlReplyDAO.create(replyVO);
	}

	/**
	  * 댓글 수정
	  * @param replyVO - 댓글 수정내용을 담은 vo
	 */
	@Override
	public void modifyReply(Mml_ReplyVO replyVO) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		mmlReplyDAO.update(replyVO);
	}

	/**
	  * 댓글 삭제
	  * @param replyNum - 삭제할 댓글의 번호
	 */
	@Override
	public void removeReply(Integer mml_reply_code) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		mmlReplyDAO.delete(mml_reply_code);
	}

	/**
	  * 댓글의 총개수
	  * @param boardNum - 게시글 번호
	 */
	@Override
	public int countReplies(Integer mml_num) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		return mmlReplyDAO.countReplies(mml_num);
	}
	
	/**
	  * 댓글 리스트를 가져옴(페이징 처리된 댓글 리스트)
	  * @param bfr_bno - 게시글 번호
	  * @param criteria - 페이지관련 객체
	  * @return List<BFReplyVO>
	 */
	@Override
	public List<Mml_ReplyVO> getRepliesPaging(Integer mml_num, Criteria criteria) {
		Mml_ReplyDAO mmlReplyDAO = sqlSession.getMapper(Mml_ReplyDAO.class);
		criteria.setMml_num(mml_num);
		
		List<Mml_ReplyVO> list = mmlReplyDAO.listPaging(criteria);
		
		for(int i=0; i<list.size(); i++) { // 닉네임을 가져와서 저장
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		
		return list;
	}
	
	

}
