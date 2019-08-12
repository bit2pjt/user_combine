
package com.spring.mml;


import com.spring.mypage.MyPageDAO;
import com.spring.mypage.OneVO;
import com.spring.paging.SearchCriteria;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.member.MemberVO;
import com.spring.mypage.MyPageDAO;

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
	

}