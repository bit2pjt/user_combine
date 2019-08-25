package com.spring.mypage;

import java.util.List;

import com.spring.boardFree.BoardFreeVO;
import com.spring.member.MemberVO;
import com.spring.paging.Criteria;
import com.spring.paging.SearchCriteria;

/**
 * @Class Name : MyPageService.java
 * @Description :
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2019.07.17 한유진 최초생성 @ 2019.07.24 박현민 one_get 부분 추가
 * @author bit 2조
 * @since 2019. 07.01
 * @version 1.0
 * @see
 *
 *      Copyright (C) by Bit All right reserved.
 */

public interface MyPageService {

	public MemberVO getMember(int id);
	public List<MemberVO> getMembers();
	void updateMember(MemberVO memberVO);

	void updatePw(MemberVO memberVO);

	void updateNick(MemberVO memberVO);

	int checkNick(String m_nickname);

	// 멤버데이터 가져오기, 수정하기, 탈퇴요청하기
	public String getMemberName(String m_email); // 멤버 이름 가져오기

	public int getMemberId(String m_email); // 멤버 아이디 가져오기

	public String getMemberNickname(String m_email); // 멤버 닉네임 가져오기

	public int insertProfileImage(int id, String m_image);	//프로필 사진 등록하기
	// 1:1 문의내역 리스트 가져오기
	public List<OneVO> getQnaList(int id); // 1:1문의 리스트 가져오기
	List<OneVO> listCriteria(Criteria criteria);
	int countArticles(Criteria criteria);

	// 1:1 문의 등록하기, 가져오기, 수정하기, 삭제하기
	public int insertQna(OneVO oneVO); // 1:1 문의 등록

	public OneVO getQnaDetail(int qna_no); // 1:1 문의 상세정보 가져오기

	public int updateQna(OneVO oneVO); // 1:1 문의 상세정보 수정하기
	
	public int deleteQna(int qna_no); // 1:1 문의 삭제하기

	// hm| 1:1문의 답변 가져오기
	public OneAdVO getQnaAdDetail(int qna_no); // 1:1문의 답변 상세정보 가져오기

	// kgh | 비밀번호 체크, 탈퇴, 신청시간
	// 회원 비밀번호 체크
	public boolean checkPw(String m_email, String m_password);

	// 회원 탈퇴신청
	public int delete_member(String m_email);

	// 회원 탈퇴 신청시간
	public int delete_date(int id);
	
	public List<FolFolDTO> getfollower(int id);
	public List<FolFolDTO> getfollowing(int id);
	
	public int getFreeCount(int id);
	public int getShareCount(int id);
	public List<MyBoardDTO> freeBoard(Criteria criteria);
	public List<MyBoardDTO> shareBoard(Criteria criteria);

}
