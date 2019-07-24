package com.spring.boardFree;

import java.util.List;

public interface BFReplyDAO {
	List<BFReplyVO> list(Integer articleNo) throws Exception;

	void create(BFReplyVO replyVO) throws Exception;

	void update(BFReplyVO replyVO) throws Exception;

	void delete(Integer replyNo) throws Exception;
}
