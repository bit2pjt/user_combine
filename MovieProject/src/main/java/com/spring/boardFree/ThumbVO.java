package com.spring.boardFree;

import lombok.Data;

@Data
public class ThumbVO { // 추천/비추천 공통 VO
	private int bf_thumb;
	private int cr_thumb;
	private int bfr_rno;
	private int bf_bno;
	private int mr_code;
	private int cr_code;
	private int id;
	private int mmlr_thumb;
	private int mml_reply_code;
}
