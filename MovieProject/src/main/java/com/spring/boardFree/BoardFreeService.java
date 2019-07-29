package com.spring.boardFree;


public interface BoardFreeService {

	//자유게시판 리플 내용 db에 insert 하기
	public void bfr_content(String bfr_content);

	// 자유게시판 리플내용 db에 select 하기
	public String bfr_content_select(String bfr_content);

	// BoardFreeReplyVO 객체안 데이터 가져오기
	public BoardFreeVO viewMember(int id);

	
	//조회수 업데이트 문
	public void update_count(int id);

}
