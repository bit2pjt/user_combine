package com.spring.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	enum cert {Y, N}
	enum deleteyn {YES, NO}
	enum level {BRONZE, SILVER, GOLD, PLATINUM}
	enum blacklist {G, Y, R, B}
	
	private int id;
	private String m_nickname;
	private String m_image;
	private String m_email;
	private String m_eagree;
	private String m_sagree;
	private String m_name;
	private String m_phone;
	private cert m_cert;
	private String m_password;
	private Date m_regdate;
	private Date m_update_date;
	private String m_deleteyn;
	private int m_following;
	private int m_follower;
	private String m_level;
	private String m_favorite;
	private String m_blacklist;

	public void setM_cert (cert Y) {
		this.m_cert = Y;
	}



}
