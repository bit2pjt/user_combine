package com.spring.boardShare;

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


@RestController
@RequestMapping("/replies/bs")
public class BSReplyController {

	@Autowired(required=false)
	BSReplyService bSreplyService;
	
	@Autowired(required=false)
	BoardShareService boardFreeService;
	
	/**
	  * 댓글 등록
	  * @param replyVO - 댓글 내용을 담은 vo
	  * @param session - 세션
	  * @return ResponseEntity<String>
	 */
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BSReplyVO replyVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("m_email");
		int id = boardFreeService.getUser(email); // 로그인한 사용자의 id값
		try {
			replyVO.setId(id);
			bSreplyService.addReply(replyVO);
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
	@RequestMapping(value = "/all/{bs_bno}", method = RequestMethod.GET)
   public ResponseEntity<List<BSReplyVO>> list(@PathVariable("bs_bno") Integer bs_bno) {
       ResponseEntity<List<BSReplyVO>> entity = null;
       try {
           entity = new ResponseEntity<>(bSreplyService.getReplies(bs_bno), HttpStatus.OK);
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
	@RequestMapping(value = "/{bsr_rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("bsr_rno") Integer bsr_rno, @RequestBody BSReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setBsr_rno(bsr_rno);
			bSreplyService.modifyReply(replyVO);
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
	@RequestMapping(value = "/{bsr_rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("bsr_rno") Integer bsr_rno) {
		ResponseEntity<String> entity = null;
		try {
			bSreplyService.removeReply(bsr_rno);
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
	@RequestMapping(value = "/{bs_bno}/{page}", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("bs_bno") Integer bs_bno,
                                                         @PathVariable("page") Integer page) {
       ResponseEntity<Map<String, Object>> entity = null;

       try {
           Criteria criteria = new Criteria();
           criteria.setPage(page);
           List<BSReplyVO> replies = bSreplyService.getRepliesPaging(bs_bno, criteria);
           int repliesCount = bSreplyService.countReplies(bs_bno);
           System.out.println("aaaaaaaaaaaaaaa: " + replies);
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
