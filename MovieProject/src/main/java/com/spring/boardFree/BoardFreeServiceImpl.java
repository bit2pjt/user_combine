package com.spring.boardFree;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.MemberVO;
/**
* @Class Name : BoardFreeServiceImpl.java
* @Description : BoardFreeServiceImpl
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 23         황진석            		최초생성
* @ 2019. 07. 24	황진석				추천기능 추가
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
		if(vo.getBf_thumb() == 1)
			updateRecommend(vo); // board_free update
		else
			updateDecommend(vo); // board_free update
		
		int num = getRecommend(vo.getBf_bno());
		return num;
	}
	
	/**
	  * board_free의 bf_recommend update
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	 */
	@Override
	public void updateRecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateRecommend(vo);
	}
	
	/**
	  * board_free의 bf_decommend update
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	 */
	@Override
	public void updateDecommend(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		boardFreeDAO.updateDecommend(vo);
	}
	
	/**
	  * thumb_check에 해당 id가 존재하는지 확인
	  * @param vo - 게시글의 번호와 추천/비추천여부 및 id
	  * @return msg(추천수)
	 */
	@Override
	public String thumb_check(ThumbVO vo) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		// bf_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
		ThumbVO thumbVO = boardFreeDAO.thumb_check(vo.getId()); 
		String msg = "";
		if( thumbVO != null) {// bf_thumb테이블에 해당 아이디가 있으면 중복 추천/비추천 불가
			msg ="fail";
		}else { // bf_thumb테이블에 해당 아이디가 없으면 중복 추천/비추천 불가
			msg = String.valueOf(plusRecommend(vo)); // board_free에서 추천수를 가져와서 보여준다.
		}
		return msg;
	}
	
	/**
	  * board_free에서 추천수를 가져온다.
	  * @param bno - 게시글 번호
	  * @return num(추천수)
	 */
	@Override
	public int getRecommend(int bno) {
		BoardFreeDAO boardFreeDAO = sqlSession.getMapper(BoardFreeDAO.class);
		int num = boardFreeDAO.getRecommend(bno);
		return num;
	}



}
