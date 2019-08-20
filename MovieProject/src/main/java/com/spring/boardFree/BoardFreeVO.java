package com.spring.boardFree;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFreeVO {
	private int bf_bno; // 게시글 번호
	private int id; // id
	private String bf_category; // 카테고리 (정해야할거 같음)
	private String bf_title; // 글제목
	private Date bf_reg_date; // 등록일
	private Date bf_update_date; // 수정일
	private String bf_source; // 필요없는거 같음(삭제할지 판단)
	private String bf_content; // 글 내용
	private int bf_warn_counter; // 신고수
	private int bf_view_counter; // 조회수
	private String bf_deleteyn; // 삭제 유무
	private int bf_recommend; // 추천
	private int bf_decommend; // 비추천
	private String nickname;
}
