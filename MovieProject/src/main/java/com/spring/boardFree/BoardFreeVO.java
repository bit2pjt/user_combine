package com.spring.boardFree;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFreeVO {
	private int id; //자유 작성자
	private int bf_thumb; // 자유 추천/비추천
	private String bf_category; //자유 카테고리
	private String bf_title; // 자유 글제목
	private Date bf_reg_date; // 자유등록일
	private Date bf_update_date; // 자유 수정일
	private String bf_source; //자유 출처
	private String bf_content; // 자유본문
	private int bf_warn_counter; // 자유신고 수
	private int bf_view_counter; // 자유 조회 수
	private String bf_deleteyn; // 자유게시글삭제여부
	
	
}
