package com.spring.boardFree;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberDAO;
import com.spring.member.MemberVO;
import com.spring.paging.Criteria;
import com.spring.paging.SearchCriteria;
/**
* @Class Name : BoardFreeServiceImpl.java
* @Description : BoardFreeServiceImpl
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 23         황진석            		최초생성
* @ 2019. 07. 24	황진석				추천기능 추가 / 신고기능 추가
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@Service("boardFreeService")
public class BoardFreeServiceImpl implements BoardFreeService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	  * 게시글의 내용을 가져옴
	  * @param page - 게시글번호
	  * @return vo
	*/
	@Override
	public BoardFreeVO getContent(int page) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateViewCnt(page);
		BoardFreeVO vo = boardFreeDAO.getContent(page);
		
		return vo;
	}
	

	/**
	  * 해당 id의 정보를 member에서 가져옴
	  * @param id - id
	  * @return vo
	*/
	@Override
	public MemberVO getWriter(int id) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		MemberVO vo = boardFreeDAO.getWriter(id);
		
		return vo;
	}
	
	/**
	  * 세션에 저장된 이메일값을 이용해 id를 가져옴
	  * @param email - email
	  * @return num - id
	 */
	@Override
	public int getUser(String email) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getUser(email);
		return num;
	}
	
	/**
	  * bf_thumb에 추가 및 board_free update를 한꺼번에 작업
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return num(추천수)
	 */
	@Override
	public int plusRecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.plusRecommend(vo); // bf_thumb insert
		int num = 0;
		if(vo.getBf_thumb() == 1) {
			updateRecommend(vo); // board_free update
			num = getRecommend(vo.getBf_bno());
		}else {
			updateDecommend(vo); // board_free update
			num = getDecommend(vo.getBf_bno());
		}
		return num;
	}
	
	/**
	  * board_free의 bf_recommend update
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	 */
	private void updateRecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateRecommend(vo);
	}
	
	/**
	  * bf_reply의  bfr_like update
	 */
	private void updateReplyRecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateReplyRecommend(vo);
	}
	
	/**
	  * board_free의 bf_decommend update
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	 */

	private void updateDecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateDecommend(vo);
	}
	
	/**
	  * bf_reply의  bfr_dislike update
	 */
	private void updateReplyDecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateReplyDecommend(vo);
		System.out.println("update");
	}
	
	/**
	  * board_free에서 추천수를 가져온다.
	  * @param bno - 게시글 번호
	  * @return num(추천수)
	 */
	private int getRecommend(int bno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getRecommend(bno);
		return num;
	}
	
	/**
	  * board_free에서 비추천수를 가져온다.
	  * @param bno - 게시글 번호
	  * @return num(추천수)
	 */
	private int getDecommend(int bno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getDecommend(bno);
		return num;
	}
	
	
	/**
	  * bf_reply에서 추천수를 가져온다.
	  * @param bfr_rno - 게시글 번호
	  * @return num(추천수)
	 */
	private int getReplyRecommend(int bfr_rno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getReplyRecommend(bfr_rno);
		return num;
	}
	
	/**
	  * bf_reply에서 비추천수를 가져온다.
	  * @param bfr_rno - 게시글 번호
	  * @return num(추천수)
	 */
	private int getReplyDecommend(int bfr_rno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getReplyDecommend(bfr_rno);
		return num;
	}
	
	/**
	  * bf_thumb에 해당 id가 존재하는지 확인
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return msg(추천수)
	 */
	@Override
	public String thumb_check(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		// bf_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
		System.out.println("1: " + vo.getBf_bno());
		System.out.println("2: " + vo.getId());
		ThumbVO thumbVO = boardFreeDAO.thumb_check(vo); 
		String msg = "";
		if( thumbVO != null) {// bf_thumb테이블에 해당 아이디가 있으면 중복 추천/비추천 불가
			msg ="fail";
		}else { // bf_thumb테이블에 해당 아이디가 없으면 중복 추천/비추천 불가
			msg = String.valueOf(plusRecommend(vo)); // board_free에서 추천수를 가져와서 보여준다.
		}
		return msg;
	}
	


	/**
	  * free_warning에 추가하고, board_free에 신고수 증가
	  * @param vo 
	  * @return msg
	*/
	@Override
	public int insertWarn(WarnVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		WarnCount(vo.getBf_bno()); // 신고수 1 증가
		int num = boardFreeDAO.insertWarn(vo); 
		
		return num;
	}
	
	/**
	  * bfr_warning에 추가하고, bf_reply에 신고수 증가
	  * @param vo 
	  * @return msg
	*/
	@Override
	public int insertReplyWarn(WarnVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		ReplyWarnCount(vo.getBfr_rno()); // 신고수 1 증가
		int num = boardFreeDAO.insertReplyWarn(vo); 
		
		return num;
	}
	
	/**
	  * board_free에 신고수 증가
	  * @param bno - 게시글의 번호
	*/
	private void WarnCount(int bno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.WarnCount(bno);
	}
	
	/**
	  * bf_Reply에 신고수 증가
	  * @param bno - 게시글의 번호
	*/
	private void ReplyWarnCount(int rno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.ReplyWarnCount(rno);
	}
	
	/**
	  * free_warning에 id가 있는지 없는지 확인
	  * @param vo 
	  * @return msg
	 */
	@Override
	public String warn_check(WarnVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		WarnVO warnVO = boardFreeDAO.warn_check(vo);
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertWarn(vo));  // 1
		}
		
		return msg;
	}
	
	/**
	  * bfr_warning에 있는지 없는지 확인
	  * @param vo 
	  * @return msg
	 */
	@Override
	public String ReplyWarn(WarnVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		WarnVO warnVO = boardFreeDAO.ReplyWarn(vo);
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertReplyWarn(vo));  // 1
		}
		
		return msg;
	}

	
	/**
	  * br_thumb에 해당 id 와 댓글번호가 동시에 존재하는것이 있는지 확인
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return msg(추천수)
	 */
	@Override
	public String reply_check(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		// br_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
		ThumbVO thumbVO = boardFreeDAO.reply_check(vo); 
		String msg = "";
		
		if( thumbVO != null) {// br_thumb테이블에 해당 댓글번호가 있으면 중복 추천/비추천 불가
			msg ="fail";
		}else { 
			msg = String.valueOf(replyRecommend(vo)); // bf_reply에서 추천수를 가져와서 보여준다.
		}
		return msg;
	}

	
	/**
	  * bf_reply에서 추천수를 가져와서 보여준다.
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return msg(추천수)
	 */
	@Override
	public int replyRecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.replyRecommend(vo); // br_thumb 추가
		int num=0;
		System.out.println("bf_thumb: " + vo.getBf_thumb());
		if(vo.getBf_thumb() == 1) {
			updateReplyRecommend(vo); // bf_reply update
			num = getReplyRecommend(vo.getBfr_rno());
		}else {
			updateReplyDecommend(vo); // bf_reply update
			num = getReplyDecommend(vo.getBfr_rno());
		}
		return num;
	}


	@Override
	public void boardDelete(int bno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardFreeVO> listAll() {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		return boardFreeDAO.listAll(); 
	}

	@Override
	public String getMemberNickname(String m_email) {
		BoardFreeDAO BoardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		String m_nickname = BoardFreeDAO.getMemberNickname(m_email);
		
		return m_nickname;
	}

	@Override
	public MemberVO getMember(int id) {
		BoardFreeDAO BoardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		MemberVO member = BoardFreeDAO.getMember(id);
		
		return member;
	}

	@Override
	public int insertBoardFree(BoardFreeVO freeVO) {
		BoardFreeDAO BoardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int result = BoardFreeDAO.insertBoardFree(freeVO);
		
		return result;
	}

	@Override
	public int updateBoardFree(BoardFreeVO freeVO) {
		BoardFreeDAO BoardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int result = BoardFreeDAO.updateBoardFree(freeVO);
		
		return result;
	}

	@Override
	public BoardFreeVO selectBoardFree(int bf_bno) {
		BoardFreeDAO BoardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		BoardFreeVO freeVO = BoardFreeDAO.selectBoardFree(bf_bno);
		
		return freeVO;
	}


	@Override
	public int getMemberId(String m_email) {
		BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int id = boardDAO.getMemberId(m_email);
		return id;
	}

	@Override
	public List<BoardFreeVO> listCriteria(Criteria criteria) {
		BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
		return boardDAO.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) {
		BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
		return boardDAO.countArticles(criteria);
	}
	
	@Override
    public List<BoardFreeVO> listSearch(SearchCriteria searchCriteria) {
		BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
		List<BoardFreeVO> list = boardDAO.listSearch(searchCriteria);
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
    	BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
    	return boardDAO.countSearchedArticles(searchCriteria);
    }
	
    @Override
    public List<BoardFreeVO> boardListDaily() {
    	BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
    	List<BoardFreeVO> result = boardDAO.boardListDaily();
    	for(int i=0; i<result.size(); i++) {
			int id = result.get(i).getId();
			String nickname = userNickName(id);
			result.get(i).setNickname(nickname);
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//			String date = sdf.format(result.get(i).getBf_update_date());
//			Date update_Date;
//			try {
//				update_Date = new java.text.SimpleDateFormat("yyyy/MM/dd").parse(date);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				update_Date = null;
//			}
//			System.out.println(date + ", " + update_Date);

			
		}
    	return result;
    }
    
    @Override
    public List<BoardFreeVO> boardListWeekly() {
    	BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
    	List<BoardFreeVO> result = boardDAO.boardListWeekly();
    	for(int i=0; i<result.size(); i++) {
			int id = result.get(i).getId();
			String nickname = userNickName(id);
			result.get(i).setNickname(nickname);
		}
    	return result;
    }
    
    @Override
    public List<BoardFreeVO> boardListMonthly() {
    	BoardFreeDAO boardDAO = sqlSession.getMapper(BoardFreeDAO.class);
    	List<BoardFreeVO> result = boardDAO.boardListMonthly();
    	for(int i=0; i<result.size(); i++) {
			int id = result.get(i).getId();
			String nickname = userNickName(id);
			result.get(i).setNickname(nickname);
		}
    	return result;
    }

}
