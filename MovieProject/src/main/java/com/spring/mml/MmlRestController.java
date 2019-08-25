package com.spring.mml;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController
public class MmlRestController {

	@Autowired
	MmlService mmlService;

	@GetMapping(value = "/getCountFollower/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
																	MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> getCountFollower(@PathVariable("id") int id) {
		// 왜 ResponseEntity는 Integer를 정상적으로 못넘기지? 객체에 담아서 보내면 불안한데...
		String result = mmlService.getContFollower(id) + "";
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping(value = "/getCountFollowing/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> getCountFollowing(@PathVariable("id") int id) {
// 왜 ResponseEntity는 Integer를 정상적으로 못넘기지? 객체에 담아서 보내면 불안한데...
		String result = mmlService.getContFollowing(id) + "";
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	

	@GetMapping(value = "/getCountLike/{mml_num}", produces = { MediaType.APPLICATION_XML_VALUE,
																	MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> getCountLike(@PathVariable("mml_num") int mml_num) {
		System.out.println(mml_num + " 넘어옴");
		// 왜 ResponseEntity는 Integer를 정상적으로 못넘기지? 객체에 담아서 보내면 불안한데...
		String result = mmlService.getCountLike(mml_num) + "";
		System.out.println(result + " 결과나옴");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping(value = "/registerFollowRelationship/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
																			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> registerFollowRelationship(@PathVariable("id") int id, HttpSession session) {
		System.out.println(id + " 넘어옴");
		int follower = (int) session.getAttribute("id"); // 세션id = 추종자
		System.out.println("세션에서 받은 조회자 id는 " + id);
		int followee = id; // id = 게시자 = 추종대상

		String result = mmlService.registerFR(followee, follower);
		System.out.println(result + " 결과나옴");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping(value = "/giveLike/{mml_num}", produces = { MediaType.APPLICATION_XML_VALUE,
																MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> giveLike(@PathVariable("mml_num") int mml_num, HttpSession session) {
		int giver = (int) session.getAttribute("id");// id = 추천인

		// giver는 추천인, mml_num은 대상 게시물 번호
		String result = mmlService.giveLike(giver, mml_num);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping(value = "/giveWarning/{mml_num}", produces = { MediaType.APPLICATION_XML_VALUE,
																	MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<String> giveWarning(@PathVariable("mml_num") int mml_num, HttpSession session) {
		int warner = (int) session.getAttribute("id");// id = 신고인

		// giver는 추천인, mml_num은 대상 게시물 번호
		String result = mmlService.giveWarning(warner, mml_num);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

}// e_controller