package com.spring.movie;

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
@RequestMapping("/replies/info")
public class MovieReplyController {

	@Autowired
	MovieReplyService movieReplyService;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody MovieReplyVO replyVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("m_email");
		int id = movieReplyService.getUser(email); // 로그인한 사용자의 id값
		try {
			replyVO.setId(id);
			movieReplyService.addReply(replyVO);
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
	@RequestMapping(value = "/all/{mr_code}", method = RequestMethod.GET)
    public ResponseEntity<List<MovieReplyVO>> list(@PathVariable("mr_code") Integer mr_code) {
        ResponseEntity<List<MovieReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(movieReplyService.getReplies(mr_code), HttpStatus.OK);
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
	@RequestMapping(value = "/{mr_code}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("mr_code") Integer mr_code, @RequestBody MovieReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setMr_code(mr_code);
			movieReplyService.modifyReply(replyVO);
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
	@RequestMapping(value = "/{mr_code}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("mr_code") Integer mr_code) {
		ResponseEntity<String> entity = null;
		try {
			movieReplyService.removeReply(mr_code);
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
	@RequestMapping(value = "/{mi_code}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("mi_code") Integer mi_code,
                                                          @PathVariable("page") Integer page) {
        ResponseEntity<Map<String, Object>> entity = null;
        
        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);
            List<MovieReplyVO> replies = movieReplyService.getRepliesPaging(mi_code, criteria);
            int repliesCount = movieReplyService.countReplies(mi_code);
            int scoreTotal = movieReplyService.sumScore(mi_code);
            System.out.println("scoreTotal: " + scoreTotal);
            
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
