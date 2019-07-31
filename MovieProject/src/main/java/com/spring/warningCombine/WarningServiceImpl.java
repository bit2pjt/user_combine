package com.spring.warningCombine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WarningServiceImpl implements WarningService {
	
	@Autowired
	WarningDTO warningDTO;
	
	@Override
	public String warningCombine(WarningCombineVO vo) {
		
		String result;
		
		
		
		switch (vo.getBoardCode()) {
		case 1 :
			vo.setTableName("free_warning");
			result = "자유게시판 게시글  신고 완료";
			break;
		case 2 :
			vo.setTableName("bfr_warning");
			result = "자유게시판 댓글 신고 완료";
			break;
		case 3 :
			vo.setTableName("share_warning");
			result = "나눔게시판 게시글 신고 완료";
			break;
		case 4 :
			vo.setTableName("sr_warning");
			result = "나눔게시판 댓글 신고 완료";
			break;
		case 5 :
			vo.setTableName("mml_warning");
			result = "나영리 게시판 게시글 신고 완료";
			break;
		case 6 :
			vo.setTableName("mmlr_warning");
			result = "나영리 게시판 댓글 신고 완료";
			break;
		case 7 :
			vo.setTableName("mr_warning");
			result = "영화리뷰 신고 완료";
			break;
		case 8 :	
			vo.setTableName("cr_warning");
			result = "극장리뷰 신고 완료";
			break;
		default :
			result = "일치하는 게시판 코드가 없습니다.";
			return result;
		}
		
		warningDTO.warningCombine(vo);
		return result;
	}

}