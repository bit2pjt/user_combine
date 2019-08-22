package com.spring.mml;

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
@RequestMapping("/replies/mml")
public class Mml_ReplyController {
	
	@Autowired(required=false)
	Mml_ReplyService mmlreplyService;
	
	@Autowired(required=false)
	MmlService mmlService;
	
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Mml_ReplyVO replyVO, HttpSession session) {
		ResponseEntity<String> entity = null;
		String email = (String)session.getAttribute("m_email");
		int id = mmlService.getMemberId(email);// 로그인한 사용자의 id값
		try {
			replyVO.setId(id);
			System.out.println(replyVO);
			mmlreplyService.addReply(replyVO);
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
	@RequestMapping(value = "/all/{mml_num}", method = RequestMethod.GET)
    public ResponseEntity<List<Mml_ReplyVO>> list(@PathVariable("mml_num") Integer mml_num) {
        ResponseEntity<List<Mml_ReplyVO>> entity = null;
        try {
            entity = new ResponseEntity<>(mmlreplyService.getReplies(mml_num), HttpStatus.OK);
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
	@RequestMapping(value = "/{mml_reply_code}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("mml_reply_code") Integer mml_reply_code, @RequestBody Mml_ReplyVO replyVO) {
		ResponseEntity<String> entity = null;
		try {
			replyVO.setMml_reply_code(mml_reply_code);
			mmlreplyService.modifyReply(replyVO);
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
	@RequestMapping(value = "/{mml_reply_code}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("mml_reply_code") Integer mml_reply_code) {
		ResponseEntity<String> entity = null;
		try {
			mmlreplyService.removeReply(mml_reply_code);
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
	@RequestMapping(value = "/{mml_num}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("mml_num") Integer mml_num,
                                                          @PathVariable("page") Integer page) {
        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);
            System.out.println("cri" + criteria);
            List<Mml_ReplyVO> replies = mmlreplyService.getRepliesPaging(mml_num, criteria);
            int repliesCount = mmlreplyService.countReplies(mml_num);
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
