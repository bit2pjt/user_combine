package com.spring.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	enum level {BRONZE, SILVER, GOLD, PLATINUM}
		
	private int id;
	private String m_nickname;
	private String m_image;
	private String m_email;
	private String m_eagree;
	private String m_sagree;
	private String m_name;
	private String m_phone;
	private String m_cert;
	private String m_password;
	private Date m_regdate;
	private Date m_update_date;
	private String m_deleteyn;
	private int m_following;
	private int m_follower;
	private String m_level;
	private String m_favorite;
	private String m_blacklist;

	public void setM_level (String BRONZE) {
		this.m_level = BRONZE;
	}



}
