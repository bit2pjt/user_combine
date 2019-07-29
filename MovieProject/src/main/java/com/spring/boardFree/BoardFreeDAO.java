package com.spring.boardFree;

public interface BoardFreeDAO {
	
	
	//댓글 메시지 입력 insert
	public void insert_bfr_content(String bfr_content);
	
	//댓글 메세지 select 
	public String select_bfr_content(String bfr_content);


	public BoardFreeVO viewMember(int id);

	public void update_count(int id);
}
