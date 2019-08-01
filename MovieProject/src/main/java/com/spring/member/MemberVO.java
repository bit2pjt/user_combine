package com.spring.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int id;				//멤버ID(회원 식별 번호)
	private String m_nickname;	//닉네임
	private String m_image;		//프로필사진
	private String m_email;		//이메일
	private String m_eagree;	//이메일 수신동의
	private String m_sagree;	//sms 수신동의
	private String m_name;		//이름
	private String m_phone;		//전화번호
	private String m_cert;		//이메일 인증여부
	private String m_password;	//패스워드
	private Date m_regdate;		//회원가입일
	private Date m_update_date;	//회원정보 수정일
	private String m_deleteyn;	//탈퇴여부
	private int m_following;	//팔로잉수
	private int m_follower;		//팔로워수
	private String m_level;		//엠블럼 등급
	private String m_favorite;	//선호장르
	private String m_blacklist;	//블랙리스트 여부
}