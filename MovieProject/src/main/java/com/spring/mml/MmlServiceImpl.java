package com.spring.mml;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.boardFree.ThumbVO;
import com.spring.boardFree.WarnVO;
import com.spring.member.MemberVO;
import com.spring.mypage.MyPageDAO;
import com.spring.paging.SearchCriteria;

@Service("mmlService")
public class MmlServiceImpl implements MmlService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MmlDAO mmlDAO;

	////////////////
	// 유진 개발부분//
	////////////////

	@Override
	public Mml_ContentVO getMmlContent(int mml_num) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		Mml_ContentVO mml_ContentVO = mmlDAO.getMmlContent(mml_num);
		return mml_ContentVO;
	}

	@Override
	public int insertMml(Mml_ContentVO mmlContentVO) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int result = mmlDAO.insertMml(mmlContentVO);
		return result;
	}

	@Override
	public int updateMml(Mml_ContentVO mmlContentVO) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int result = mmlDAO.updateMml(mmlContentVO);
		return result;
	}
	
	@Override
	public int getMmlNum(Mml_ContentVO mmlContentVO) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int result = mmlDAO.getMmlNum(mmlContentVO);
		System.out.println("mmlWriteAction test : " + mmlContentVO.getId() +", " + mmlContentVO.getMi_code()+", "+ mmlContentVO.getMml_title());
		System.out.println("result : " + result);
		return result;
	}
	
	@Override
	public List<Mml_ContentVO> getMmlList_like_top3(int id) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ContentVO> mmlList = mmlDAO.getMmlList_like_top3(id);

		return mmlList;
	}
	
	////////////////
	// 웅식 개발부분//
	////////////////

	@Override
	public Mml_ContentVO getPage(int mml_num) {
		System.out.println(mml_num); // ok
		Mml_ContentVO content = mmlDAO.getMmlContent2(mml_num); // null 값 발생
		System.out.println("게시글 조회 반환결과 = " + content);

		return content;
	}

	public MemberVO getMemberInfo(int member) {
		// System.out.println(content.getId());
		MemberVO memberInfo = mmlDAO.getMemberInfo(member);
		// System.out.println(content);
		System.out.println(memberInfo);
		return memberInfo;
	}

	@Override
	public int getContFollower(int id) {
		return mmlDAO.getCountFollower(id);
	}
	
	@Override
	public int getContFollowing(int id) {
		return mmlDAO.getCountFollowing(id);
	}

	@Override
	public int getCountLike(int mml_num) {
		return mmlDAO.getCountLike(mml_num);
	}

	@Override
	@Transactional
	public String registerFR(int followee, int follower) {
		if (followee == follower) { // 재귀검사는 향후 없애는게 좋을듯 하다. 아예 버튼을 노출시키지 않도록 화면에서 처리하는게 좋을테니
			return "followItSelf";
		} else {
			// 중복확인
			if (mmlDAO.FROverlapedChk(followee, follower) != 0) {
				return "overlaped";
			} else {
				// 자기팔로우와 중복팔로우가 아니라면 관계 추가
				// 이어서 테이블 업데이트. 항상 1을 추가한다.
				mmlDAO.registerFR(followee, follower);
				mmlDAO.updateMml_follower(followee);
				System.out.println("성공 : 팔로우 맺기");
				return "success";
			}
		}
	}

	@Override
	@Transactional
	public String giveLike(int giver, int mml_num) {
		if (mmlDAO.giveLikeOverlapCheck(giver, mml_num) != 0) {
			return "overlaped";
		} else { // 중복이 아닌 경우는
			mmlDAO.giveLike(giver, mml_num);
			mmlDAO.updateMml_like(mml_num);
			System.out.println("성공 : 추천주기");
			return "success";
		}
	}

	@Override
	@Transactional
	public String giveWarning(int warner, int mml_num) {
		if (mmlDAO.giveWarningOverlapCheck(warner, mml_num) != 0) {
			return "overlaped";
		} else {// 중복이 아닌 경우는
			mmlDAO.giveWarning(warner, mml_num);
			mmlDAO.updateMml_warn_count(mml_num);
			System.out.println("성공 : 추천주기");
			return "success";
		}
	}

	@Override
	public void upCounter(int mml_num) {
		mmlDAO.upCounter(mml_num);
	}

	@Override
	public void mmlDelete(int mml_num) {
		mmlDAO.mmlDelete(mml_num);
	}

	@Override
	@Transactional
	public List<MemberVO> getFollowList(int id) {
		// 1. 게시자 id를 기준으로 팔로워 명단을 뽑는다.
		List<Integer> list = mmlDAO.getFollowListFromMF_table(id);
		System.out.println(id + "회원을 따르는 놈팽이들은" + list);
		System.out.println("가보자!!!! 일단 List형태로 데이터 in");
		// 2. 배열같은 자료구조를 넣어서 여러 값을 호출... 어떻게??
		List<MemberVO> result = mmlDAO.getFollowers(list);
		System.out.println("반환된 데이터는 다음과 같다." + result);
		return result;
	}
	
	@Override
	@Transactional
	public List<MemberVO> getFollowingList(int id) {
		// 1. 게시자 id를 기준으로 팔로워 명단을 뽑는다.
		List<Integer> list = mmlDAO.getFollowingListFromMF_table(id);
		System.out.println(id + "회원이 따르는 놈팽이들은" + list);
		System.out.println("가보자!!!! 일단 List형태로 데이터 in");
		// 2. 배열같은 자료구조를 넣어서 여러 값을 호출... 어떻게??
		List<MemberVO> result = mmlDAO.getFollowers(list);
		System.out.println("반환된 데이터는 다음과 같다." + result);
		return result;
	}

	////////////////
	// 상필 개발부분//
	////////////////
	@Override
	public List<Mml_ContentVO> getMmlList() {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ContentVO> mmlList = mmlDAO.getMmlList();

		return mmlList;
	}

	@Override
	public List<Mml_ContentVO> getMmlList_like() {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ContentVO> mmlList = mmlDAO.getMmlList_like();

		return mmlList;
	}

	@Override
	public List<Mml_ContentVO> getMmlList_user(int id) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ContentVO> mmlList = mmlDAO.getMmlList_user(id);

		return mmlList;
	}

	@Override
	public String getMemberNickname(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		String m_nickname = mypageDAO.getMemberNickname(m_email);

		return m_nickname;
	}

	@Override
	public String getMmlNickname(int id) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		String m_nickname = mmlDAO.getMmlNickname(id);
		return m_nickname;
	}

	@Override
	public String getMemberName(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		String m_name = mypageDAO.getMemberName(m_email);
		return m_name;
	}

	@Override
	public int getMemberId(String m_email) {
		MyPageDAO mypageDAO = sqlSession.getMapper(MyPageDAO.class);
		int id = mypageDAO.getMemberId(m_email);
		return id;
	}
	
	@Override
	public int getMmlId(int mml_num) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int id = mmlDAO.getMmlId(mml_num);
		return id;
	}
	
	@Override
	public int getMmlContentNum(int id) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int mml_num = mmlDAO.getMmlContentNum(id);
		return mml_num;
	}
	
	
	@Override
	public int countSearchedArticles(SearchCriteria searchCriteria) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		return mmlDAO.countSearchedArticles(searchCriteria);
	}

	@Override
	public List<Mml_ListDTO> listSearch(SearchCriteria searchCriteria) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ListDTO> list = mmlDAO.listSearch(searchCriteria);

		return list;
	}

	@Override
	public int countSearchedArticles2(SearchCriteria searchCriteria) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		return mmlDAO.countSearchedArticles2(searchCriteria);
	}

	@Override
	public List<Mml_ListDTO> listSearch2(SearchCriteria searchCriteria) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		List<Mml_ListDTO> list = mmlDAO.listSearch2(searchCriteria);

		return list;
	}

	@Override
	public String reply_check(ThumbVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		// mml_thumb 테이블에 해당 id가 있는지 확인 , 추천을 눌렀는지 안눌렀는지를 확인
		ThumbVO thumbVO = mmlDAO.reply_check(vo); 
		String msg = "";
		
		if( thumbVO != null) {// mml_thumb테이블에 해당 댓글번호가 있으면 중복 추천/비추천 불가
			msg ="fail";
		}else { 
			msg = String.valueOf(replyRecommend(vo)); // mml_reply에서 추천수를 가져와서 보여준다.
		}
		return msg;
	}

	@Override
	public int replyRecommend(ThumbVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		mmlDAO.replyRecommend(vo); // mmlr_thumb 추가
		int num=0;
		System.out.println("mmlr_thumb: " + vo.getMml_reply_code());
		if(vo.getMmlr_thumb() == 1) {
			updateReplyRecommend(vo); // mml_reply update
			num = getReplyRecommend(vo.getMml_reply_code());
		}else {
			updateReplyDecommend(vo); // mml_reply update
			num = getReplyDecommend(vo.getMml_reply_code());
		}
		return num;
	}
	

	private int getReplyRecommend(int mml_reply_code) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int num = mmlDAO.getReplyRecommend(mml_reply_code);
		return num;
	}
	

	private int getReplyDecommend(int mml_reply_code) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		int num = mmlDAO.getReplyDecommend(mml_reply_code);
		return num;
	}
	
	
	private void updateReplyRecommend(ThumbVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		mmlDAO.updateReplyRecommend(vo);
	}
	
	private void updateReplyDecommend(ThumbVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		mmlDAO.updateReplyDecommend(vo);
	}
	
	@Override
	public String ReplyWarn(WarnVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		WarnVO warnVO = mmlDAO.ReplyWarn(vo);
		String msg = "";
		
		if(warnVO != null) {
			msg = "fail";
		}else {
			msg = String.valueOf(insertReplyWarn(vo));  // 1
		}
		
		return msg;
	}
	
	private void ReplyWarnCount(int rno) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		mmlDAO.ReplyWarnCount(rno);
	}
	
	@Override
	public int insertReplyWarn(WarnVO vo) {
		MmlDAO mmlDAO = sqlSession.getMapper(MmlDAO.class);
		ReplyWarnCount(vo.getMml_reply_code()); // 신고수 1 증가
		int num = mmlDAO.insertReplyWarn(vo); 
		
		return num;
	}
}// e_MmlServiceImpl