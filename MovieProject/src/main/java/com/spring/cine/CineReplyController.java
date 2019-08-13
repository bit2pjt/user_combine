package com.spring.cine;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.paging.Criteria;
import com.spring.paging.PageMaker;

@Controller
@RequestMapping("/replies/cine")
public class CineReplyController {

	@Autowired
	CineReplyService cineReplyService;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CineReplyVO replyVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("m_email");
		int id = cineReplyService.getUser(email); // 로그인한 사용자의 id값
		try {
			replyVO.setId(id);
			cineReplyService.addReply(replyVO);
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
	@RequestMapping(value = "/all/{cr_code}", method = RequestMethod.GET)
    public ResponseEntity<List<CineReplyVO>> list(@PathVariable("cr_code") Integer cr_code) {
        ResponseEntity<List<CineReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(cineReplyService.getReplies(cr_code), HttpStatus.OK);
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
	@RequestMapping(value = "/{cr_code}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("cr_code") Integer cr_code, @RequestBody CineReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setCr_code(cr_code);
			cineReplyService.modifyReply(replyVO);
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
	@RequestMapping(value = "/{cr_code}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("cr_code") Integer cr_code) {
		ResponseEntity<String> entity = null;
		try {
			cineReplyService.removeReply(cr_code);
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
	@RequestMapping(value = "/{cc_code}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("cc_code") Integer cc_code,
                                                          @PathVariable("page") Integer page) {
        ResponseEntity<Map<String, Object>> entity = null;
        System.out.println("들어옴");
        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);
            List<CineReplyVO> replies = cineReplyService.getRepliesPaging(cc_code, criteria);
            int repliesCount = cineReplyService.countReplies(cc_code);
            int scoreTotal = cineReplyService.sumScore(cc_code);
            
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCriteria(criteria);
            pageMaker.setTotalCount(repliesCount);
            
            Map<String, Object> map = new HashMap<>();
            map.put("scoreTotal", scoreTotal);
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
