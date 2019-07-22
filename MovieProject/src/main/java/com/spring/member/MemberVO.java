package com.spring.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
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
