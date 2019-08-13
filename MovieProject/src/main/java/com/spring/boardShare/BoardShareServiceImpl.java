package com.spring.boardShare;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.BoardFreeDAO;
import com.spring.boardFree.BoardFreeVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberDAO;
import com.spring.member.MemberVO;
import com.spring.paging.SearchCriteria;

@Service("boardShareService")
public class BoardShareServiceImpl implements BoardShareService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BoardShareVO getContent(int page) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		boardShareDAO.updateViewCnt(page);
		BoardShareVO vo = boardShareDAO.getContent(page);
		return vo;
	}

	@Override
	public MemberVO getWriter(int id) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		MemberVO vo = boardShareDAO.getWriter(id);
		return vo;
	}

	@Override
	public int getUser(String email) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		int num = boardShareDAO.getUser(email);
		return num;
	}

	@Override
	public String warn_check(WarnVO vo) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		
		WarnVO warnVO = boardShareDAO.warn_check(vo.getId());
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertWarn(vo));  // 1
		}
		
		return msg;
	}
	
	/**
	  * bs_warning에 추가하고, board_share에 신고수 증가
	  * @param vo 
	  * @return msg
	*/
	@Override
	public int insertWarn(WarnVO vo) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		WarnCount(vo.getBs_bno()); // 신고수 1 증가
		int num = boardShareDAO.insertWarn(vo); 
		
		return num;
	}
	
	/**
	  * board_free에 신고수 증가
	  * @param bno - 게시글의 번호
	*/
	private void WarnCount(int bno) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		boardShareDAO.WarnCount(bno);
	}

	@Override
	public String ReplyWarn(WarnVO vo) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		WarnVO warnVO = boardShareDAO.ReplyWarn(vo);
		String msg = "";
		System.out.println("11:" + warnVO);
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertReplyWarn(vo));  // 1
		}
		
		return msg;
	}

	@Override
	public int insertReplyWarn(WarnVO vo) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		ReplyWarnCount(vo.getBsr_rno()); // 신고수 1 증가
		int num = boardShareDAO.insertReplyWarn(vo); 
		
		return num;
	}
	
	private void ReplyWarnCount(int rno) {
		BoardShareDAO boardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		boardShareDAO.ReplyWarnCount(rno);
	}
	
	@Override
	public int insertBoardShare(BoardShareVO shareVO) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		int result = BoardShareDAO.insertBoardShare(shareVO);
		
		return result;
	}

	@Override
	public int updateBoardShare(BoardShareVO shareVO) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		int result = BoardShareDAO.updateBoardShare(shareVO);
		
		return result;
	}

	@Override
	public BoardShareVO selectBoardShare(int bs_bno) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		BoardShareVO shareVO = BoardShareDAO.selectBoardShare(bs_bno);
		
		return shareVO;
	}

	@Override
	public int getMemberId(String m_email) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		int id = BoardShareDAO.getMemberId(m_email);
		return id;
	}
	
	@Override
	public String getMemberNickname(String m_email) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		String m_nickname = BoardShareDAO.getMemberNickname(m_email);
		
		return m_nickname;
	}

	@Override
	public MemberVO getMember(int id) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		MemberVO member = BoardShareDAO.getMember(id);
		
		return member;
	}
	
	@Override
    public List<BoardShareVO> listSearch(SearchCriteria searchCriteria) {
		BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
		List<BoardShareVO> list = BoardShareDAO.listSearch(searchCriteria);
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
    public int countSearchedArticles(SearchCriteria searchCriteria) {
    	BoardShareDAO BoardShareDAO = sqlSession.getMapper(BoardShareDAO.class);
    	return BoardShareDAO.countSearchedArticles(searchCriteria);
    }
}
