package com.spring.boardFree;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.paging.Criteria;

/**
* @Class Name : BFReplyServiceImpl.java
* @Description : BoardFree 게시판의 댓글 serviceimpl class
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 26         황진석            		최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/
@Service("replyService")
public class BFReplyServiceImpl implements BFReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	  * 댓글 리스트를 가져옴
	  * @param boardNum - 게시글 번호
	  * @return List<BFReplyVO>
	 */
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
	
	/**
	  * 댓글 등록
	  * @param replyVO - 댓글 내용을 담은 vo
	 */
	@Override
	public void addReply(BFReplyVO replyVO) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.create(replyVO);
	}

	/**
	  * 댓글 수정
	  * @param replyVO - 댓글 수정내용을 담은 vo
	 */
	@Override
	public void modifyReply(BFReplyVO replyVO) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.update(replyVO);
	}

	/**
	  * 댓글 삭제
	  * @param replyNum - 삭제할 댓글의 번호
	 */
	@Override
	public void removeReply(Integer replyNum) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		bFReplyDAO.delete(replyNum);
	}

	/**
	  * 댓글의 총개수
	  * @param boardNum - 게시글 번호
	 */
	@Override
	public int countReplies(Integer boardNum) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		return bFReplyDAO.countReplies(boardNum);
	}
	
	/**
	  * 댓글 리스트를 가져옴(페이징 처리된 댓글 리스트)
	  * @param bfr_bno - 게시글 번호
	  * @param criteria - 페이지관련 객체
	  * @return List<BFReplyVO>
	 */
	@Override
	public List<BFReplyVO> getRepliesPaging(Integer bfr_bno, Criteria criteria) {
		BFReplyDAO bFReplyDAO = sqlSession.getMapper(BFReplyDAO.class);
		criteria.setBfr_bno(bfr_bno);
		
		List<BFReplyVO> list = bFReplyDAO.listPaging(criteria);
		
		for(int i=0; i<list.size(); i++) { // 닉네임을 가져와서 저장
			int id = list.get(i).getId();
			String nickname = userNickName(id);
			list.get(i).setNickname(nickname);
		}
		
		return list;
	}
	
	

}
