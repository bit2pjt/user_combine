package com.spring.boardFree;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.paging.Criteria;
import com.spring.paging.PageMaker;

/**
* @Class Name : BFReplyController.java
* @Description : BoardFree 게시판의 댓글
* @Modification Information
* @
* @  	수정일               	 수정자                  	수정내용
* @ -----------   ---------   -------------------------------
* @ 2019. 07. 24         황진석            		최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

@RestController
@RequestMapping("/replies")
public class BFReplyController {
	
	@Autowired(required=false)
	BFReplyService replyService;
	
	@Autowired(required=false)
	BoardFreeService boardFreeService;
	
	/**
	  * 댓글 등록
	  * @param replyVO - 댓글 내용을 담은 vo
	  * @param session - 세션
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BFReplyVO replyVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(email); // 로그인한 사용자의 id값
		try {
			replyVO.setId(id);
			replyService.addReply(replyVO);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	  * 해당 게시글의 댓글 전체목록 가져오기
	  * @param bfr_bno - 게시글 번호
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value = "/all/{bfr_bno}", method = RequestMethod.GET)
    public ResponseEntity<List<BFReplyVO>> list(@PathVariable("bfr_bno") Integer bfr_bno) {
        ResponseEntity<List<BFReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(replyService.getReplies(bfr_bno), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
	

	/**
	  *	댓글 수정
	  * @param bfr_bno - 게시글 번호
	  * @param replyVO - 댓글 수정 내용
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value = "/{bfr_rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("bfr_rno") Integer bfr_rno, @RequestBody BFReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setBfr_rno(bfr_rno);
			replyService.modifyReply(replyVO);
			entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	  *	댓글 삭제
	  * @param bfr_bno - 게시글 번호
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value = "/{bfr_rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("bfr_rno") Integer bfr_rno) {
		ResponseEntity<String> entity = null;
		try {
			replyService.removeReply(bfr_rno);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	  * 해당 게시글의 댓글 전체목록 가져오기(페이징)
	  * @param bfr_bno - 게시글 번호
	  * @param page - 페이지 번호
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value = "/{bfr_bno}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("bfr_bno") Integer bfr_bno,
                                                          @PathVariable("page") Integer page) {
        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);
            List<BFReplyVO> replies = replyService.getRepliesPaging(bfr_bno, criteria);
            int repliesCount = replyService.countReplies(bfr_bno);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCriteria(criteria);
            pageMaker.setTotalCount(repliesCount);

            Map<String, Object> map = new HashMap<>();
            map.put("replies", replies);
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<>(map, HttpStatus.OK);

        } catch (Exception e) {

            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.OK);

        }

        return entity;
    }
	
}
