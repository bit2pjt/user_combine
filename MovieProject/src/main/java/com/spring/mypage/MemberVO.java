package com.spring.mypage;

/**
* @Class Name : MemberVO.java
* @Description : 멤버 데이터 - 멤버테이블의 컬럼명과 동일하게 작성
* @Modification Information
* @
* @  수정일     	  수정자                 수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.17     한유진      최초생성
* @author bit 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by Bit All right reserved.
*/

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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_eagree() {
		return m_eagree;
	}
	public void setM_eagree(String m_eagree) {
		this.m_eagree = m_eagree;
	}
	public String getM_sagree() {
		return m_sagree;
	}
	public void setM_sagree(String m_sagree) {
		this.m_sagree = m_sagree;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_cert() {
		return m_cert;
	}
	public void setM_cert(String m_cert) {
		this.m_cert = m_cert;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public Date getM_update_date() {
		return m_update_date;
	}
	public void setM_update_date(Date m_update_date) {
		this.m_update_date = m_update_date;
	}
	public String getM_deleteyn() {
		return m_deleteyn;
	}
	public void setM_deleteyn(String m_deleteyn) {
		this.m_deleteyn = m_deleteyn;
	}
	public int getM_following() {
		return m_following;
	}
	public void setM_following(int m_following) {
		this.m_following = m_following;
	}
	public int getM_follower() {
		return m_follower;
	}
	public void setM_follower(int m_follower) {
		this.m_follower = m_follower;
	}
	public String getM_level() {
		return m_level;
	}
	public void setM_level(String m_level) {
		this.m_level = m_level;
	}
	public String getM_favorite() {
		return m_favorite;
	}
	public void setM_favorite(String m_favorite) {
		this.m_favorite = m_favorite;
	}
	public String getM_blacklist() {
		return m_blacklist;
	}
	public void setM_blacklist(String m_blacklist) {
		this.m_blacklist = m_blacklist;
	}
	
	
}
