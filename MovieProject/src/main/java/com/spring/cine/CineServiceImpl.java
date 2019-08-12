package com.spring.cine;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.movie.MovieDAO;

import lombok.extern.log4j.Log4j;

@Service("cineService")
public class CineServiceImpl implements CineService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<String> getLocalName(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		
		List<CineVO> cineList = cineDAO.getLocalName(cineVO);
		List<String> list = new ArrayList<String>();

		for(int i=0; i<cineList.size(); i++) {
			list.add(cineList.get(i).getCC_LOCAL_NAME());
		}
		return list;
		
	}

	@Override
	public List<String> getName(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		
		List<CineVO> cineList = cineDAO.getName(cineVO);
		List<String> list = new ArrayList<String>();
		
		for(int i=0; i<cineList.size(); i++) {
			list.add(cineList.get(i).getCC_NAME());
		}
		
		return list;
	}

	@Override
	public CineVO getCineInfo(CineVO cineVO) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		CineVO vo = cineDAO.getCineInfo(cineVO);
		
		return vo;
	}

	@Override
	public int getUser(String email) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		int num = cineDAO.getUser(email);
		return num;
	}

	@Override
	public String reply_check(ThumbVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);

		ThumbVO thumbVO = cineDAO.reply_check(vo); 
		String msg = "";
		
		if( thumbVO != null) {
			msg ="fail";
		}else { 
			msg = String.valueOf(replyRecommend(vo)); 
		}
		return msg;
	}

	@Override
	public int replyRecommend(ThumbVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		cineDAO.replyRecommend(vo); 
		
		int num=0;
		
		if(vo.getCr_thumb() == 1) {
			updateReplyRecommend(vo); // bf_reply update
			num = getReplyRecommend(vo.getCr_code());
		}else {
			updateReplyDecommend(vo); // bf_reply update
			num = getReplyDecommend(vo.getCr_code());
		}
		return num;
	}
	
	private void updateReplyRecommend(ThumbVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		cineDAO.updateReplyRecommend(vo);
	}
	
	private void updateReplyDecommend(ThumbVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		cineDAO.updateReplyDecommend(vo);
	}
	
	private int getReplyRecommend(int cr_code) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		int num = cineDAO.getReplyRecommend(cr_code);
		return num;
	}

	private int getReplyDecommend(int cr_code) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		int num = cineDAO.getReplyDecommend(cr_code);
		return num;
	}
	
	@Override
	public int insertReplyWarn(WarnVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		ReplyWarnCount(vo.getCr_code()); // 신고수 1 증가
		int num = cineDAO.insertReplyWarn(vo); 
		
		return num;
	}
	
	private void ReplyWarnCount(int cr_code) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		cineDAO.ReplyWarnCount(cr_code);
	}
	
	@Override
	public String ReplyWarn(WarnVO vo) {
		CineDAO cineDAO = sqlSession.getMapper(CineDAO.class);
		
		WarnVO warnVO = cineDAO.ReplyWarn(vo);
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertReplyWarn(vo));  // 1
		}
		
		return msg;
	}
}
